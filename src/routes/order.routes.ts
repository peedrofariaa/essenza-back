import { Router } from 'express'
import { createOrder, webhook, getOrderById } from '../controllers/order.controller'
import { requireAuth } from '../middlewares/requireAuth'

const router = Router()

router.post('/create', requireAuth, createOrder)
router.post('/webhook', webhook)
router.get('/:id', requireAuth, getOrderById)

export default router
