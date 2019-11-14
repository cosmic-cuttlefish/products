const controllers = require('./controllers')
const router = require('express').Router();

router.get('/list', controllers.products.getListOfProducts)
router.get('/:product_id', controllers.products.getSingleProduct)
router.get('/:product_id/styles', controllers.styles.getProductStyles)

module.exports = router;