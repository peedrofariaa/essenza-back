import dotenv from 'dotenv'
dotenv.config()

import express from 'express'
import cors from 'cors'
import cookieParser from 'cookie-parser'
import authRoutes from './routes/auth.routes'
import productsRoutes from './routes/product.routes'
import cartRoutes from './routes/cart.routes'
import shippingRoutes from './routes/shipping.routes'
import orderRoutes from './routes/order.routes'
import userRoutes from './routes/user.routes'

const app = express()

app.use(
  cors({
    origin: [
      process.env.FRONT_ORIGIN || 'http://localhost:5173',
      'http://localhost:3000', // essenza-admin
    ],
    credentials: true,
  }),
)

app.use(express.json())
app.use(cookieParser())
app.use('/auth', authRoutes)
app.use('/products', productsRoutes)
app.use('/cart', cartRoutes)
app.use('/shipping', shippingRoutes)
app.use('/orders', orderRoutes)
app.use('/users', userRoutes)

app.get('/', (_req, res) => {
  res.send('API Essenza no ar!')
})

const PORT = process.env.PORT || 3001
app.listen(PORT, () => {
  console.log(`Servidor rodando na porta ${PORT}`)
})
