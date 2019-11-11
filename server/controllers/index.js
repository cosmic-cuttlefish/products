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
    }
  }
}