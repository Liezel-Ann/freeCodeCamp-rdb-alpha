--create tables
CREATE TABLE galaxy (galaxy_id SERIAL PRIMARY KEY, name VARCHAR(50) UNIQUE NOT NULL, appearance TEXT, diameter_in_km NUMERIC NOT NULL, shape VARCHAR(35), is_dwarf BOOLEAN NOT NULL, is_active BOOLEAN NOT NULL, age_in_millions_of_years INT);

CREATE TABLE star (star_id SERIAL PRIMARY KEY, name VARCHAR(50) UNIQUE NOT NULL, appearance TEXT, diameter_in_km NUMERIC NOT NULL, age_in_millions_of_years INT, type VARCHAR(35), distance_from_earth_in_millions_of_km INT, is_binary BOOLEAN NOT NULL, is_visible_from_earth BOOLEAN NOT NULL, galaxy_id INT REFERENCES galaxy(galaxy_id));

CREATE TABLE planet (planet_id SERIAL PRIMARY KEY, name VARCHAR(50) UNIQUE NOT NULL, appearance TEXT, diameter_in_km NUMERIC NOT NULL, has_life BOOLEAN NOT NULL, type VARCHAR(35), number_of_moons INT, is_dwarf BOOLEAN NOT NULL, star_id INT REFERENCES star(star_id));

CREATE TABLE moon (moon_id SERIAL PRIMARY KEY, name VARCHAR(50) UNIQUE NOT NULL, appearance TEXT, diameter_in_km NUMERIC NOT NULL, tidal_locked BOOLEAN NOT NULL, has_atmosphere BOOLEAN NOT NULL, distance_from_planet_in_km BIGINT, planet_id INT REFERENCES planet(planet_id));

CREATE TABLE black_hole (black_hole_id SERIAL PRIMARY KEY, name VARCHAR(50) UNIQUE NOT NULL, description TEXT, diameter_in_km NUMERIC NOT NULL, shape VARCHAR(35), type VARCHAR(35), is_active BOOLEAN NOT NULL, accretion_disc BOOLEAN NOT NULL, galaxy_id INT REFERENCES galaxy(galaxy_id));

--insert data
INSERT INTO galaxy (name, appearance, diameter_in_km, shape, is_dwarf, is_active, age_in_millions_of_years) VALUES 
('Milky Way', 'A hazy band of light seen in the night sky formed by stars in other arms of the galaxy',	100000,	'Barred spiral', FALSE, TRUE, 13600), 
('Messier 49', 'Has the physical form of a radio galaxy, but it only has the radio emission of a normal galaxy', 157000,	'Elliptical', FALSE, FALSE,	10000), 
('Anodromeda I', 'A faint, elongated grayish or milky oval blur', 2400000, 'Spheroidal', TRUE, FALSE, 10000), 
('Black Eye Galaxy', 'It features a bright, dense central core surrounded by a massive, dark lane of light-absorbing interstellar dust that gives it the look of a bruised eye. Along the boundaries of this dust lane, active star formation produces bright blue clusters of young stars and glowing pink clouds of hydrogen gas', 509000000000000000, 'Spiral',	FALSE, TRUE, 13000), 
('Centaurus A',	'A bright, glowing oval of older red and yellow stars sliced down the middle by a thick, dark, and warped lane of dust and gas', 147000, 'Perculiar lenticular', FALSE, TRUE, 13000), 
('Hydra B',	'A mix of older red giant branch stars and scattered young blue stars', 3060, 'Elongated',	TRUE, TRUE,	13000);

INSERT INTO star (name, appearance, diameter_in_km, age_in_millions_of_years, type, distance_from_earth_in_millions_of_km, is_binary, is_visible_from_earth, galaxy_id) VALUES 
('Sun', 'Shines as a brilliant white sphere of hot plasma', 1390000, 4500, 'G2V', 150, FALSE, TRUE, 1), 
('HD 110067', ' HD 110067 is a bright orange-yellow star with a surface temperature of approximately 5,266 K. This makes it slightly cooler and dimmer than our Sun', 1096423, 2500, 'K0V', 994000000, FALSE, TRUE, 1), 
('Alpheratz A',	'A blue-white star (part of a bright blue-white double star system)', 4098000,	200, 'B8IV-VHgMn', 918000000,	TRUE, TRUE, 3), 
('Alpheratz B',	'Shines with a bright white hue',	2824500, 447, 'A7V', 918000000, TRUE, FALSE, 3), 
('Betelgeuse', 'A distinct, bright orange-red supergiant star marking the shoulder of the constellation Orion', 1200000000, 10, 'M1-M2 la-ab',	6623000000, TRUE, TRUE, 1), 
('Sirius A', 'A bright, sparkling, bluish-white star',	2379294, 240, 'A0/A1V',	81500000,	TRUE, TRUE, 1), 
('Sirius B', 'A faint, hot, blue-white star (though it is overwhelmed by the glare of its much brighter companion, Sirius A)',	12000,	230, 'DA2',	81300000,	TRUE, FALSE, 1),
('Proxima Centauri', 'Small, dim red glow; active flare star', 214500, 4850, 'M1V', 40200000, FALSE, FALSE, 1),
('TRAPPIST-1', 'Ultra-cool, very faint red-orange star; slightly larger than Jupiter', 166000, 7600, 'M8V', 385000000, FALSE, FALSE, 1),
('Kepler-186', 'Dim reddish-orange glow',	728400,	4000, 'M1V', 5477763000, FALSE, FALSE, 1),
('Kepler-22', 'Yellowish-white glow, similar to the Sun', 1210300, 4000, 'G5V', 6092710000, FALSE, FALSE, 1),
('Kepler-16', 'Dual stars: orange primary (~4,242 K) & red secondary (~3,138 K)', 909400, 2000, 'K7V', 2321663000, TRUE, FALSE, 1),
('Helvidios', 'Yellow-white glow, slightly larger than the Sun', 1604400, 4800, 'G2V+', 479091000, FALSE, TRUE, 1);

