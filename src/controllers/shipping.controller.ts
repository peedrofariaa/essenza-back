import { Request, Response } from 'express'
import axios from 'axios'

const SUPERFRETE_API = 'https://api.superfrete.com'
const TOKEN = process.env.SUPERFRETE_TOKEN
const CEP_ORIGEM = process.env.SUPERFRETE_CEP_ORIGEM

type ShippingItem = {
  quantity: number
  weight: number // kg
  height: number // cm
  width: number // cm
  length: number // cm
}

export async function calculateShipping(req: Request, res: Response) {
  try {
    const { cep_destino, items } = req.body as {
      cep_destino: string
      items: ShippingItem[]
    }

    if (!cep_destino || !items || items.length === 0) {
      return res.status(400).json({ error: 'CEP e itens são obrigatórios' })
    }

    // Calcular dimensões totais (simplificado - você pode ajustar)
    const totalWeight = items.reduce((sum, item) => sum + item.weight * item.quantity, 0)
    const maxHeight = Math.max(...items.map((i) => i.height))
    const maxWidth = Math.max(...items.map((i) => i.width))
    const totalLength = items.reduce((sum, item) => sum + item.length * item.quantity, 0)

    const response = await axios.post(
      `${SUPERFRETE_API}/api/v0/calculator`,
      {
        from: { postal_code: CEP_ORIGEM },
        to: { postal_code: cep_destino.replace(/\D/g, '') },
        package: {
          height: Math.max(maxHeight, 2), // mínimo 2cm
          width: Math.max(maxWidth, 11), // mínimo 11cm
          length: Math.max(totalLength, 16), // mínimo 16cm
          weight: Math.max(totalWeight, 0.3), // mínimo 300g
        },
        services: '1,2', // 1=PAC, 2=SEDEX
      },
      {
        headers: {
          'Content-Type': 'application/json',
          Authorization: `Bearer ${TOKEN}`,
        },
      },
    )

    // Filtrar apenas opções disponíveis
    const options = response.data
      .filter((opt: any) => !opt.error)
      .map((opt: any) => ({
        id: opt.id,
        name: opt.name,
        company: opt.company.name,
        price: Math.round(opt.price * 100), // converter para centavos
        delivery_time: opt.delivery_time,
        currency: 'BRL',
      }))

    if (options.length === 0) {
      return res.status(400).json({ error: 'Nenhuma opção de frete disponível para este CEP' })
    }

    return res.json({ options })
  } catch (error: any) {
    console.error('Erro ao calcular frete:', error.response?.data || error.message)
    return res.status(500).json({ error: 'Erro ao calcular frete' })
  }
}
