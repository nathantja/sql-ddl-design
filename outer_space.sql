-- TABLE PLANETS
-- name, text or varchar() PRIMARY KEY
-- orbital period in years, NUMERIC(x, 3)
-- star_name - REFERENCES STARS,  FOREIGN KEY

-- STARS -€ PLANET

-- TABLE STARS
-- name, text or varchar() PRIMARY KEY
-- star temp in kelvin, INT

-- PLANET -€ MOON

-- TABLE MOONS
-- name, text or varchar() PRIMARY KEY
-- planet_name, REFERENCES PLANETS, FOREIGN KEY

-- TODO: star / planet / moon - not specific enough. "name" would work better.
-- have a good defense for decision
-- FIXME: Numeric's job is to preserve exact number. less useful for a "measured value"
-- float works better in this case

CREATE TABLE stars (
    star VARCHAR(50) PRIMARY KEY,
    star_temp_kelvin INT NOT NULL);

CREATE TABLE planets (
    planet VARCHAR(50) PRIMARY KEY,
    orbital_period_yrs NUMERIC(10,3) NOT NULL,
    star_name VARCHAR(50) REFERENCES stars NOT NULL);

CREATE TABLE moons (
    moon VARCHAR(50) PRIMARY KEY,
    planet_name VARCHAR(50) REFERENCES planets NOT NULL);



INSERT INTO stars (star, star_temp_kelvin)
VALUES
('The Sun', 5800),
('Proxima Centauri', 3042),
('Gliese 876', 3192);

INSERT INTO planets (planet, orbital_period_yrs, star_name)
VALUES
('Earth', 1.00, 'The Sun'),
('Mars', 1.882, 'The Sun'),
('Venus', 0.62, 'The Sun'),
('Proxima Centauri b', 0.03, 'Proxima Centauri'),
('Gliese 876 b', 0.236, 'Gliese 876');

INSERT INTO moons (moon, planet_name)
VALUES
('The Moon', 'Earth'),
('Phobos', 'Mars'),
('Deimos', 'Mars');



SELECT planet, star_name AS star, COUNT(moons.planet_name) AS moon_count
    FROM moons
    RIGHT OUTER JOIN planets
    ON moons.planet_name = planet
    GROUP BY planet, star_name
    ORDER BY planet;