import { Router } from 'express'
import { getOverview, createManualOrder } from '../controllers/dashboard.controller'
import { requireAuth } from '../middlewares/requireAuth'
import { requireAdmin } from '../middlewares/requireAdmin'

const router = Router()

router.get('/overview', requireAuth, requireAdmin, getOverview)
router.post('/manual-order', requireAuth, requireAdmin, createManualOrder)

export default router
