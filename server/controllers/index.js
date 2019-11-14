const models = require('../models')

module.exports = {
  products: {
    getListOfProducts: (reg, res) => {
      models.products.listProducts()
      .then(results => {
        res.send(results.rows)
      })
      .catch(err => console.error(err))
    },

    getSingleProduct: (req, res) => {
      console.log("req.params: ", req.params)
      let params = [req.params.product_id]
      models.products.singleProduct(params)
      .then(productResults => {
        console.log("got product");
        models.products.productFeatures(params)
        .then(featureResults => {
          console.log("got features");
          let results = productResults.rows.map(product => {
            product.features = [];

            featureResults.rows.forEach(feature => {
              return product.features.push({"feature": feature.feature, "value": feature.value})
            })
            return product;
          })
          res.send(results);
        }) 
      })
      .catch(err => console.error(err))
    }
  },

  styles: {
    getProductStyles: (req, res) => {
      let params = [req.params.product_id]
      // Call productStyles when it resolves call stylePhotos, then styleSkus
      // when they all resolve map through the styles array, iterate through the photos 
      // check if a photo's style_id equals the style's id and if it does add it into the photos
      // do the same for skus and return the final results array.
      models.styles.productStyles(params)
      .then(stylesResults => {
        models.styles.stylePhotos(params)
        .then(photos => {
          models.styles.styleSkus(params)
          .then(skus => {
            let results = stylesResults.rows.map(style => {
              style.photos = [];
              style.skus = {}
              photos.rows.forEach(photo => {
                if (photo.style_id === style.id) {
                  return style.photos.push({"url": photo.url, "thumbnail_url": photo.thumbnail_url})
                }
              })
              skus.rows.forEach(sku => {
                if (sku.style_id === style.id) {
                  return style.skus[sku.size] = sku.quantity;
                }
              })
              return style;
            })
            res.send(results)
          })
        })
      })
      .catch(err => console.error(err))
    }
  },

  relatedProducts: {
    getRelatedProducts: (req, res) => {
    let params = [req.params.product_id]
    models.relatedProducts.getRelatedProducts(params)
    .then(results => {
      res.send(results.rows.reduce((acc, related) => {
        acc.push(related.related_product_id)
        return acc;
      },[]))
    })
    .catch(err => console.error(err));
  }
  } 
}