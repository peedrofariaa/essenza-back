import crypto from 'crypto'

export function newResetToken(): string {
  return crypto.randomBytes(32).toString('hex') // 64 chars
}

export function resetExpiry(minutes = 15): Date {
  return new Date(Date.now() + minutes * 60 * 1000)
}
