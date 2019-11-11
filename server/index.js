const express = require('express')
const db = require('../database/index.js')
const parser = require('body-parser')
const router = require('./router')

const app = express()
const port = 3000

app.use(parser.json())
app.use('/products', router)
app.get('/', (req, res) => res.send('Hello World!'))

app.listen(port, () => console.log(`Example app listening on port ${port}!`))
