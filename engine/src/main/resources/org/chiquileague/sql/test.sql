-- CREATE DATABASE test;
-- USE test;
-- DROP DATABASE test;

INSERT INTO country (id, name) VALUES 
    (1,"Argentina"),
    (2,"Brasil")
;

INSERT INTO competition (id, name, competition_format, type) VALUES
    (1,"Primera División (Argentina)","DOUBLE_ROUND_ROBIN","LEAGUE"),
    (2,"Primera Nacional (Argentina)","DOUBLE_ROUND_ROBIN", "LEAGUE"),
    (3,"Campeonato Brasileiro Serie A","DOUBLE_ROUND_ROBIN", "LEAGUE"),
    (4,"Campeonato Brasileiro Serie B","DOUBLE_ROUND_ROBIN", "LEAGUE"),
    (5,"Copa Argentina","KNOCKOUT", "NATIONAL_CUP"),
    (6,"Copa do Brasil","KNOCKOUT", "NATIONAL_CUP"),
    (7,"Copa Libertadores","GROUP_KNOCKOUT", "INTERNATIONAL_CUP")
;

INSERT INTO league (id, country_id, league_rank) VALUES
    (1, 1, 1),  -- Primera División, Argentina
    (2, 1, 2),  -- Primera Nacional, Argentina
    (3, 2, 1),  -- Brasileirao A, Brasil
    (4, 2, 2)   -- Brasileirao B, Brasil
;

INSERT INTO national_cup (id, country_id) VALUES
	(5,1),	-- Copa Argentina, Argentina
    (6,2)   -- Copa Do Brasil, Brasil
;

INSERT INTO international_cup (id) VALUES
	(7)  -- Libertadores
;

INSERT INTO international_cup_country (id, country_id) VALUES 
	(7, 1),  -- Libertadores, Argentina
    (7, 2)   -- Libertadores, Brasil
;

-- Club: CA River Plate
INSERT INTO club (id, name, league_id) VALUES (1, 'CA River Plate', 1);
INSERT INTO stadium (id, name, capacity, club_id) VALUES (1, 'Mâs Monumental', 85018, 1);
INSERT INTO youth_academy (id, club_id) VALUES (1, 1);
INSERT INTO participates (competition_id, club_id) VALUES (1, 1);
INSERT INTO participates (competition_id, club_id) VALUES (5, 1);
INSERT INTO participates (competition_id, club_id) VALUES (7, 1);

