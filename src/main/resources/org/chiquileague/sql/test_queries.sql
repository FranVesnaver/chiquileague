USE chiqui;

SELECT * FROM country WHERE (id = 1);
SELECT * FROM country WHERE (name = 'Argentina');

-- liga según id
SELECT id, name, country_id, league_rank FROM competition 
NATURAL JOIN league
WHERE (id = 1)
;

-- liga según nombre
SELECT id, name, country_id, league_rank FROM competition 
NATURAL JOIN league
WHERE (name = "Primera División (Argentina)")
;

SELECT id, name FROM competition NATURAL JOIN cup;

-- ligas de un país dado
SELECT id, name, league_rank FROM competition
NATURAL JOIN league
WHERE (league.country_id = 1)
;

-- copas nacionales con sus paises
SELECT nc.id, cmp.name AS cup, cnt.name AS country FROM competition cmp
NATURAL JOIN national_cup nc
JOIN country cnt ON (cnt.id = nc.country_id);

-- copas internacionales y paises que participan
SELECT cmp.id, cmp.name AS cup, cnt.name AS country FROM international_cup_country 
NATURAL JOIN competition cmp
JOIN country cnt ON (cnt.id = country_id)
;

-- equipos de una liga dada
SELECT club.id, name, league_id FROM club 
JOIN league ON (club.league_id = league.id)
WHERE (league.id = 1)
;

SELECT ps.id, ps.name, cl.name FROM person ps
NATURAL JOIN player pl
JOIN club cl ON (pl.club_id = cl.id)
WHERE (cl.id = 1)
;