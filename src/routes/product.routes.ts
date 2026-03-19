import { Router } from 'express'
import { prisma } from '../lib/client'
import { requireAuth } from '../middlewares/requireAuth'

const router = Router()

router.get('/', async (req, res) => {
  const {
    category,
    search,
    sort = 'name',
    order = 'asc',
    page = '1',
    per_page = '20',
  } = req.query as Record<string, string>

  const take = Math.max(1, Number(per_page) || 20)
  const currentPage = Math.max(1, Number(page) || 1)
  const skip = (currentPage - 1) * take

  const where: any = { active: true }
  if (category) where.category = category
  if (search) where.name = { contains: search, mode: 'insensitive' }

  const [data, total] = await Promise.all([
    prisma.product.findMany({
      where,
      include: { images: { orderBy: { position: 'asc' } } },
      orderBy: { [sort]: order === 'desc' ? 'desc' : 'asc' },
      skip,
      take,
    }),
    prisma.product.count({ where }),
  ])

  res.json({
    data,
    meta: { total, page: currentPage, per_page: take },
  })
})

router.get('/:slug', async (req, res) => {
  const { slug } = req.params
  const product = await prisma.product.findUnique({
    where: { slug },
    include: {
      images: { orderBy: { position: 'asc' } },
      variants: true,
    },
  })
  if (!product || !product.active) return res.status(404).json({ error: 'Not found' })
  res.json(product)
})

router.post('/', requireAuth, async (req, res) => {
  try {
    const {
      name,
      slug,
      description,
      category,
      price_in_cents,
      stock = 0,
      active = true,
      images = [],
      variants = [],
    } = req.body

    const product = await prisma.product.create({
      data: {
        name,
        slug,
        description,
        category,
        price_in_cents,
        stock,
        active,
        images: {
          create: images.map((img: { url: string; alt?: string; position?: number }) => ({
            url: img.url,
            alt: img.alt ?? '',
            position: img.position ?? 0,
          })),
        },
        variants: {
          create: variants.map(
            (v: { label: string; aroma?: string; color?: string; stock?: number }) => ({
              label: v.label,
              aroma: v.aroma,
              color: v.color,
              stock: v.stock ?? 0,
            }),
          ),
        },
      },
      include: { images: true, variants: true },
    })

    res.status(201).json(product)
  } catch (error) {
    console.error('Erro ao criar produto:', error)
    res.status(500).json({ error: 'Erro ao criar produto' })
  }
})

router.put('/:id', requireAuth, async (req, res) => {
  try {
    const { id } = req.params
    const { name, slug, description, category, active, price_in_cents, stock, variants } = req.body

    if (variants?.length) {
      await Promise.all(
        variants.map(
          (v: {
            id: string
            label: string
            aroma?: string
            color?: string
            stock?: number
            active?: boolean
          }) =>
            prisma.productVariant.update({
              where: { id: v.id },
              data: {
                label: v.label,
                aroma: v.aroma,
                color: v.color,
                stock: v.stock ?? 0,
                active: v.active ?? true,
              },
            }),
        ),
      )
    }

    const product = await prisma.product.update({
      where: { id },
      data: { name, slug, description, category, active, price_in_cents, stock },
      include: { images: true, variants: true },
    })

    res.json(product)
  } catch (error) {
    console.error('Erro ao atualizar produto:', error)
    res.status(500).json({ error: 'Erro ao atualizar produto' })
  }
})

router.delete('/:id', requireAuth, async (req, res) => {
  try {
    const { id } = req.params

    await prisma.productImage.deleteMany({ where: { productId: id } })
    await prisma.productVariant.deleteMany({ where: { productId: id } })
    await prisma.product.delete({ where: { id } })

    res.json({ message: 'Produto removido com sucesso' })
  } catch (error) {
    console.error('Erro ao remover produto:', error)
    res.status(500).json({ error: 'Erro ao remover produto' })
  }
})

router.post('/:id/variants', requireAuth, async (req, res) => {
  const { id } = req.params
  const { label, aroma, color, stock } = req.body

  try {
    const variant = await prisma.productVariant.create({
      data: {
        productId: id,
        label,
        aroma: aroma || null,
        color: color || null,
        stock: stock ?? 0,
      },
    })
    res.status(201).json(variant)
  } catch (error: any) {
    if (error.code === 'P2002') {
      return res.status(400).json({ error: 'Já existe uma variante com esse label neste produto' })
    }
    res.status(500).json({ error: 'Erro ao criar variante' })
  }
})

router.post('/:id/images', requireAuth, async (req, res) => {
  const { id } = req.params
  const { url, alt, position } = req.body
  const image = await prisma.productImage.create({
    data: { url, alt: alt ?? '', position: position ?? 0, productId: id },
  })
  res.status(201).json(image)
})

router.delete('/:id/images/:imageId', requireAuth, async (req, res) => {
  const { imageId } = req.params
  await prisma.productImage.delete({ where: { id: imageId } })
  res.json({ message: 'Imagem removida' })
})

export default router
