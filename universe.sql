psql --username=freecodecamp --dbname=postgres

create database universe;

\c universe;

create table galaxy(galaxy_id serial primary key, name varchar(30) unique not null, galaxy_type text, distance_from_earth_in_mpc numeric(4, 3), diameter_in_ly int);

insert into galaxy values ('1','Milky Way', 'SBbc', '0.008', '87400'), ('2','Sagittarius Dwarf Sphr', 'dSph', '0.024', '10000'),('3','Ursa Major II Dwarf', 'dSph', '0.030', '1800'),('4','Segue 2', 'dSph', '0.035', '200'),('5','Large Magellanic Cloud', 'SB(s)m', '0.050', '32200'),('6','Small Magellanic Cloud', 'SB(s)m pec', '0.063', '18900');

/*Reference: https://en.wikipedia.org/wiki/List_of_nearest_galaxies*/

create table star(star_id serial primary key, name varchar(30) unique not null, star_type text, solar_mass numeric(4, 3), galaxy_id int, foreign key(galaxy_id) references galaxy(galaxy_id));

insert into star values ('1','Sun', 'Bright Star', '1.000', '1'), ('2', 'Proxima Centauri', 'Red Dwarf', '0.122', '1'),('3', 'Rigil Kentaurus', 'Bright Star', '1.079', '1'),('4', 'Toliman', 'Bright Star', '0.909', '1'),('5','Barnard Star', 'Red Dwarf', '0.144', '1'),('6', 'Luhman 16 A', 'Brown Dwarf', '0.032', '1');

/*Reference: https://en.wikipedia.org/wiki/List_of_nearest_stars_and_brown_dwarfs*/

create table planet(planet_id serial primary key, name varchar(30) unique not null, planet_type text, has_life boolean, has_ring boolean, number_of_moons int, star_id int, foreign key(star_id) references star(star_id));

insert into planet values ('1', 'Earth', 'Terrestrial Planet', 'true', 'false', '1', '1'), ('2', 'Mercury', 'Terrestrial Planet', 'false', 'false', '0', '1'), ('3', 'Venus', 'Terrestrial Planet', 'false', 'false', '0', '1'), ('4', 'Mars', 'Terrestrial Planet', 'false', 'false', '2', '1'), ('5', 'Jupiter', 'Gas Giant', 'false', 'true', '95', '1'), ('6', 'Saturn', 'Gas Giant', 'false', 'true', '83', '1'), ('7', 'Uranus', 'Ice Giant', 'false', 'true', '27', '1'), ('8', 'Neptune', 'Ice Giant', 'false', 'true', '14', '1'), ('9', 'Ceres', 'Dwarf Planet', 'false', 'false', '0', '1'), ('10', 'Pluto', 'Dwarf Planet', 'false', 'false', '5', '1'), ('11', 'Haumea', 'Dwarf Planet', 'false', 'true', '2', '1'), ('12', 'Makemake', 'Dwarf Planet', 'false', 'true', '1', '1');

/*Reference: https://en.wikipedia.org/wiki/List_of_gravitationally_rounded_objects_of_the_Solar_System*/

create table moon(moon_id serial primary key, name varchar(30) unique not null, numeral int, sideral_period numeric(5, 2), planet_id int, foreign key(planet_id) references planet(planet_id));

insert into moon values ('1', 'Moon', '1', '27.32', '1'), ('2', 'Phobos', '1', '0.32', '4'), ('3', 'Deimos', '2', '1.26', '4'), ('4', 'Io', '1', '1.77', '5'), ('5', 'Europa', '2', '3.55', '5'), ('6', 'Ganymede', '3', '7.15', '5'), ('7', 'Callisto', '4', '16.69', '5'), ('8', 'Amalthea', '5', '0.50', '5'), ('9', 'Himalia', '6', '250.56', '5'), ('10', 'Elara', '7', '259.64', '5'), ('11', 'Pasiphae', '8', '743.63', '5'), ('12', 'Sinope', '9', '758.90', '5'), ('13', 'Lysithea', '10', '259.20', '5'), ('14', 'Carme', '11', '734.17', '5'), ('15', 'Ananke', '12', '629.77', '5'), ('16', 'Leda', '13', '240.92', '5'), ('17', 'Thebe', '14', '0.67', '5'), ('18', 'Adrastea', '15', '0.30', '5'), ('19', 'Metis', '16', '0.29', '5'), ('20', 'Callirrhoe', '17', '758.77', '5');

/*Reference: https://en.wikipedia.org/wiki/List_of_natural_satellites*/

create table celestial_bodies(celestial_bodies_id serial primary key, name varchar(30) unique not null, celestial_bodies_type text);

insert into celestial_bodies values ('1','Milky Way', 'Galaxy'), ('2','Sagittarius Dwarf Sphr', 'Galaxy'),('3','Ursa Major II Dwarf', 'Galaxy'),('4','Segue 2', 'Galaxy'),('5','Large Magellanic Cloud', 'Galaxy'),('6','Small Magellanic Cloud', 'Galaxy'), ('7','Sun', 'Star'), ('8', 'Proxima Centauri', 'Star'),('9', 'Rigil Kentaurus', 'Star'),('10', 'Toliman', 'Star'),('11','Barnard Star', 'Star'),('12', 'Luhman 16 A', 'Star');
