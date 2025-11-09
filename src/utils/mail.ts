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
