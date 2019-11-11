const { Pool } = require('pg')
const constants = require('../constants')

const pool = new Pool({
  host: 'localhost',
  user: constants.dbUsername,
  database: constants.dbName,
  password: constants.dbPassword,
  port: constants.dbPort
})

module.exports = pool;