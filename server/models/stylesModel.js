const dbPool = require('../../database/index.js');

module.exports = {
  stylesModel: {
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
  }
}