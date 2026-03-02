/// <reference types="node" />

import { PrismaClient, $Enums } from '../src/generated/prisma'
const prisma = new PrismaClient()

async function upsertProduct(data: {
  name: string
  slug: string
  price_in_cents: number
  description: string
  category: (typeof $Enums.Category)[keyof typeof $Enums.Category]
  stock?: number
  images?: { url: string; alt?: string; position?: number }[]
}) {
  await prisma.productImage.deleteMany({
    where: {
      product: { slug: data.slug },
    },
  })
  const product = await prisma.product.upsert({
    where: { slug: data.slug },
    create: {
      name: data.name,
      slug: data.slug,
      price_in_cents: data.price_in_cents,
      description: data.description,
      category: data.category,
      stock: data.stock ?? 100,
      active: true,
      images: data.images ? { create: data.images } : undefined,
    },
    update: {
      name: data.name,
      price_in_cents: data.price_in_cents,
      description: data.description,
      category: data.category,
      stock: data.stock ?? 100,
      active: true,
      images: data.images ? { create: data.images } : undefined,
    },
    include: { images: true },
  })
  return product
}

async function upsertVariants(
  productId: string,
  variants: Array<{
    label: string
    aroma?: string
    color?: string
    stock?: number
  }>,
) {
  for (const v of variants) {
    await prisma.productVariant.upsert({
      where: {
        productId_label: { productId, label: v.label },
      },
      create: {
        productId,
        label: v.label,
        aroma: v.aroma ?? null,
        color: v.color ?? null,
        stock: v.stock ?? 50,
        active: true,
      },
      update: {
        aroma: v.aroma ?? null,
        color: v.color ?? null,
        stock: v.stock ?? 50,
        active: true,
      },
    })
  }
}