-- Franco Armani
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (2, 'Franco Armani', '1986-10-16', 38, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (2, 43, 46, 70, 77, 59, 77, 64, 77, 67, 69);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (2, 'Derecho', 1.89, 2, 1, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (2, 1);

-- Paulo Díaz
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (4, 'Paulo Díaz', '1994-08-25', 30, 'Chile');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (4, 86, 49, 75, 70, 57, 55, 43, 50, 79, 68);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (4, 'Derecho', 1.78, 4, 1, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (4, 2);
INSERT INTO player_position (player_id, position_id) VALUES (4, 3);
INSERT INTO player_position (player_id, position_id) VALUES (4, 4);

-- Enzo Pérez
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (16, 'Enzo Pérez', '1986-02-22', 39, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (16, 65, 85, 49, 68, 72, 65, 85, 90, 52, 48);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (16, 'Derecho', 1.78, 16, 1, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (16, 5);
INSERT INTO player_position (player_id, position_id) VALUES (16, 6);
INSERT INTO player_position (player_id, position_id) VALUES (16, 10);

-- Facundo Colidio
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (29, 'Facundo Colidio', '2000-01-04', 25, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (29, 50, 45, 56, 70, 66, 76, 51, 86, 46, 81);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (29, 'Derecho', 1.8, 29, 1, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (29, 9);
INSERT INTO player_position (player_id, position_id) VALUES (29, 12);
INSERT INTO player_position (player_id, position_id) VALUES (29, 10);



-- Club: CA Boca Juniors
INSERT INTO club (id, name, league_id) VALUES (2, 'CA Boca Juniors', 1);
INSERT INTO stadium (id, name, capacity, club_id) VALUES (2, 'Alberto J. Armando', 54000, 2);
INSERT INTO youth_academy (id, club_id) VALUES (2, 2);
INSERT INTO participates (competition_id, club_id) VALUES (1, 2);
INSERT INTO participates (competition_id, club_id) VALUES (5, 2);
INSERT INTO participates (competition_id, club_id) VALUES (7, 2);

-- Agustín Marchesín
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (36, 'Agustín Marchesín', '1988-03-16', 37, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (36, 56, 76, 60, 62, 56, 58, 51, 84, 81, 81);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (36, 'Derecho', 1.88, 36, 2, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (36, 1);

-- Nicolás Figal
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (42, 'Nicolás Figal', '1994-04-03', 31, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (42, 87, 52, 47, 90, 46, 70, 78, 57, 55, 80);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (42, 'Derecho', 1.8, 42, 2, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (42, 2);
INSERT INTO player_position (player_id, position_id) VALUES (42, 4);

-- Malcom Braida
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (62, 'Malcom Braida', '1997-05-17', 28, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (62, 51, 42, 49, 78, 74, 45, 40, 84, 86, 46);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (62, 'Derecho', 1.75, 62, 2, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (62, 7);
INSERT INTO player_position (player_id, position_id) VALUES (62, 3);
INSERT INTO player_position (player_id, position_id) VALUES (62, 12);

-- Kevin Zenón
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (65, 'Kevin Zenón', '2001-07-30', 23, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (65, 64, 80, 61, 90, 87, 61, 90, 41, 43, 64);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (65, 'Izquierdo', 1.77, 65, 2, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (65, 12);
INSERT INTO player_position (player_id, position_id) VALUES (65, 13);
INSERT INTO player_position (player_id, position_id) VALUES (65, 7);


-- Club: CA San Martín (Tucumán)
INSERT INTO club (id, name, league_id) VALUES (31, 'CA San Martín (Tucumán)', 2);
INSERT INTO stadium (id, name, capacity, club_id) VALUES (31, 'La Ciudadela', 28500, 31);
INSERT INTO youth_academy (id, club_id) VALUES (31, 31);
INSERT INTO participates (competition_id, club_id) VALUES (2, 31);
INSERT INTO participates (competition_id, club_id) VALUES (5, 31);

-- Darío Sand
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (878, 'Darío Sand', '1988-02-04', 37, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (878, 40, 53, 63, 40, 62, 61, 84, 52, 81, 70);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (878, 'Derecho', 1.8, 878, 31, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (878, 1);

-- Guillermo Rodríguez
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (882, 'Guillermo Rodríguez', '2002-07-04', 23, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (882, 67, 79, 69, 48, 42, 68, 77, 82, 66, 56);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (882, 'Derecho', 1.75, 882, 31, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (882, 2);

-- Gustavo Abregú
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (890, 'Gustavo Abregú', '1997-07-04', 28, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (890, 43, 52, 66, 55, 71, 43, 55, 73, 49, 47);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (890, 'Derecho', 1.7, 890, 31, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (890, 5);

-- Mauro González
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (898, 'Mauro González', '1996-08-31', 28, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (898, 80, 88, 48, 58, 47, 79, 41, 86, 80, 60);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (898, 'Izquierdo', 1.78, 898, 31, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (898, 10);


-- Club: CA Gimnasia y Esgrima (Mendoza)
INSERT INTO club (id, name, league_id) VALUES (32, 'CA Gimnasia y Esgrima (Mendoza)', 2);
INSERT INTO stadium (id, name, capacity, club_id) VALUES (32, 'Víctor Antonio Legrotaglie', 14000, 32);
INSERT INTO youth_academy (id, club_id) VALUES (32, 32);
INSERT INTO participates (competition_id, club_id) VALUES (2, 32);
INSERT INTO participates (competition_id, club_id) VALUES (5, 32);

-- Lautaro Petruchi
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (909, 'Lautaro Petruchi', '1998-09-01', 26, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (909, 86, 79, 86, 72, 54, 89, 77, 86, 55, 44);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (909, 'Derecho', 1.84, 909, 32, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (909, 1);

-- Imanol González
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (912, 'Imanol González', '1998-01-06', 27, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (912, 79, 71, 42, 61, 77, 83, 40, 81, 67, 72);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (912, 'Izquierdo', 1.84, 912, 32, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (912, 2);

-- Fermín Antonini
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (923, 'Fermín Antonini', '1997-07-02', 28, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (923, 88, 79, 55, 55, 61, 80, 66, 73, 62, 87);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (923, 'Derecho', 1.74, 923, 32, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (923, 5);

-- Facundo Lencioni
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (930, 'Facundo Lencioni', '2001-02-14', 24, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (930, 80, 78, 48, 83, 60, 66, 66, 61, 58, 47);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (930, 'Izquierdo', 1.8, 930, 32, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (930, 12);


-- Club: SE Palmeiras
INSERT INTO club (id, name, league_id) VALUES (67, 'SE Palmeiras', 3);
INSERT INTO stadium (id, name, capacity, club_id) VALUES (67, 'Allianz Parque', 43713, 67);
INSERT INTO youth_academy (id, club_id) VALUES (67, 67);
INSERT INTO participates (competition_id, club_id) VALUES (3, 67);
INSERT INTO participates (competition_id, club_id) VALUES (6, 67);
INSERT INTO participates (competition_id, club_id) VALUES (7, 67);

-- Weverton
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (1927, 'Weverton', '1987-12-13', 37, 'Brasil');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (1927, 66, 56, 72, 76, 68, 77, 54, 78, 69, 59);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (1927, 'Derecho', 1.89, 1927, 67, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (1927, 1);

-- Murilo
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (1931, 'Murilo', '1997-03-27', 28, 'Brasil');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (1931, 52, 40, 78, 75, 72, 89, 40, 53, 60, 72);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (1931, 'Derecho', 1.88, 1931, 67, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (1931, 2);

-- Lucas Evangelista
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (1946, 'Lucas Evangelista', '1995-05-06', 30, 'Brasil');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (1946, 44, 49, 63, 78, 54, 70, 50, 60, 71, 71);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (1946, 'Izquierdo', 1.81, 1946, 67, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (1946, 6);

-- Estêvão
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (1954, 'Estêvão', '2007-04-24', 18, 'Brasil');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (1954, 61, 70, 65, 74, 88, 81, 61, 85, 72, 46);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (1954, 'Izquierdo', 1.76, 1954, 67, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (1954, 13);


-- Club: CR Flamengo
INSERT INTO club (id, name, league_id) VALUES (68, 'CR Flamengo', 3);
INSERT INTO stadium (id, name, capacity, club_id) VALUES (68, 'Estádio Jornalista Mário Filho', 78838, 68);
INSERT INTO youth_academy (id, club_id) VALUES (68, 68);
INSERT INTO participates (competition_id, club_id) VALUES (3, 68);
INSERT INTO participates (competition_id, club_id) VALUES (6, 68);
INSERT INTO participates (competition_id, club_id) VALUES (7, 68);

-- Agustín Rossi
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (1961, 'Agustín Rossi', '1995-08-21', 29, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (1961, 49, 74, 86, 52, 87, 41, 67, 77, 48, 75);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (1961, 'Derecho', 1.93, 1961, 68, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (1961, 1);

-- Léo Ortiz
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (1964, 'Léo Ortiz', '1996-01-03', 29, 'Brasil');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (1964, 54, 76, 79, 87, 87, 60, 73, 62, 79, 69);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (1964, 'Derecho', 1.85, 1964, 68, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (1964, 2);

-- Nicolás de la Cruz
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (1980, 'Nicolás de la Cruz', '1997-06-01', 28, 'Uruguay');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (1980, 69, 45, 70, 45, 60, 53, 59, 46, 67, 76);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (1980, 'Derecho', 1.67, 1980, 68, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (1980, 6);

-- Luiz Araújo
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (1988, 'Luiz Araújo', '1996-06-02', 29, 'Brasil');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (1988, 60, 59, 40, 68, 52, 52, 87, 72, 74, 88);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (1988, 'Izquierdo', 1.75, 1988, 68, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (1988, 13);


-- Club: Club Athletico Paranaense
INSERT INTO club (id, name, league_id) VALUES (87, 'Club Athletico Paranaense', 4);
INSERT INTO stadium (id, name, capacity, club_id) VALUES (87, 'Ligga Arena', 42372, 87);
INSERT INTO youth_academy (id, club_id) VALUES (87, 87);
INSERT INTO participates (competition_id, club_id) VALUES (4, 87);
INSERT INTO participates (competition_id, club_id) VALUES (6, 87);

-- Mycael
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (2586, 'Mycael', '2004-03-12', 21, 'Brasil');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (2586, 40, 61, 74, 56, 60, 60, 61, 71, 68, 56);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (2586, 'Izquierdo', 1.91, 2586, 87, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (2586, 1);

-- Lucas Belezi
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (2591, 'Lucas Belezi', '2003-05-08', 22, 'Brasil');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (2591, 56, 52, 71, 73, 73, 62, 62, 71, 85, 73);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (2591, 'Derecho', 1.86, 2591, 87, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (2591, 2);

-- Felipinho
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (2602, 'Felipinho', '2001-10-18', 23, 'Brasil');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (2602, 89, 83, 41, 79, 65, 74, 56, 74, 82, 69);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (2602, 'Izquierdo', 1.83, 2602, 87, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (2602, 6);

-- Tevis
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (2612, 'Tevis', '2006-01-28', 19, 'Brasil');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (2612, 78, 43, 65, 76, 55, 83, 47, 87, 43, 58);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (2612, 'Ambidiestro', 1.8, 2612, 87, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (2612, 13);


-- Club: Coritiba Foot Ball Club
INSERT INTO club (id, name, league_id) VALUES (88, 'Coritiba Foot Ball Club', 4);
INSERT INTO stadium (id, name, capacity, club_id) VALUES (88, 'Estádio Major Antônio Couto Pereira', 40502, 88);
INSERT INTO youth_academy (id, club_id) VALUES (88, 88);
INSERT INTO participates (competition_id, club_id) VALUES (4, 88);
INSERT INTO participates (competition_id, club_id) VALUES (6, 88);

-- Pedro Morisco
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (2618, 'Pedro Morisco', '2004-01-10', 21, 'Brasil');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (2618, 85, 57, 66, 43, 43, 68, 81, 81, 41, 64);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (2618, 'Derecho', 1.91, 2618, 88, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (2618, 1);

-- Bruno Viana
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (2622, 'Bruno Viana', '1995-02-05', 30, 'Brasil');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (2622, 54, 59, 42, 68, 86, 43, 40, 78, 84, 74);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (2622, 'Derecho', 1.86, 2622, 88, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (2622, 2);

-- Geovane Meurer
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (2635, 'Geovane Meurer', '2002-05-25', 23, 'Brasil');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (2635, 85, 51, 68, 88, 83, 78, 72, 47, 87, 77);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (2635, 'Izquierdo', 1.74, 2635, 88, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (2635, 5);

-- Carlos de Pena
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (2640, 'Carlos de Pena', '1992-03-11', 33, 'Uruguay');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (2640, 66, 80, 62, 51, 71, 78, 74, 60, 53, 58);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (2640, 'Izquierdo', 1.77, 2640, 88, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (2640, 12);


-- Matches
INSERT INTO f_match (id,date, home_goals, away_goals, home_club_id, away_club_id, stadium_id, competition_id, matchday) VALUES
	(1,'2025-02-01',1,2,2,1,2,1,1),
	(2,'2025-02-01',0,3,31,32,31,2,1),
	(3,'2025-02-02',1,1,67,68,67,3,1),
	(4,'2025-02-02',1,0,87,88,87,4,1),
	(5,'2025-02-12',1,0,1,31,1,5,null),
	(6,'2025-02-12',1,2,32,2,32,5,null),
	(7,'2025-02-12',2,2,67,87,67,6,null),
	(8,'2025-02-12',1,1,88,68,88,6,null),
	(9,'2025-02-20',1,1,67,2,67,7,null),
	(10,'2025-02-20',2,1,1,68,1,7,null)
;

UPDATE participates SET points = points+0, losses = losses+1, goals_for = goals_for+1, goals_against = goals_against+2 WHERE (competition_id = 1 AND club_id = 2);
UPDATE participates SET points = points+3, wins = wins+1, goals_for = goals_for+2, goals_against = goals_against+1 WHERE (competition_id = 1 AND club_id = 1);

UPDATE participates SET points = points+0, losses = losses+1, goals_for = goals_for+0, goals_against = goals_against+3 WHERE (competition_id = 2 AND club_id = 31);
UPDATE participates SET points = points+3, wins = wins+1, goals_for = goals_for+3, goals_against = goals_against+0 WHERE (competition_id = 2 AND club_id = 32);

UPDATE participates SET points = points+1, draws = draws+1, goals_for = goals_for+1, goals_against = goals_against+1 WHERE (competition_id = 3 AND club_id = 67);
UPDATE participates SET points = points+1, draws = draws+1, goals_for = goals_for+1, goals_against = goals_against+1 WHERE (competition_id = 3 AND club_id = 68);

UPDATE participates SET points = points+3, wins = wins+1, goals_for = goals_for+1, goals_against = goals_against+0 WHERE (competition_id = 4 AND club_id = 87);
UPDATE participates SET points = points+0, losses = losses+1, goals_for = goals_for+0, goals_against = goals_against+1 WHERE (competition_id = 4 AND club_id = 88);

UPDATE participates SET points = points+3, wins = wins+1, goals_for = goals_for+1, goals_against = goals_against+0 WHERE (competition_id = 5 AND club_id = 1);
UPDATE participates SET points = points+0, losses = losses+1, goals_for = goals_for+0, goals_against = goals_against+1 WHERE (competition_id = 5 AND club_id = 31);

UPDATE participates SET points = points+0, losses = losses+1, goals_for = goals_for+1, goals_against = goals_against+2 WHERE (competition_id = 5 AND club_id = 32);
UPDATE participates SET points = points+3, wins = wins+1, goals_for = goals_for+2, goals_against = goals_against+1 WHERE (competition_id = 5 AND club_id = 2);

UPDATE participates SET points = points+1, draws = draws+1, goals_for = goals_for+2, goals_against = goals_against+2 WHERE (competition_id = 6 AND club_id = 67);
UPDATE participates SET points = points+1, draws = draws+1, goals_for = goals_for+2, goals_against = goals_against+2 WHERE (competition_id = 6 AND club_id = 87);

UPDATE participates SET points = points+1, draws = draws+1, goals_for = goals_for+1, goals_against = goals_against+1 WHERE (competition_id = 6 AND club_id = 88);
UPDATE participates SET points = points+1, draws = draws+1, goals_for = goals_for+1, goals_against = goals_against+1 WHERE (competition_id = 6 AND club_id = 68);

UPDATE participates SET points = points+1, draws = draws+1, goals_for = goals_for+1, goals_against = goals_against+1 WHERE (competition_id = 7 AND club_id = 67);
UPDATE participates SET points = points+1, draws = draws+1, goals_for = goals_for+1, goals_against = goals_against+1 WHERE (competition_id = 7 AND club_id = 2);

UPDATE participates SET points = points+3, wins = wins+1, goals_for = goals_for+2, goals_against = goals_against+1 WHERE (competition_id = 7 AND club_id = 1);
UPDATE participates SET points = points+0, losses = losses+1, goals_for = goals_for+1, goals_against = goals_against+2 WHERE (competition_id = 7 AND club_id = 68);


-- Saves
INSERT INTO game (name, club_id, time) VALUES
	('river1', 1, '2025-05-05')
;
