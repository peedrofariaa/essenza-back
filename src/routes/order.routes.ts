import { Router } from 'express'
import {
  createOrder,
  webhook,
  getOrderById,
  getOrderByIdAdmin,
} from '../controllers/order.controller'
import { requireAuth } from '../middlewares/requireAuth'
import { requireAdmin } from '../middlewares/requireAdmin'
import { prisma } from '../lib/client'

const router = Router()

router.post('/create', requireAuth, createOrder)
router.post('/webhook', webhook)
router.get('/admin/:id', requireAuth, getOrderByIdAdmin)
router.get('/:id', requireAuth, getOrderById)

router.get('/', requireAdmin, async (req, res) => {
  const { status, page = '1', per_page = '20' } = req.query as Record<string, string>

  const take = Math.max(1, Number(per_page) || 20)
  const currentPage = Math.max(1, Number(page) || 1)
  const skip = (currentPage - 1) * take

  const where: any = {}
  if (status) where.status = status

  const [data, total] = await Promise.all([
    prisma.order.findMany({
      where,
      include: {
        user: { select: { id: true, name: true, email: true } },
      },
      orderBy: { createdAt: 'desc' },
      skip,
      take,
    }),
    prisma.order.count({ where }),
  ])

  res.json({ data, meta: { total, page: currentPage, per_page: take } })
})

router.patch('/:id/status', requireAdmin, async (req, res) => {
  try {
    const { id } = req.params
    const { status } = req.body

    const order = await prisma.order.update({
      where: { id },
      data: { status },
      include: { user: { select: { id: true, name: true, email: true } } },
    })

    res.json(order)
  } catch (error) {
    console.error('Erro ao atualizar status:', error)
    res.status(500).json({ error: 'Erro ao atualizar status' })
  }
})

export default router