async function main() {
  const velaHasteCanelada = await upsertProduct({
    name: 'Vela Haste Canelada',
    slug: 'vela-haste-canelada',
    price_in_cents: 3000,
    description:
      'Vela Aromática produzida com cera de coco/palma e pavio de algodão. (17cm comprimento e 2cm diâmetro)',
    category: $Enums.Category.VELAS,
    stock: 100,
    images: [
      {
        url: 'https://cdn.essenzame.com.br/products/vela-haste-canelada/1.webp',
        alt: 'Vela haste canelada 1',
        position: 0,
      },
      {
        url: 'https://cdn.essenzame.com.br/products/vela-haste-canelada/2.webp',
        alt: 'Vela haste canelada 2',
        position: 1,
      },
    ],
  })
  await upsertVariants(velaHasteCanelada.id, [
    { label: 'Rosa / Flor de cerejeira', aroma: 'Flor de cerejeira', color: 'Rosa', stock: 0 },
    { label: 'Verde / Capim limão', aroma: 'Capim limão', color: 'Verde', stock: 50 },
    { label: 'Bege / Sândalo', aroma: 'Sândalo', color: 'Bege', stock: 50 },
    { label: 'Roxo / Flor de figo', aroma: 'Flor de figo', color: 'Roxo', stock: 50 },
    { label: 'Lilás / Lavanda e alecrim', aroma: 'Lavanda e alecrim', color: 'Lilás', stock: 50 },
  ])

  const velaNossaSenhora = await upsertProduct({
    name: 'Vela Nossa Senhora',
    slug: 'vela-nossa-senhora',
    price_in_cents: 3000,
    description:
      'Vela Aromática produzida com cera de coco/palma e pavio de algodão. Formato de Nossa Senhora. (10cm altura e 4,5cm largura)',
    category: $Enums.Category.VELAS,
    stock: 1,
    images: [
      {
        url: 'https://cdn.essenzame.com.br/products/vela-nossa-senhora/1.webp',
        alt: 'Vela Nossa Senhora',
        position: 0,
      },
    ],
  })
  await upsertVariants(velaNossaSenhora.id, [
    { label: 'Lavanda e alecrim', aroma: 'Lavanda e alecrim', color: 'Natural', stock: 1 },
  ])

  const velaHasteLisa = await upsertProduct({
    name: 'Vela Haste Lisa',
    slug: 'vela-haste-lisa',
    price_in_cents: 2500,
    description:
      'Vela Aromática produzida com cera de coco/palma e pavio de algodão. (17cm comprimento e 2cm diâmetro)',
    category: $Enums.Category.VELAS,
    stock: 120,
    images: [
      {
        url: 'https://cdn.essenzame.com.br/products/vela-haste-lisa/1.webp',
        alt: 'Vela haste lisa',
        position: 0,
      },
    ],
  })
  await upsertVariants(velaHasteLisa.id, [
    { label: 'Rosa / Flor de cerejeira', aroma: 'Flor de cerejeira', color: 'Rosa', stock: 60 },
    { label: 'Verde / Capim limão', aroma: 'Capim limão', color: 'Verde', stock: 60 },
    { label: 'Bege / Sândalo', aroma: 'Sândalo', color: 'Bege', stock: 60 },
    { label: 'Roxo / Flor de figo', aroma: 'Flor de figo', color: 'Roxo', stock: 60 },
    { label: 'Lilás / Lavanda e alecrim', aroma: 'Lavanda e alecrim', color: 'Lilás', stock: 60 },
  ])

  const casaPortaVela = await upsertProduct({
    name: 'Casa Porta Vela',
    slug: 'casa-porta-vela',
    price_in_cents: 4490,
    description:
      'Porta vela produzido em material orgânico, ps:brinde uma vela réchaut aromática (5,5cm x 5cm x 7,5cm).',
    category: $Enums.Category.DECORACAO,
    stock: 3,
    images: [
      {
        url: 'https://cdn.essenzame.com.br/products/casa-porta-vela/1.webp',
        alt: 'Casa porta vela',
        position: 0,
      },
      {
        url: 'https://cdn.essenzame.com.br/products/casa-porta-vela/2.webp',
        alt: 'Casa porta vela 2',
        position: 1,
      },
      {
        url: 'https://cdn.essenzame.com.br/products/casa-porta-vela/3.webp',
        alt: 'Casa porta vela 3',
        position: 2,
      },
    ],
  })
  await upsertVariants(casaPortaVela.id, [
    { label: 'Verde', aroma: 'Cereja e avelã', color: 'verde', stock: 2 },
    { label: 'Vermelha', aroma: 'Cereja e avelã', color: 'vermelha', stock: 1 },
  ])

  const castiçalVilarejo = await upsertProduct({
    name: 'Castiçal Vilarejo',
    slug: 'castical-vilarejo',
    price_in_cents: 9490,
    description:
      'Porta vela produzido em material orgânico + uma vela haste canelada aromática produzida com cera de coco/palma e pavio de algodão. (base: 14,5 cm de diâmetro, casinhas: 15cm x 4cm | 11,5cm x 3,5cm).',
    category: $Enums.Category.DECORACAO,
    stock: 3,
    images: [
      {
        url: 'https://cdn.essenzame.com.br/products/casti%C3%A7al-vilarejo/1.webp',
        alt: 'Castiçal vilarejo',
        position: 0,
      },
    ],
  })
  await upsertVariants(castiçalVilarejo.id, [
    { label: 'Bege', color: 'bege', stock: 1 },
    { label: 'Branco', color: 'branco', stock: 2 },
  ])

  const velaMassagemConcha = await upsertProduct({
    name: 'Vela de Massagem: Concha',
    slug: 'vela-massagem-concha',
    price_in_cents: 6500,
    description:
      'Vela produzida com cera de Carnaúba, manteiga de Manga e Karite, óleo de semente de uvas e extrato de folha de Oliva. Ao derreter se trasforma em um magnífico óleo hidratante totalmente absrovido pela pele sem deixar melecada.',
    category: $Enums.Category.VELAS,
    stock: 10,
    images: [
      {
        url: 'https://cdn.essenzame.com.br/products/vela-massagem-concha/1.webp',
        alt: 'Vela Massagem Concha',
        position: 0,
      },
    ],
  })
  await upsertVariants(velaMassagemConcha.id, [
    { label: 'Azul', aroma: 'Lavanda com capim limão', color: 'Azul', stock: 2 },
    { label: 'Verde', aroma: 'Lavanda com capim limãoo', color: 'Verde', stock: 2 },
    { label: 'Mostarda', aroma: 'Lavanda com capim limão', color: 'Mostarda', stock: 2 },
    { label: 'Bege', aroma: 'Lavanda com capim limão', color: 'Bege', stock: 2 },
    { label: 'Branca', aroma: 'Lavanda com capim limão', color: 'Branca', stock: 2 },
  ])

  const velaEstrelaMar = await upsertProduct({
    name: 'Vela Estrela do Mar',
    slug: 'vela-estrela-mar',
    price_in_cents: 6000,
    description:
      'Vela Aromática produzida com cera de coco e pavio de algodão, em potes de material orgânico também de fabricação própria em formato de estrela do mar, levam elementos marinhos no topo.',
    category: $Enums.Category.VELAS,
    stock: 8,
    images: [
      {
        url: 'https://cdn.essenzame.com.br/products/vela-estrela-mar/1.webp',
        alt: 'Vela Estrela do Mar',
        position: 0,
      },
      {
        url: 'https://cdn.essenzame.com.br/products/vela-estrela-mar/2.webp',
        alt: 'Vela Estrela do Mar 2',
        position: 1,
      },
    ],
  })
  await upsertVariants(velaEstrelaMar.id, [
    { label: 'Azul/Lavanda com alecrim', aroma: 'Lavanda com alecrim', color: 'Azul', stock: 2 },
    { label: 'Verde/Bamboo', aroma: 'Bamboo', color: 'Verde', stock: 2 },
    { label: 'Bege/Sândalo', aroma: 'Sândalo', color: 'Bege', stock: 2 },
    { label: 'Branca/Chá Branco', aroma: 'Chá branco', color: 'Branca', stock: 2 },
  ])

  const geleiaBanho = await upsertProduct({
    name: 'Geleia de Banho',
    slug: 'geleia-banho',
    price_in_cents: 4500,
    description:
      'Sabonte liquido vegano, biodegradável, com sementes; Maracujá com sementes de Maracujá, Bergamota e Morango com sementes de Gergelim. Por conta da densidade do produto ele mantém as particulas em suspensão. Um toque de glamoure perfume no seu banho diário.',
    category: $Enums.Category.CORPO_BANHO,
    stock: 6,
    images: [
      {
        url: 'https://cdn.essenzame.com.br/products/geleia-banho/1.webp',
        alt: 'Geleia de banho',
        position: 0,
      },
      {
        url: 'https://cdn.essenzame.com.br/products/geleia-banho/2.webp',
        alt: 'Geleia de banho 2',
        position: 1,
      },
    ],
  })
  await upsertVariants(geleiaBanho.id, [
    { label: 'Maracujá', aroma: 'Maracuja', stock: 2 },
    { label: 'Bergamóta', aroma: 'Bergamóta', stock: 2 },
    { label: 'Morango', aroma: 'Morango', stock: 2 },
  ])

  console.log('✅ Seed concluído com sucesso!')
}

main()
  .catch((e) => {
    console.error(e)
    process.exit(1)
  })
  .finally(async () => {
    await prisma.$disconnect()
  })
