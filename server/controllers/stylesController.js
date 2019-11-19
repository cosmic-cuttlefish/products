const {stylesModel} = require('../models/stylesModel');

module.exports = {
  stylesController: {
    getProductStyles: (req, res) => {
      let params = [req.params.product_id]
     
      Promise.all([stylesModel.productStyles(params), stylesModel.stylePhotos(params), stylesModel.styleSkus(params)])
      .then((data) => {
        let styles = data[0].rows
        let photos = data[1].rows
        let skus = data[2].rows
        let results = styles.map((style) => {
          style.photos = [];
          style.skus = {};

          photos.forEach(photo => {
            if (photo.style_id === style.id) {
              return style.photos.push({"url": photo.url, "thumbnail_url": photo.thumbnail_url})
            }
          })
          skus.forEach(sku => {
            if (sku.style_id === style.id) {
              return style.skus[sku.size] = sku.quantity;
            }
          })
          return style;
        })
        
        res.send(results)
      })
      .catch((err) => {console.error(err)})
    }
  },
}