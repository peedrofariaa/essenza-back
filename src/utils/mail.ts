import { Resend } from 'resend'

const resend = new Resend(process.env.RESEND_API_KEY!)
const FROM = process.env.RESEND_FROM || 'contato@essenzame.com.br'
const REPLY_TO = 'contato.essenzame@gmail.com'

export async function sendResetEmail(to: string, link: string) {
  await resend.emails.send({
    to,
    from: FROM,
    replyTo: REPLY_TO,
    subject: 'Redefinição de senha - Essenza',
    html: `<div style="font-family:Arial,sans-serif;line-height:1.5;color:#111"> <p>Você solicitou a redefinição de senha.</p> <p>Clique no link (expira em 15 minutos): <a href="${link}">${link}</a></p> <p>Se não foi você, ignore este e-mail.</p> </div>`,
  })
}

type EmailOptions = {
  to: string
  subject: string
  text?: string
  html?: string
}

export async function sendEmail(options: EmailOptions) {
  try {
    const payload = {
      to: options.to,
      from: FROM,
      reply_to: REPLY_TO,
      subject: options.subject,
      ...(options.html ? { html: options.html } : { text: options.text ?? options.subject }),
    }

    await resend.emails.send(payload)
    console.log(`✅ Email enviado para ${options.to}`)
  } catch (error: any) {
    console.error('❌ Erro ao enviar email:', error)
    throw error
  }
}
