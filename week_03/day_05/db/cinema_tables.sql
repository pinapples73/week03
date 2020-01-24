DROP TABLE tickets;
DROP TABLE screenings;
DROP TABLE customers;
DROP TABLE films;

CREATE TABLE customers (
  c_id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  funds INT
);

CREATE TABLE films (
  f_id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  price INT
);

CREATE TABLE screenings (
  s_id SERIAL PRIMARY KEY,
  film_time VARCHAR(255),
  tickets_left INT
);

CREATE TABLE tickets (
  t_id SERIAL PRIMARY KEY,
  customer_id INT REFERENCES customers(c_id) ON DELETE CASCADE,
  film_id INT REFERENCES films(f_id) ON DELETE CASCADE,
  screening_id INT REFERENCES screenings(s_id) ON DELETE CASCADE
);
