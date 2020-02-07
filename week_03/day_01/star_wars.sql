DROP TABLE lightsabers;
DROP TABLE characters;


CREATE TABLE characters(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  darkside BOOLEAN,
  age INT
);

CREATE TABLE lightsabers(
  id SERIAL PRIMARY KEY,
  hilt_metal VARCHAR(255) NOT NULL,
  colour VARCHAR(255) NOT NULL,
  character_id INT REFERENCES characters(id)
);
INSERT INTO characters (name, darkside, age) VALUES ('Obi-Wan Kenobi', false, 27);
INSERT INTO characters (name, darkside, age) VALUES ('Anakin Skywalker', false, 19);
INSERT INTO characters (name, darkside, age) VALUES ('Darth Maul', true, 32);
INSERT INTO characters (name, darkside, age) VALUES ('Yoda', false, 900);

INSERT INTO lightsabers (colour, hilt_metal, character_id) VALUES ('green', 'palladium', 1);
INSERT INTO lightsabers (colour, hilt_metal, character_id) VALUES ('red', 'gold', 2);
INSERT INTO lightsabers (colour, hilt_metal, character_id) VALUES ('purple', 'titanium', 2);
-- INSERT INTO lightsabers (colour) VALUES ('blue');


SELECT * FROM lightsabers WHERE character_id = 2;
-- SELECT * FROM characters;



--
-- SELECT * FROM characters;
-- -- SELECT name FROM characters;
-- -- SELECT COUNT(*) FROM characters;
--
-- UPDATE characters SET darkside = true;
--
-- UPDATE characters SET darkside = true WHERE name = 'Anakin Skywalker';
--
-- UPDATE characters SET (name, darkside) = ('Darth Vader', true) WHERE name = 'Anakin Skywalker';
--
-- INSERT INTO characters (name,  darkside, age) VALUES ('Luke Skywalker', false, 17);
--
-- UPDATE characters SET age = 99 WHERE name = 'Obi-Wan Kenobi';
--
--
--
-- SELECT * FROM characters;
--
--
-- DELETE FROM characters WHERE name = 'Darth Maul';
--
--
-- SELECT * FROM characters;
--
-- INSERT INTO characters (name, darkside,age) VALUES ('Stormtrooper', true, 25);
-- INSERT INTO characters (name, darkside,age) VALUES ('Stormtrooper', true, 25);
-- INSERT INTO characters (name, darkside,age) VALUES ('Stormtrooper', true, 25);
-- INSERT INTO characters (name, darkside,age) VALUES ('Stormtrooper', true, 25);
-- INSERT INTO characters (name, darkside,age) VALUES ('Stormtrooper', true, 25);
--
-- UPDATE characters SET age = 26 WHERE id = 8;
--
-- SELECT * FROM characters;
