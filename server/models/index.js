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

  styles: {
    productStyles: (params) => {
      const stylesQuery = "SELECT * FROM styles WHERE product_id = $1";
      return dbPool.query(stylesQuery, params)
    },

    stylePhotos: (params) => {
      const photosQuery = "SELECT * FROM photos WHERE photos.style_id IN (SELECT styles.id FROM styles WHERE styles.product_id = $1)";
      return dbPool.query(photosQuery, params)
    },

    styleSkus: (params) => {
      const skusQuery = "SELECT * FROM skus WHERE skus.style_id IN (SELECT styles.id FROM styles WHERE styles.product_id = $1)";
      return dbPool.query(skusQuery, params);
    }
  },

  relatedProducts: {
    getRelatedProducts: (params) => {
      const queryStr = "SELECT related_product_id FROM related_products WHERE current_product_id = $1"
      return dbPool.query(queryStr, params)
    }
  }

}