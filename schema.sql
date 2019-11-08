CREATE DATABASE products;
USE products;

CREATE TABLE products (
  id INTEGER NOT NULL PRIMARY_KEY AUTO_INCREMENT,
  name NOT NULL VARCHAR(50),
  description  VARCHAR(1000),
  slogan  VARCHAR(1000),
  category  VARCHAR(50),
  default_price INTEGER,
  PRIMARY KEY(ID)
)

CREATE TABLE features (
  id INTEGER NOT NULL PRIMARY_KEY AUTO_INCREMENT,
  feature NOT NULL VARCHAR(50),
  value VARCHAR(50),
  product_id INTEGER,
  FOREIGN KEY(product_id)
)

CREATE TABLE styles (
  id INTEGER NOT NULL PRIMARY_KEY AUTO_INCREMENT,
  name VARCHAR(50),
  sale_price INTEGER,
  original_price INTEGER,
  product_id INTEGER,
  FOREIGN KEY(product_id)
)

CREATE TABLE photos (
  id INTEGER NOT NULL PRIMARY_KEY AUTO_INCREMENT,
  style_id INTEGER,
  url VARCHAR(500),
  thumbnail_url VARCHAR(500),
  FOREIGN KEY(style_id)
)

CREATE TABLE skus (
  id INTEGER NOT NULL PRIMARY_KEY AUTO_INCREMENT,
  style_id INTEGER,
  size VARCHAR(10),
  quantity INTEGER
)

CREATE TABLE related_products (
  id INTEGER NOT NULL PRIMARY_KEY AUTO_INCREMENT,
  current_product_id INTEGER,
  related_product_id INTEGER
)