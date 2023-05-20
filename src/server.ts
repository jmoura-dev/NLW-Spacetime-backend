import fastify from 'fastify'
import { memoriesRoutes } from './routes/memories'
const app = fastify()

app.register(memoriesRoutes)

app
  .listen({
    host: '0.0.0.0',
    port: 3333,
  })
  .then(() => {
    console.log(`Server is running on port: ${3333}`)
  })
