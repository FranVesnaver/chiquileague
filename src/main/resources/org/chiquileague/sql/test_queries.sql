USE chiqui;

SELECT * FROM country WHERE (id = 1);
SELECT * FROM country WHERE (name = 'Argentina');

-- liga según id
SELECT id, name, competition_format, country_id, league_rank FROM competition 
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
SELECT id, name, competition_format, country_id, league_rank FROM competition
NATURAL JOIN league
WHERE (league.country_id = 1)
;

-- copas nacionales con sus paises
SELECT * FROM competition cmp
NATURAL JOIN national_cup nc
WHERE (cmp.id = 11)
;

-- copas internacionales y paises que participan
SELECT * FROM international_cup NATURAL JOIN competition WHERE (id = 9);
SELECT * FROM international_cup_country WHERE (id = 9);

SELECT * FROM international_cup NATURAL JOIN competition WHERE (name = 'Copa Libertadores');
SELECT id, country_id FROM international_cup_country NATURAL JOIN competition WHERE (name = 'Copa Libertadores');

-- equipos de una liga dada
SELECT club.id, name, league_id FROM club 
JOIN league ON (club.league_id = league.id)
WHERE (league.id = 1)
;

SELECT * FROM club WHERE (id = 1);
SELECT * FROM club WHERE (name = 'River Plate');

-- todas las competiciones
SELECT cmp.id, name, competition_format, lg.country_id AS league_country, league_rank, nc.country_id AS cup_country FROM competition cmp
LEFT OUTER JOIN league lg ON (cmp.id = lg.id)
LEFT OUTER JOIN national_cup nc ON (cmp.id = nc.id)
LEFT OUTER JOIN international_cup ON (cmp.id = international_cup.id);

-- estadios
SELECT * FROM stadium WHERE (club_id = 1);
SELECT * FROM stadium WHERE (id = 1);
SELECT * FROM stadium WHERE (name = 'Mâs Monumental');

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
/*INSERT INTO game (name, club_id, time) VALUES
('river1', 1, '2025-01-01'),
('velez1', 4, '2025-01-01')
;
*/

-- partidos 
/*INSERT INTO f_match (id,date, home_goals, away_goals, home_club_id, away_club_id, stadium_id, competition_id, matchday) VALUES
(1,'2025-02-01',1,2,2,1,2,1,1),
(2,'2025-02-01',1,1,3,4,3,1,1),
(3,'2025-02-02',2,0,5,6,5,1,1),

(4,'2025-02-08',2,3,2,4,2,1,2),
(5,'2025-02-08',2,2,1,5,1,1,2),
(6,'2025-02-09',0,0,6,3,6,1,2),
     
(7,'2025-02-08',0,1,3,1,3,1,3),
     
(8,'2025-02-08',2,1,1,6,1,1,4),
     
(9,'2025-02-08',0,1,4,1,4,1,5)
;
*/

-- stats
INSERT participates (competition_id, club_id, points, wins, draws, losses, goals_for, goals_against) VALUES
	(1,1,7,2,1,0,4,2),
    (1,2,2,0,2,1,1,4),
    (1,3,4,1,1,1,4,3),
    (1,4,4,1,1,1,4,2),
    (1,5,0,0,0,3,0,4),
    (1,6,2,0,2,1,1,2)
;

-- saves
SELECT * FROM game WHERE (id = 2);
SELECT * FROM game WHERE (name = 'river1');
UPDATE game SET time = '2025-01-10' WHERE (id = 1);

-- partidos
SELECT date, c1.name AS home, home_goals AS h, away_goals AS a, c2.name AS away, st.name AS stadium FROM f_match
JOIN club c1 ON (home_club_id = c1.id)
JOIN club c2 ON (away_club_id = c2.id)
JOIN stadium st ON (stadium_id = st.id);

SELECT * FROM f_match WHERE (date = '2025-02-01' AND stadium_id = 2);
SELECT * FROM f_match WHERE (home_club_id = 1 OR away_club_id = 1);
SELECT * FROM f_match WHERE (competition_id = 1);
SELECT * FROM f_match WHERE (date = '2025-02-08');

-- stats
SELECT * FROM participates WHERE (competition_id = 1 AND club_id = 1);
SELECT * FROM participates WHERE (competition_id = 1 AND club_id = 2);

UPDATE participates SET 
points = (points+3),
wins = (wins+1),
draws = (draws+0),
losses = (losses+0),
goals_for = (goals_for+2),
goals_against = (goals_against+0)
WHERE (competition_id = 1 AND club_id = 1);

SELECT name, points, matches_played, wins, draws, losses, goal_difference FROM participates
JOIN club ON (club_id = id)
ORDER BY points DESC, goal_difference DESC;

