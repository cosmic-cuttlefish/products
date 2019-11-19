const dbPool = require('../../database/index.js');

module.exports = {
  products: {
    listProducts: () => {
      const queryStr = 'SELECT * FROM products LIMIT 5';
      return dbPool.query(queryStr)
    },
  
    singleProduct: (params) => {
      const queryStr = 'SELECT * FROM products WHERE id = $1';
      return dbPool.query(queryStr, params)
    },

    productFeatures: (params) => {
      const queryStr = "select * from features where product_id = $1";
      return dbPool.query(queryStr, params)
    }
  },
}