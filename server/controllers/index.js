const models = require('../models')

module.exports = {
  products: {
    getListOfProducts: (reg, res) => {
      models.products.listProducts((err, results) => {
        if (err) {
          console.error("error getting products: ", err);
        } else {
          res.send(results)
        }
      })
    },

    getSingleProduct: (req, res) => {
      let params = [req.params.product_id]
      models.products.singleProduct(params, (err, results) => {
        if (err) {
          console.error("error getting product: ", err);
        } else {
          res.send(results);
        }
      })
    }
  }
}