DROP TABLE albums;
DROP TABLE artists;

CREATE TABLE artists(
  id SERIAL PRIMARY KEY,
  artist_name VARCHAR(255)
);

CREATE TABLE albums(
  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  genre VARCHAR(255),
  artist_id INT REFERENCES artists(id)
);
