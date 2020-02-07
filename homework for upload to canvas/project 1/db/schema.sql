DROP TABLE artworks;
DROP TABLE categories;
DROP TABLE artists;


CREATE TABLE artists (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255)
);

CREATE TABLE categories (
  id SERIAL PRIMARY KEY,
  type VARCHAR(255)
);

CREATE TABLE artworks (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  details VARCHAR(255),
  date_created VARCHAR(255),
  artist_id INT REFERENCES artists(id) ON DELETE CASCADE,
  category_id INT REFERENCES categories(id) ON DELETE CASCADE
);
