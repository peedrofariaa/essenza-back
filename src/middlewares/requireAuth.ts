import type { Request, Response, NextFunction } from 'express'
import { verifyToken } from '../utils/jwt'

export function requireAuth(req: Request, res: Response, next: NextFunction) {
  let token = req.cookies?.access_token

  if (!token) {
    const authHeader = req.headers.authorization
    if (authHeader && authHeader.startsWith('Bearer ')) {
      token = authHeader.replace('Bearer ', '')
    }
  }

  if (!token) {
    return res.status(401).json({ message: 'Token não fornecido' })
  }

  try {
    const payload = verifyToken<any>(token)
    console.log('🔍 Payload do token:', payload)
    ;(req as any).auth = payload
    ;(req as any).userId = payload.sub

    console.log('🔍 userId extraído:', (req as any).userId)

    return next()
  } catch (error) {
    console.error('❌ Erro ao verificar token:', error)
    return res.status(401).json({ message: 'Token inválido' })
  }
}
