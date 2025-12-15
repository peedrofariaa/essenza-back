import sg from '@sendgrid/mail'

sg.setApiKey(process.env.SENDGRID_API_KEY!)

export async function sendResetEmail(to: string, link: string) {
  await sg.send({
    to,
    from: process.env.SENDGRID_FROM!,
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
  const msg: any = {
    to: options.to,
    from: process.env.SENDGRID_FROM || 'noreply@essenzame.com.br',
    subject: options.subject,
  }

  if (options.html) {
    msg.html = options.html
  }
  if (options.text) {
    msg.text = options.text
  }
  if (!options.html && !options.text) {
    msg.text = options.subject
  }

  try {
    await sg.send(msg)
    console.log(`✅ Email enviado para ${options.to}`)
  } catch (error: any) {
    console.error('❌ Erro ao enviar email:', error.response?.body || error)
    throw error
  }
}
