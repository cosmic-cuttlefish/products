/* 
Get all products:
  GET products/list
  page	integer	Selects the page of results to return. Default 1.
  count	integer	Specifies how many results per page to return. Default 5.

Get single product:
  GET products/:productID
  product_id	integer	Required ID of the Product requested

Get product styles:
  GET /products/:product_id/styles
  product_id	integer	Required ID of the Product requested

Get related products
  GET /products/:product_id/related
  product_id	integer	Required ID of the Product requested
*/
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

  // styles: {
  //   productStyles: (params, cb) => {
  //     const stylesQuery = "SELECT * FROM styles WHERE product_id = $1";

  //     dbPool.query(stylesQuery, params, (err, results) => {
  //       cb(err, results);
  //     })
  //   },

  //   stylePhotos: (params, cb) => {
  //     const photosQuery = "SELECT url, thumbnail_url FROM photos WHERE photos.style_id IN (SELECT styles.id FROM styles WHERE styles.product_id = $1)";
  //     dbPool.query(photosQuery, params, (err, results) => {
  //       cb(err, results);
  //     })
  //   },

  //   styleSkus: (params) => {
  //     const skusQuery = "SELECT size, quantity FROM skus WHERE skus.style_id IN (SELECT styles.id FROM styles WHERE styles.product_id = $1);"
  //     dbPool.query(skusQuery, params);
  //   }
  // },

  // relatedProducts: {
  //   getRelatedProducts: () => {
  //   }
  // }

}