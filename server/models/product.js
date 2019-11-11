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