INSERT INTO planet (name, appearance, diameter_in_km, has_life, type, number_of_moons, is_dwarf, star_id) VALUES 
('Earth', 'A blue and white marble-like sphere from space, with oceans covering about 71% of its surface, swirling white cloud patterns, and green-brown landmasses', 12756, TRUE, 'Terrestrial', 1, FALSE, 1),
('HD 110067 b', 'Likely looks like a hazy, hot mini-Neptune wrapped in a thick, extended atmosphere of hydrogen, helium, and heavier volatile gases', 28032, FALSE, 'sub-Neptune', 0, FALSE, 2),
('Ceres', 'A dark, grayish-brown rocky body dotted with impact craters and bright reflective splotches', 946, FALSE, 'Dwarf', 0, TRUE, 1),
('Mercury', 'A heavily cratered, grayish-brown rocky surface that looks very much like Earth''s Moon, marked by impact basins like the Caloris Basin and long, steep cliffs called scarps', 4879, FALSE, 'Terrestrial', 0, FALSE, 1),
('Saturn', 'A pale yellow-gold or amber planet featuring subtle atmospheric cloud bands and a prominent, dazzling system of bright rings made of billions of chunks of water ice and rock. It also features a unique hexagonal-shaped jet stream at its northern pole', 120536, FALSE, 'Gas giant', 293, FALSE, 1),
('Uranus', 'A smooth, pale blue-green sphere with 13 faint rings and rotates on its side at a 98-degree tilt, making its rings appear vertical', 51118 , FALSE, 'Ice giant', 28, FALSE, 1),
('Eris', 'Bright, highly reflective white-gray surface coated in frozen nitrogen frost', 2330, False, 'Dwarf',	1, True, 1),
('Proxima Centauri b', 'Rocky, likely reddish-brown or oceanic under a dim red sky', 13100, FALSE, 'Terrestrial', 0, FALSE, 8),
('TRAPPIST-1e', 'Earth-sized rocky world, potentially covered in oceans or ice', 11720, FALSE, 'Terrestrial', 0, FALSE, 9),	
('Kepler-186f', 'Rocky, potentially dark-red vegetation or vast oceans', 14900,	FALSE, 'Terrestrial / Super-Earth',	0, FALSE, 10),
('Kepler-22b', 'Deep blue ocean world or thick, hazy gas-enveloped sphere', 30300, FALSE, 'Super-Earth / Mini-Neptune',	0, FALSE, 11),
('Kepler-16b', 'Cold, banded gas giant illuminated by twin suns', 107000, FALSE, 'Gas Giant', 0, FALSE, 12),
('51 Pegasi b', 'Glowing, superheated, turbulent orange-red atmosphere', 171000, FALSE,	'Gas Giant (Hot Jupiter)', 0, FALSE, 13),
('Mars', 'Dusty, rocky surface with a distinct reddish-orange hue caused by iron oxide (rust), featuring polar ice caps, massive volcanoes, and deep canyons', 6779, FALSE, 'Terrestrial', 2, FALSE, 1),
('Jupiter', 'A  Jupiter is a massive, banded sphere featuring alternating light zones and dark belts of swirling ammonia, sulfur, and phosphorus clouds. Its most famous visual landmark is the Great Red Spot, a giant crimson storm wider than Earth. It also possesses a faint, dark ring system', 142984, FALSE, 'Gas giant', 115, FALSE, 1);

