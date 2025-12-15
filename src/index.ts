import express from 'express'
import cors from 'cors'
import cookieParser from 'cookie-parser'
import dotenv from 'dotenv'
dotenv.config()
import authRoutes from './routes/auth.routes'
import productsRoutes from './routes/product.routes'
import cartRoutes from './routes/product.routes'
import shippingRoutes from './routes/shipping.routes'
import orderRoutes from './routes/order.routes'

const app = express()

app.use(
  cors({
    origin: process.env.FRONT_ORIGIN || 'http://localhost:5173',
    credentials: true,
  }),
)

app.use(express.json())
app.use(cookieParser())
app.use('/auth', authRoutes)
app.use('/products', productsRoutes)
app.use('/cart', cartRoutes)
app.use('/shipping', shippingRoutes)
app.use('order', orderRoutes)

app.get('/', (_req, res) => {
  res.send('API Essenza no ar!')
})

const PORT = process.env.PORT || 3001
app.listen(PORT, () => {
  console.log(`Servidor rodando na porta ${PORT}`)
})
