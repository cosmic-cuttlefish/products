// Mongo structure separated in different models
product = {
  id: Number,
  name: String,
  slogan: String,
  description: String,
  default_price: String,
  features: Array,
  styles: Array,
  related_products: Array
}

feature = {
  feature: String,
  value: String
}

style = {
  id: Number,
  name: String,
  original_price: String,
  sale_price: String,
  default?: Number,
  photos: Array,
  skus: Object
}

photo = {
  thumbnail: String,
  url: String
}

sku = {
  XS:Number,
  S:Number,
  M:Number,
  L:Number,
  XL:Number
}

