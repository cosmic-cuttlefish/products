const express = require('express')
const parser = require('body-parser')
const router = require('./router')

const app = express()
const port = process.env.PORT || 3000

app.use(parser.json())
app.use('/products', router)
app.get('/', (req, res) => res.send('Hello World!'))

app.listen(port, () => console.log(`Example app listening on port ${port}!`))
