const models = require('../models')

module.exports = {
  products: {
    getListOfProducts: (reg, res) => {
      models.products.listProducts()
      .then(results => {
        res.send(results)
      })
      .catch(err => console.error(err))
    },

    getSingleProduct: (req, res) => {
      console.log("req.params: ", req.params)
      let params = [req.params.product_id]
      models.products.singleProduct(params)
      .then(results => {
        console.log("got product")
        res.send(results);
      })
      .catch(err => res.send(err))
    }
  },

  // styles: {
  //   getProductStyles: (req, res) => {
  //     console.log(req.params)
  //     let params = [req.params.product_id]
  //     models.styles.productStyles(params)
  //       .then((results) => {

  //       })
  //   }
  // }
}