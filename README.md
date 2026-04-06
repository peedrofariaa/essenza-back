# Essenza — Backend

API REST do e-commerce Essenza em produção, construída com Node.js, Express e TypeScript. Cobre autenticação, catálogo, pedidos, pagamentos e frete.

🌐 [essenzame.com.br](https://essenzame.com.br)

## Stack

- Node.js + Express + TypeScript
- Prisma ORM + PostgreSQL
- JWT + bcryptjs
- Nodemailer
- Mercado Pago SDK
- Super Frete API

## O que foi construído

- Autenticação com JWT em cookie HttpOnly, reset de senha por e-mail com token de 15 minutos.
- CRUD de produtos com variantes, imagens e controle de estoque.
- Validação de carrinho no servidor antes de qualquer pedido ser criado.
- Criação de pedidos com integração ao Mercado Pago (PIX, cartão e boleto).
- Cálculo de frete em tempo real via Super Frete.
- Proteção de rotas administrativas com controle por perfil (`role`).
- Migrations versionadas com Prisma.

## Decisões técnicas

- **Cookie HttpOnly em vez de Authorization header** — o token JWT não fica acessível via JavaScript, protegendo contra XSS.
- **Role-based access control simples** — campo `role` no modelo de usuário. Qualquer acesso ao admin sem `role = 'admin'` retorna 403.
- **Validação de carrinho no servidor** — preços, estoque e variantes são revalidados no backend antes da criação do pedido.
- **Resposta neutra no reset de senha** — sempre retorna `ok: true` independente de o e-mail existir, evitando vazamento de dados cadastrais.

## Produção

- API: Railway (deploy automático via GitHub)
- Banco de dados: PostgreSQL
- Frontend: Vercel
- Domínio e SSL: Cloudflare

## Repositórios relacionados

- [essenza-front](https://github.com/peedrofariaa/essenza-front)
- [essenza-admin](https://github.com/peedrofariaa/essenza-admin)
