const dbPool = require('../../database/index.js');

module.exports = {
  relatedProductsModel: {
    getRelatedProducts: (params) => {
      const queryStr = "SELECT related_product_id FROM related_products WHERE current_product_id = $1"
      return dbPool.query(queryStr, params)
    }
  }

}