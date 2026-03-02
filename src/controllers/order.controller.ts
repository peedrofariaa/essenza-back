import { Request, Response } from 'express'
import { prisma } from '../lib/client'
import { MercadoPagoConfig, Preference, Payment } from 'mercadopago'
import { sendEmail } from '../utils/mail'

const client = new MercadoPagoConfig({
  accessToken: process.env.MERCADOPAGO_ACCESS_TOKEN || '',
})

export async function createOrder(req: Request, res: Response) {
  try {
    const userId = (req as any).userId

    const {
      items,
      subtotal_cents,
      shipping_cents,
      total_cents,
      paymentMethod,
      shippingAddress,
      shippingService,
      shippingDays,
    } = req.body

    if (!items || items.length === 0) {
      return res.status(400).json({ error: 'Carrinho vazio' })
    }

    if (!shippingAddress || !paymentMethod) {
      return res.status(400).json({ error: 'Dados incompletos' })
    }

    const order = await prisma.order.create({
      data: {
        userId,
        status: 'PENDING_PAYMENT',
        items: items,
        subtotal_cents,
        shipping_cents,
        total_cents,
        paymentMethod,
        shippingAddress,
        shippingService,
        shippingDays,
      },
    })

    const user = await prisma.usuario.findUnique({
      where: { id: userId },
    })

    const preference = new Preference(client)

    const preferenceData = await preference.create({
      body: {
        items: items.map((item: any) => ({
          id: item.productId,
          title: item.name,
          quantity: item.quantity,
          unit_price: item.price_in_cents / 100,
          currency_id: 'BRL',
        })),
        shipments: {
          cost: shipping_cents / 100,
          mode: 'not_specified',
        },
        back_urls: {
          success: `${process.env.FRONTEND_URL || 'http://localhost:5173'}/pedido/sucesso?order_id=${order.id}`,
          failure: `${process.env.FRONTEND_URL || 'http://localhost:5173'}/pedido/falha`,
          pending: `${process.env.FRONTEND_URL || 'http://localhost:5173'}/pedido/pendente`,
        },
        ...(process.env.MERCADOPAGO_ACCESS_TOKEN?.startsWith('APP_USR-3') && {
          auto_return: 'approved',
        }),
        external_reference: order.id,
        notification_url: `${process.env.BACKEND_URL || 'http://localhost:3001'}/orders/webhook`,
        payment_methods: {
          installments: 12,
        },
        metadata: {
          order_id: order.id,
          user_email: user?.email,
        },
      },
    })

    await prisma.order.update({
      where: { id: order.id },
      data: { paymentId: preferenceData.id },
    })

    return res.json({
      orderId: order.id,
      paymentUrl: preferenceData.init_point,
      preferenceId: preferenceData.id,
    })
  } catch (error: any) {
    console.error('Erro ao criar pedido:', error)
    return res.status(500).json({ error: 'Erro ao criar pedido' })
  }
}

export async function webhook(req: Request, res: Response) {
  try {
    const type = req.body.type || req.query.topic
    const paymentId = req.body.data?.id || req.query.id

    if (type !== 'payment' || !paymentId) {
      return res.status(200).send('OK')
    }

    const paymentClient = new Payment(client)
    const payment = await paymentClient.get({ id: String(paymentId) })

    const orderReference = payment.external_reference

    if (!orderReference) {
      return res.status(200).send('OK')
    }

    const order = await prisma.order.findUnique({
      where: { id: orderReference },
      include: { user: true },
    })

    if (!order) {
      return res.status(404).json({ error: 'Pedido não encontrado' })
    }

    let newStatus = order.status

    if (payment.status === 'approved' && order.status !== 'PAID') {
      newStatus = 'PAID'

      const items = order.items as any[]

      for (const item of items) {
        if (item.variantId) {
          await prisma.productVariant.update({
            where: { id: item.variantId },
            data: { stock: { decrement: item.quantity } },
          })
        } else {
          await prisma.product.update({
            where: { id: item.productId },
            data: { stock: { decrement: item.quantity } },
          })
        }
      }

      try {
        await sendEmail({
          to: order.user.email,
          subject: 'Pedido confirmado - Essenza',
          html: `
            <h1>Pedido #${order.id} confirmado!</h1>
            <p>Olá ${order.user.name},</p>
            <p>Seu pagamento foi aprovado e seu pedido está sendo preparado.</p>
            <p><strong>Total:</strong> ${(order.total_cents / 100).toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' })}</p>
            <p><strong>Prazo de entrega:</strong> ${order.shippingDays} dias úteis</p>
            <p>Obrigado pela preferência!</p>
          `,
        })
      } catch (emailError) {
        console.error('Erro ao enviar email de confirmação:', emailError)
      }
    } else if (payment.status === 'rejected') {
      newStatus = 'CANCELLED'
    } else if (payment.status === 'in_process' || payment.status === 'pending') {
      newStatus = 'PENDING_PAYMENT'
    }

    await prisma.order.update({
      where: { id: order.id },
      data: { status: newStatus },
    })

    return res.status(200).send('OK')
  } catch (error: any) {
    console.error('Erro no webhook:', error)
    return res.status(500).json({ error: 'Erro ao processar webhook' })
  }
}

export async function getOrderById(req: Request, res: Response) {
  try {
    const { id } = req.params
    const userId = (req as any).userId

    const order = await prisma.order.findUnique({
      where: { id },
    })

    if (!order) {
      return res.status(404).json({ error: 'Pedido não encontrado' })
    }

    if (order.userId !== userId) {
      return res.status(403).json({ error: 'Acesso negado' })
    }

    return res.json(order)
  } catch (error) {
    console.error('Erro ao buscar pedido:', error)
    return res.status(500).json({ error: 'Erro ao buscar pedido' })
  }
}
