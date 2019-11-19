const {productsModel} = require('../models/productsModel')

module.exports = {
  productsController: {
    getListOfProducts: (reg, res) => {
      productsModel.listProducts()
      .then(results => {
        res.send(results.rows)
      })
      .catch(err => console.error(err))
    },

    getSingleProduct: (req, res) => {
      let params = [req.params.product_id]
      Promise.all([productsModel.singleProduct(params), productsModel.productFeatures(params)])
      .then(data => {
        let product = data[0].rows;
        let featuresResults = data[1].rows;

        let results = product.map(product => {
          product.features = [];

          featuresResults.forEach(feature => {
            return product.features.push({"feature": feature.feature, "value": feature.value})
          })
          return product;
        })
        res.send(results)
      })
      .catch(err => console.error(err))
    }
  }
}