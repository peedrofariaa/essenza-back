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
    stock: 100, // 👈 Adicionar
    images: [
      {
        url: 'https://cdn.essenzame.com.br/products/vela-haste-canelada/1.webp',
        alt: 'Vela haste canelada 1',
        position: 0, // 👈 Adicionar
      },
      // {
      //   url: 'https://cdn.essenzame.com.br/products/vela-haste-canelada/2.webp',
      //   alt: 'Vela haste canelada 2',
      //   position: 1, // 👈 Adicionar quando descomentar
      // },
    ],
  })

  await upsertVariants(velaHasteCanelada.id, [
    { label: 'Rosa / Flor de cerejeira', aroma: 'Flor de cerejeira', color: 'Rosa', stock: 50 },
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
    stock: 80, // 👈 Adicionar
    images: [
      {
        url: 'https://cdn.essenzame.com.br/products/vela-nossa-senhora/1.webp',
        alt: 'Vela Nossa Senhora',
        position: 0, // 👈 Adicionar
      },
    ],
  })

  await upsertVariants(velaNossaSenhora.id, [
    { label: 'Lavanda e alecrim', aroma: 'Lavanda e alecrim', color: 'Natural', stock: 80 },
  ])

  const velaHasteLisa = await upsertProduct({
    name: 'Vela Haste Lisa',
    slug: 'vela-haste-lisa',
    price_in_cents: 2500,
    description:
      'Vela Aromática produzida com cera de coco/palma e pavio de algodão. (17cm comprimento e 2cm diâmetro)',
    category: $Enums.Category.VELAS,
    stock: 120, // 👈 Adicionar
    images: [
      {
        url: 'https://cdn.essenzame.com.br/products/vela-haste-lisa/1.webp',
        alt: 'Vela haste lisa',
        position: 0, // 👈 Adicionar
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
