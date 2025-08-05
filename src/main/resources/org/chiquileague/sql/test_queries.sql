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

SELECT * FROM club WHERE (id = 1);
SELECT * FROM club WHERE (name = 'River Plate');

-- jugadores de un club dado
SELECT ps.id, ps.name, cl.name AS club FROM person ps
NATURAL JOIN player pl
JOIN club cl ON (pl.club_id = cl.id)
WHERE (cl.id = 1)
;

-- jugadores
SELECT * FROM player NATURAL JOIN person WHERE (id = 11);  -- montiel
SELECT * FROM player NATURAL JOIN person WHERE (name = 'Sebastián Driussi');

-- posiciones
SELECT name AS pos FROM player pl
JOIN player_position pp ON (pp.player_id = pl.id)
JOIN f_position ps ON (pp.position_id = ps.id)
WHERE (pl.id = 9);

SELECT ps.name AS pos FROM person pr NATURAL JOIN player pl
JOIN player_position pp ON (pp.player_id = pl.id)
JOIN f_position ps ON (pp.position_id = ps.id)
WHERE (pr.name = 'Marcos Acuña');

-- saves
SELECT * FROM game WHERE (id = 2);
SELECT * FROM game WHERE (name = 'river1');