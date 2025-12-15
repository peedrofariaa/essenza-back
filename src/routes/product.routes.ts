import { Router } from 'express'
import { prisma } from '../lib/client'

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

export default router
