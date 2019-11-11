const controllers = require('./controllers')
const router = require('express').Router();

router.get('/list', controllers.products.getListOfProducts)

module.exports = router;