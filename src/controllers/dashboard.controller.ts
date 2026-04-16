import { Request, Response } from 'express'
import { prisma } from '../lib/client'

export const getOverview = async (_req: Request, res: Response) => {
  try {
    const now = new Date()
    const startOfMonth = new Date(now.getFullYear(), now.getMonth(), 1)
    const last30Days = new Date(now)
    last30Days.setDate(now.getDate() - 29)

    // Pedidos do mês (apenas pagos/entregues)
    const validStatus = ['PAID', 'PROCESSING', 'SHIPPED', 'DELIVERED']

    const ordersThisMonth = await prisma.order.findMany({
      where: {
        createdAt: { gte: startOfMonth },
        status: { in: validStatus as any },
      },
      select: { total_cents: true, createdAt: true },
    })

    const totalRevenue = ordersThisMonth.reduce((sum, o) => sum + o.total_cents, 0)
    const totalOrders = ordersThisMonth.length
    const avgTicket = totalOrders > 0 ? totalRevenue / totalOrders : 0

    // Total de clientes
    const totalClients = await prisma.usuario.count({
      where: { role: 'customer' },
    })

    // Vendas dos últimos 30 dias agrupadas por dia
    const ordersLast30 = await prisma.order.findMany({
      where: {
        createdAt: { gte: last30Days },
        status: { in: validStatus as any },
      },
      select: { total_cents: true, createdAt: true },
    })

    // Agrupa por dia
    const salesMap: Record<string, number> = {}
    for (let i = 29; i >= 0; i--) {
      const d = new Date(now)
      d.setDate(now.getDate() - i)
      const key = d.toISOString().slice(0, 10)
      salesMap[key] = 0
    }
    for (const order of ordersLast30) {
      const key = order.createdAt.toISOString().slice(0, 10)
      if (salesMap[key] !== undefined) {
        salesMap[key] += order.total_cents
      }
    }

    const salesChart = Object.entries(salesMap).map(([date, total_cents]) => ({
      date,
      total: total_cents / 100,
    }))

    return res.json({
      revenue: totalRevenue / 100,
      orders: totalOrders,
      clients: totalClients,
      avgTicket: avgTicket / 100,
      salesChart,
    })
  } catch (e) {
    console.error(e)
    return res.status(500).json({ message: 'Erro interno.' })
  }
}

export const createManualOrder = async (req: Request, res: Response) => {
  try {
    const { clientName, clientEmail, total_cents, description, createdAt } = req.body as {
      clientName: string
      clientEmail: string
      total_cents: number
      description: string
      createdAt?: string
    }

    if (!clientName || !clientEmail || !total_cents) {
      return res.status(400).json({ message: 'Campos obrigatórios ausentes.' })
    }

    // Busca ou cria usuário pelo email
    let user = await prisma.usuario.findUnique({ where: { email: clientEmail } })
    if (!user) {
      user = await prisma.usuario.create({
        data: {
          name: clientName,
          email: clientEmail,
          cpf: `manual_${Date.now()}`,
          birth: new Date('1990-01-01'),
          password: '',
          role: 'customer',
        },
      })
    }

    const order = await prisma.order.create({
      data: {
        userId: user.id,
        status: 'DELIVERED',
        items: [{ description, quantity: 1 }],
        subtotal_cents: total_cents,
        shipping_cents: 0,
        total_cents,
        paymentMethod: 'manual',
        shippingAddress: { manual: true },
        createdAt: createdAt ? new Date(createdAt) : new Date(),
      },
    })

    return res.status(201).json({ order })
  } catch (e) {
    console.error(e)
    return res.status(500).json({ message: 'Erro interno.' })
  }
}