INSERT INTO moon (name , appearance, diameter_in_km, tidal_locked, has_atmosphere, distance_from_planet_in_km, planet_id) VALUES 
('Moon', 'Covered in dark basaltic volcanic plains (maria), bright rugged highland terrain, impact craters, and a dark asphalt-like reflectance.', 3476, TRUE, TRUE, 384000, 1),
('Titan', 'Hidden beneath a thick, golden-orange haze of organic smog (tholins). Its surface features dark hydrocarbon sand dunes, mountains, and bright/dark areas alongside liquid methane and ethane lakes, rivers, and seas', 5150, TRUE, TRUE, 1221870 , 5),
('Dione', 'Heavily cratered with a bright, reflective water-ice surface, featuring a darker trailing hemisphere and an extensive network of bright ice cliffs and tectonic faults known as wispy terrain/chasmata', 1123, TRUE, TRUE, 377400, 5),
('Hyperion', 'It looks like a giant cosmic sponge, pumice stone, or potato, featuring deep, sharp-edged, dark-bottomed craters and a porous, low-density water-ice structure (about 40% empty space)', 270, FALSE, FALSE, 1500000, 5),
('Sycorax', 'It appears light-red in the visible spectrum (redder than many other irregular moons like Himalia, likely due to radiation-altered organic molecules on its icy surface). In the near-infrared spectrum, its color turns blue and eventually neutral. It has an irregular, non-spherical shape', 157, FALSE, FALSE, 12193230, 6),
('Ferdinand', 'Small, dark, faint, irregular, and non-spherical in shape (estimated low albedo of about 0.04)', 20, FALSE, FALSE, 20900000, 6),
('Phobos', 'Dark gray, lumpy, heavily cratered, potato-shaped', 22, TRUE, FALSE, 9376,	14),
('Deimos', 'Dark reddish-gray, smooth, cratered, irregular shape', 12, TRUE, FALSE,	23463, 14),
('Io', 'Bright yellow, orange, and red with active volcanoes', 3643, TRUE, TRUE, 421700, 15),
('Europa', 'Smooth, icy white and tan crossed by reddish cracks', 3122, TRUE, TRUE,	670900, 15),
('Ganymede', 'Gray-brown, mix of dark cratered and light grooved terrain', 5268, TRUE, TRUE, 1070400, 15),
('Callisto', 'Dark brown, ancient, covered in bright white craters', 4821, TRUE, TRUE, 1882700, 15),
('Mimas', 'Icy white, heavily cratered, giant Herschel crater', 396, TRUE, FALSE, 185539, 5),
('Enceladus', 'Brilliant white, smooth ice plains, blue "tiger stripe" fractures', 504, TRUE, TRUE, 237948, 5),
('Tethys', 'Bright icy white, heavily cratered, massive canyon (Ithaca Chasma)', 1062, TRUE, FALSE,	294619,	5),
('Atlas', 'A roughly spherical, icy core surrounded by a wide, smooth equatorial ridge that gives it a "flying saucer" or ravioli-like shape. This ridge is formed by fine ring particles accumulating along its equator', 30.2, TRUE, FALSE, 137670, 5),
('Rhea', 'Dirty white ice, heavily cratered with bright wispy streaks', 1528, TRUE, TRUE, 527108, 5),
('Ariel', 'Bright gray icy surface cut by deep valleys and fault canyons', 1158, TRUE, FALSE, 191020, 6),
('Iapetus', 'Two-toned: one hemisphere pitch black, the other bright white', 1469, TRUE, FALSE,	3560820, 5),
('Miranda', 'Gray-white, patchwork of cliffs, canyons, and grooved chevrons', 472, TRUE, FALSE,	129390, 6);

INSERT INTO black_hole (name, description, diameter_in_km, shape, type, is_active, accretion_disc, galaxy_id)
VALUES ('Sagittarius A*', 'An invisible point of extreme gravity surrounded by a swirling disk of superheated gas and dust', 12000000, 'Oblate spheroid', 'Supermassive', FALSE, TRUE, 1),
('Messier 49 central supermassive black hole', 'The black hole sits at the center of Messier 49 (NGC 4472)', 3340000000, 'Oblate',	'Supermassive',	TRUE, TRUE,	2),
('M31', 'The black hole is embedded within a tight, 1-light-year-wide disk of over 400 hot, young blue stars that orbit it at speeds reaching 1,000 kilometers per second. This inner blue disk is nested inside a larger, lopsided ring of older, cooler red stars', 200000000, 'Oblate', 'Supermassive', FALSE, TRUE, 3),
('Cygnus X-1', 'Consists of an invisible, ultra-dense black hole and a visible blue supergiant star named HDE 226868.', 126, 'Oblate speroid', 'Stellar-mass', TRUE, TRUE, 1),
('Gaia-BH1', 'Part of a non-interacting binary star system', 57, 'Spherical', 'Stellar-mass',	FALSE,	FALSE,	1),
('Gaia-BH2', 'A dark, non-luminous stellar remnant', 53, 'Spherical', 'Stellar-mass', FALSE, FALSE, 1);