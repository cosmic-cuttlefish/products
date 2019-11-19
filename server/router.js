const {productsController} = require('./controllers/productsController')
const {stylesController} = require('./controllers/stylesController')
const {relatedProductsController} = require('./controllers/relatedController')
const router = require('express').Router();

router.get('/list', productsController.getListOfProducts)
router.get('/:product_id', productsController.getSingleProduct)
router.get('/:product_id/styles', stylesController.getProductStyles)
router.get('/:product_id/related', relatedProductsController.getRelatedProducts)

module.exports = router;