const controllers = require('./controllers')
const router = require('express').Router();

router.get('/list', controllers.products.getListOfProducts)
router.get('/list/:product_id', controllers.products.getSingleProduct)

module.exports = router;