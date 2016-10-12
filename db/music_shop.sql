DROP TABLE IF EXISTS instruments;
DROP TABLE IF EXISTS music_shops;

CREATE TABLE music_shops(
id SERIAL4 PRIMARY KEY,
name VARCHAR(255),
address VARCHAR(255),
type VARCHAR(255)
);

CREATE TABLE instruments(
  id SERIAL4 PRIMARY KEY,
  type VARCHAR(255),
  music_shop_id INT4 REFERENCES music_shops(id)
  );