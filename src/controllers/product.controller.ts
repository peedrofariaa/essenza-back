import { Request, Response } from 'express'
import { prisma } from '../lib/client'

export async function listProducts(req: Request, res: Response) {
  try {
    const page = parseInt(req.query.page as string) || 1
    const per_page = parseInt(req.query.per_page as string) || 8
    const sort = (req.query.sort as string) || 'createdAt'
    const order = (req.query.order as 'asc' | 'desc') || 'desc'
    const search = req.query.search as string | undefined
    const category = req.query.category as string | undefined

    const skip = (page - 1) * per_page

    const where: any = { active: true }

    if (search) {
      where.OR = [
        { name: { contains: search, mode: 'insensitive' } },
        { description: { contains: search, mode: 'insensitive' } },
      ]
    }

    if (category) {
      where.category = category
    }

    const [products, total] = await Promise.all([
      prisma.product.findMany({
        where,
        include: {
          images: {
            orderBy: { position: 'asc' },
            take: 1,
          },
          variants: {
            where: { active: true },
            orderBy: { createdAt: 'asc' },
          },
        },
        orderBy: { [sort]: order },
        skip,
        take: per_page,
      }),
      prisma.product.count({ where: { active: true } }),
    ])

    return res.json({
      data: products,
      pagination: {
        page,
        per_page,
        total,
        total_pages: Math.ceil(total / per_page),
      },
    })
  } catch (error) {
    console.error('Erro ao listar produtos:', error)
    return res.status(500).json({ error: 'Erro ao listar produtos' })
  }
}

export async function getProductBySlug(req: Request, res: Response) {
  try {
    const { slug } = req.params

    const product = await prisma.product.findUnique({
      where: { slug, active: true },
      include: {
        images: { orderBy: { position: 'asc' } },
        variants: { where: { active: true }, orderBy: { createdAt: 'asc' } },
      },
    })

    if (!product) {
      return res.status(404).json({ error: 'Produto não encontrado' })
    }

    return res.json(product)
  } catch (error) {
    console.error('Erro ao buscar produto:', error)
    return res.status(500).json({ error: 'Erro ao buscar produto' })
  }
}

export async function getProductsByCategory(req: Request, res: Response) {
  try {
    const { category } = req.params
    const categoryUpper = category.toUpperCase().replace(/-/g, '_')

    const products = await prisma.product.findMany({
      where: {
        active: true,
        category: categoryUpper as any,
      },
      include: {
        images: {
          orderBy: { position: 'asc' },
          take: 1,
        },
        variants: {
          where: { active: true },
          orderBy: { createdAt: 'asc' },
        },
      },
      orderBy: { createdAt: 'desc' },
    })

    return res.json({ data: products })
  } catch (error) {
    console.error('Erro ao buscar produtos por categoria:', error)
    return res.status(500).json({ error: 'Erro ao buscar produtos' })
  }
}
