import { Request, Response } from 'express'
import { prisma } from '../lib/client'

type CartItemInput = {
  productId: string
  variantId: string | null
  quantity: number
}

export async function validateCart(req: Request, res: Response) {
  try {
    const { items } = req.body as { items: CartItemInput[] }

    if (!Array.isArray(items) || items.length === 0) {
      return res.status(400).json({ error: 'Carrinho vazio' })
    }

    const productIds = items.map((i) => i.productId)
    const variantIds = items.map((i) => i.variantId).filter((id): id is string => id !== null)

    const products = await prisma.product.findMany({
      where: { id: { in: productIds } },
      include: {
        variants: variantIds.length > 0 ? { where: { id: { in: variantIds } } } : true,
        images: {
          take: 1,
          orderBy: { position: 'asc' },
        },
      },
    })

    const validatedItems = items
      .map((item) => {
        const product = products.find((p) => p.id === item.productId)
        if (!product) return null
        if (!product.active) return null

        let variantLabel = null
        let stock = product.stock

        if (item.variantId) {
          const variant = product.variants.find((v) => v.id === item.variantId)
          if (!variant) return null
          if (!variant.active) return null
          variantLabel = variant.label
          stock = variant.stock
        }

        const availableQty = Math.min(item.quantity, stock)
        if (availableQty <= 0) return null

        return {
          productId: product.id,
          variantId: item.variantId,
          variantLabel,
          name: product.name,
          slug: product.slug,
          price_in_cents: product.price_in_cents,
          quantity: availableQty,
          image: product.images[0]?.url || null,
          stockAvailable: stock,
          quantityAdjusted: availableQty !== item.quantity,
        }
      })
      .filter((item): item is NonNullable<typeof item> => item !== null)

    if (validatedItems.length === 0) {
      return res.status(400).json({ error: 'Nenhum item válido no carrinho' })
    }

    const subtotal = validatedItems.reduce(
      (sum, item) => sum + item.price_in_cents * item.quantity,
      0,
    )

    return res.json({
      items: validatedItems,
      subtotal,
      totalItems: validatedItems.reduce((sum, item) => sum + item.quantity, 0),
    })
  } catch (error) {
    console.error('Erro ao validar carrinho:', error)
    return res.status(500).json({ error: 'Erro ao validar carrinho' })
  }
}
