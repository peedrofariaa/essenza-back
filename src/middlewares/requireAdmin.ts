import type { Request, Response, NextFunction } from 'express'
import { verifyToken } from '../utils/jwt'

export function requireAdmin(req: Request, res: Response, next: NextFunction) {
  let token = req.cookies?.access_token

  if (!token) {
    const authHeader = req.headers.authorization
    if (authHeader?.startsWith('Bearer ')) {
      token = authHeader.replace('Bearer ', '')
    }
  }

  if (!token) {
    return res.status(401).json({ message: 'Token não fornecido' })
  }

  try {
    const payload = verifyToken<any>(token)

    if (payload.role !== 'ADMIN') {
      return res.status(403).json({ message: 'Acesso negado' })
    }

    ;(req as any).auth = payload
    ;(req as any).userId = payload.sub
    return next()
  } catch {
    return res.status(401).json({ message: 'Token inválido' })
  }
}
