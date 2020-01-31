DROP TABLE bitings;
DROP TABLE zombies;
DROP TABLE victims;

CREATE TABLE zombies
(
  id SERIAL primary key,
  name VARCHAR(255) not null,
  type VARCHAR(255)
);

CREATE TABLE victims
(
  id SERIAL primary key,
  name VARCHAR(255) not null,
  run_speed INT
);

CREATE TABLE bitings
(
  id SERIAL primary key,
  victim_id INT references victims(id),
  zombie_id INT references zombies(id)
);