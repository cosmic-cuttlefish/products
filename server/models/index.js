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
    }
  },

  styles: {
    productStyles: (params) => {
      const stylesQuery = "SELECT * FROM styles WHERE product_id = $1";
      // const stylesQuery = "SELECT St.id as style_id, St.default_style, St.name, St.sale_price, St.original_price, (SELECT ARRAY( SELECT json_object_agg('thumbnail_url', photos.thumbnail_url), json_object_agg('url', photos.url) FROM photos  WHERE photos.style_id = St.id) as photos) FROM styles St WHERE St.product_id = $1"
      // const stylesQuery = "SELEC"
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

  // relatedProducts: {
  //   getRelatedProducts: () => {
  //   }
  // }

}