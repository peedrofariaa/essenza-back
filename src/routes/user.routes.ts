import { Router } from 'express'
import { prisma } from '../lib/client'
import { requireAuth } from '../middlewares/requireAuth'

const router = Router()

router.get('/', requireAuth, async (req, res) => {
  const { search, page = '1', per_page = '20' } = req.query as Record<string, string>

  const take = Math.max(1, Number(per_page) || 20)
  const currentPage = Math.max(1, Number(page) || 1)
  const skip = (currentPage - 1) * take

  const where: any = {}
  if (search) {
    where.OR = [
      { name: { contains: search, mode: 'insensitive' } },
      { email: { contains: search, mode: 'insensitive' } },
    ]
  }

  const [data, total] = await Promise.all([
    prisma.usuario.findMany({
      where,
      select: {
        id: true,
        name: true,
        email: true,
        cpf: true,
        criadoEm: true,
        _count: { select: { orders: true } },
      },
      orderBy: { criadoEm: 'desc' },
      skip,
      take,
    }),
    prisma.usuario.count({ where }),
  ])

  res.json({ data, meta: { total, page: currentPage, per_page: take } })
})

router.get('/:id', requireAuth, async (req, res) => {
  const id = Number(req.params.id)
  const user = await prisma.usuario.findUnique({
    where: { id },
    select: {
      id: true,
      name: true,
      email: true,
      cpf: true,
      birth: true,
      criadoEm: true,
      orders: {
        orderBy: { createdAt: 'desc' },
        select: {
          id: true,
          status: true,
          total_cents: true,
          paymentMethod: true,
          createdAt: true,
        },
      },
    },
  })
  if (!user) return res.status(404).json({ error: 'Cliente não encontrado' })
  res.json(user)
})

export default router
