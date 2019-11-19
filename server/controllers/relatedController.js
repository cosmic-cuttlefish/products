const {relatedProductsModel} = require('../models/relatedModel')

module.exports = {
  relatedProductsController: {
    getRelatedProducts: (req, res) => {
    let params = [req.params.product_id]
    relatedProductsModel.getRelatedProducts(params)
    .then(results => {
      res.send(results.rows.reduce((acc, related) => {
        acc.push(related.related_product_id)
        return acc;
      },[]))
    })
    .catch(err => console.error(err));
  }
  } 
}