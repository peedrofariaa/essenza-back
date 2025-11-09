import { Request, Response } from 'express'
import { prisma } from '../prisma/client'
import { Prisma } from '../generated/prisma'
import { hashPassword, verifyPassword } from '../utils/password'
import { sendResetEmail } from '../utils/mail'
import { newResetToken, resetExpiry } from '../utils/reset'
import { signToken } from '../utils/jwt'

const isProd = process.env.NODE_ENV === 'production'

function setAuthCookie(res: Response, token: string) {
  res.cookie('access_token', token, {
    httpOnly: true,
    secure: isProd,
    sameSite: isProd ? 'lax' : 'lax',
    path: '/',
    maxAge: 15 * 60 * 1000,
  })
}

export const forgotPassword = async (req: Request, res: Response) => {
  const { email } = req.body as { email?: string }
  if (!email) return res.json({ ok: true })

  const user = await prisma.usuario.findUnique({ where: { email } })
  if (!user) return res.json({ ok: true })

  const token = newResetToken()
  const expires = resetExpiry(15)

  await prisma.usuario.update({
    where: { id: user.id },
    data: { resetToken: token, resetExpires: expires },
  })

  const baseUrl = process.env.APP_URL ?? 'http://localhost:5173'
  const link = `${baseUrl}/reset-password?token=${token}&uid=${user.id}`

  try {
    await sendResetEmail(user.email, link)
  } catch {
    // Mesmo com falha no envio, responder ok para não vazar info
  }
  return res.json({ ok: true })
}

export const resetPassword = async (req: Request, res: Response) => {
  const { uid, token, password } = req.body as { uid?: number; token?: string; password?: string }
  if (!uid || !token || !password) {
    return res.status(400).json({ message: 'Dados inválidos.' })
  }

  const user = await prisma.usuario.findUnique({ where: { id: Number(uid) } })
  if (!user || !user.resetToken || !user.resetExpires) {
    return res.status(400).json({ message: 'Link inválido ou expirado.' })
  }

  if (user.resetToken !== token || user.resetExpires < new Date()) {
    return res.status(400).json({ message: 'Link inválido ou expirado.' })
  }

  const passHash = await hashPassword(password)
  await prisma.usuario.update({
    where: { id: user.id },
    data: { password: passHash, resetToken: null, resetExpires: null },
  })

  return res.json({ ok: true })
}

export const me = async (req: Request, res: Response) => {
  const id = (req as any).auth?.sub as number | undefined
  if (!id) return res.status(401).json({ message: 'Unauthorized' })

  const user = await prisma.usuario.findUnique({ where: { id } })
  if (!user) return res.status(404).json({ message: 'Not found' })

  const { ...safe } = user
  return res.json({ user: safe })
}

export const signup = async (req: Request, res: Response) => {
  try {
    const { name, cpf, birth, email, password } = req.body as {
      name: string
      cpf: string
      birth: string
      email: string
      password: string
    }

    if (!name || !cpf || !birth || !email || !password) {
      return res.status(400).json({ message: 'Campos obrigatórios ausentes.' })
    }

    const cleanCPF = cpf.replace(/\D/g, '')

    const nascimento = new Date(`${birth}T00:00:00`)

    if (Number.isNaN(nascimento.getTime())) {
      return res.status(400).json({ message: 'Data de nascimento inválida.' })
    }

    const existente = await prisma.usuario.findFirst({
      where: { OR: [{ email }, { cpf: cleanCPF }] },
      select: { id: true },
    })
    if (existente) {
      return res.status(409).json({ message: 'Email ou CPF já cadastrado.' })
    }

    const senhaHash = await hashPassword(password)

    const user = await prisma.usuario.create({
      data: { name, email, cpf: cleanCPF, birth: nascimento, password: senhaHash },
    })

    const token = signToken({ sub: user.id, email: user.email })
    setAuthCookie(res, token)

    const { ...safe } = user
    return res.status(201).json({ user: safe, token })
  } catch (e: any) {
    if (e instanceof Prisma.PrismaClientKnownRequestError && e.code === 'P2002') {
      return res.status(409).json({ message: 'Email ou CPF já cadastrado.' })
    }
    return res.status(500).json({ message: 'Erro interno.' })
  }
}

export const login = async (req: Request, res: Response) => {
  try {
    const { email, password } = req.body as { email: string; password: string }
    if (!email || !password) {
      return res.status(400).json({ message: 'Email e senha são obrigatórios.' })
    }

    const user = await prisma.usuario.findUnique({ where: { email } })
    if (!user) return res.status(401).json({ message: 'Credenciais inválidas' })

    const ok = await verifyPassword(password, user.password)
    if (!ok) return res.status(401).json({ message: 'Credenciais inválidas' })

    const token = signToken({ sub: user.id, email: user.email })
    setAuthCookie(res, token)

    const { ...safe } = user
    return res.json({ user: safe, token })
  } catch {
    return res.status(500).json({ message: 'Erro interno.' })
  }
}

export const logout = async (_req: Request, res: Response) => {
  res.clearCookie('access_token', {
    httpOnly: true,
    secure: isProd,
    sameSite: isProd ? 'lax' : 'lax',
    path: '/',
  })
  return res.json({ ok: true })
}
