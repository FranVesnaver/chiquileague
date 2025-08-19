-- USE chiqui;

INSERT INTO country (id, name) VALUES 
    (1,"Argentina"),
    (2,"Brasil"),
    (3,"España"),
    (4,"Inglaterra")
;

INSERT INTO competition (id, name, competition_format) VALUES 
    (1,"Primera División (Argentina)","DOUBLE_ROUND_ROBIN"),
    (2,"Primera Nacional (Argentina)","DOUBLE_ROUND_ROBIN"),
    (3,"Campeonato Brasileiro Serie A","DOUBLE_ROUND_ROBIN"),
    (4,"Campeonato Brasileiro Serie B","DOUBLE_ROUND_ROBIN"),
    (5,"La Liga","DOUBLE_ROUND_ROBIN"),
    (6,"Segunda División (España)","DOUBLE_ROUND_ROBIN_PLAYOFFS"),
    (7,"Premier League","DOUBLE_ROUND_ROBIN"),
    (8,"Championship (Inglaterra)","DOUBLE_ROUND_ROBIN_PLAYOFFS"),
    (9,"Copa Libertadores","GROUP_KNOCKOUT"),
    (10,"Champions League","GROUP_KNOCKOUT"),
    (11,"Copa Argentina","KNOCKOUT"),
    (12,"Copa do Brasil","KNOCKOUT"),
    (13,"Copa Del Rey","KNOCKOUT"),
    (14,"The FA Cup","KNOCKOUT")
;

INSERT INTO league (id, country_id, league_rank) VALUES
    (1, 1, 1),  -- Primera División, Argentina
    (2, 1, 2),  -- Primera Nacional, Argentina
    (3, 2, 1),  -- Brasileirao A, Brasil
    (4, 2, 2),  -- Brasileirao B, Brasil
    (5, 3, 1),  -- La Liga, España
    (6, 3, 2),  -- Segunda División, España
    (7, 4, 1),  -- Premier, Inglaterrra
    (8, 4, 2)   -- Championship, Inglaterra
;

INSERT INTO national_cup (id, country_id) VALUES
	(11,1),	-- Copa Argentina, Argentina
    (12,2), -- Copa Do Brasil, Brasil
    (13,3), -- Copa Del Rey, España
    (14,4)  -- The FA Cup, Inglaterra
;

INSERT INTO international_cup (id) VALUES
	(9),  -- Libertadores
    (10)  -- Champions
;

INSERT INTO international_cup_country (id, country_id) VALUES 
	(9, 1),  -- Libertadores, Argentina
    (9, 2),  -- Libertadores, Brasil
    (10, 3), -- Champions, España
    (10, 4) -- Champions, Inglaterra
;

-- Club: CA River Plate
INSERT INTO club (id, name, league_id) VALUES (1, 'CA River Plate', 1);
INSERT INTO stadium (id, name, capacity, club_id) VALUES (1, 'Mâs Monumental', 85018, 1);
INSERT INTO youth_academy (id, club_id) VALUES (1, 1);

-- Conan Ledesma
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (1, 'Conan Ledesma', '1993-02-13', 32, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (1, 82, 48, 78, 46, 73, 60, 72, 47, 72, 85);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (1, 'Derecho', 1.83, 1, 1, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (1, 1);
INSERT INTO contract (id, player_id, club_id, start_date, end_date, wage, release_clause) VALUES (1, 1, 1, '2025-07-28', '2027-12-31', 10000, 3000000);

-- Franco Armani
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (2, 'Franco Armani', '1986-10-16', 38, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (2, 43, 46, 70, 77, 59, 77, 64, 77, 67, 69);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (2, 'Derecho', 1.89, 2, 1, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (2, 1);

-- Lucas Martínez Quarta
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (3, 'Lucas Martínez Quarta', '1996-05-10', 29, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (3, 53, 89, 82, 76, 52, 90, 49, 67, 43, 47);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (3, 'Derecho', 1.83, 3, 1, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (3, 2);
INSERT INTO player_position (player_id, position_id) VALUES (3, 5);

-- Paulo Díaz
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (4, 'Paulo Díaz', '1994-08-25', 30, 'Chile');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (4, 86, 49, 75, 70, 57, 55, 43, 50, 79, 68);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (4, 'Derecho', 1.78, 4, 1, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (4, 2);
INSERT INTO player_position (player_id, position_id) VALUES (4, 3);
INSERT INTO player_position (player_id, position_id) VALUES (4, 4);

-- Lautaro Rivero
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (5, 'Lautaro Rivero', '2003-11-01', 21, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (5, 57, 86, 85, 72, 72, 41, 73, 62, 82, 59);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (5, 'Izquierdo', 1.85, 5, 1, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (5, 2);

-- Federico Gattoni
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (6, 'Federico Gattoni', '1999-02-16', 26, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (6, 80, 48, 68, 47, 57, 76, 51, 40, 56, 68);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (6, 'Derecho', 1.83, 6, 1, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (6, 2);

-- Germán Pezzella
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (7, 'Germán Pezzella', '1991-06-27', 34, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (7, 53, 85, 89, 72, 44, 85, 77, 62, 78, 67);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (7, 'Derecho', 1.87, 7, 1, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (7, 2);

-- Leandro González Pírez
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (8, 'Leandro González Pírez', '1992-02-26', 33, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (8, 41, 86, 53, 47, 49, 77, 70, 76, 84, 51);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (8, 'Derecho', 1.85, 8, 1, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (8, 2);

-- Marcos Acuña
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (9, 'Marcos Acuña', '1991-10-28', 33, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (9, 80, 87, 78, 40, 63, 76, 49, 88, 54, 78);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (9, 'Izquierdo', 1.72, 9, 1, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (9, 3);
INSERT INTO player_position (player_id, position_id) VALUES (9, 7);
INSERT INTO player_position (player_id, position_id) VALUES (9, 12);

-- Milton Casco
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (10, 'Milton Casco', '1988-04-11', 37, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (10, 86, 45, 80, 41, 46, 68, 66, 61, 70, 77);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (10, 'Derecho', 1.7, 10, 1, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (10, 3);
INSERT INTO player_position (player_id, position_id) VALUES (10, 4);
INSERT INTO player_position (player_id, position_id) VALUES (10, 7);

-- Gonzalo Montiel
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (11, 'Gonzalo Montiel', '1997-01-01', 28, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (11, 59, 69, 63, 49, 90, 78, 57, 64, 75, 49);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (11, 'Derecho', 1.75, 11, 1, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (11, 4);

-- Fabricio Bustos
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (12, 'Fabricio Bustos', '1996-04-28', 29, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (12, 71, 44, 75, 45, 76, 76, 64, 58, 72, 64);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (12, 'Derecho', 1.67, 12, 1, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (12, 4);

-- Andrés Herrera
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (13, 'Andrés Herrera', '1998-11-03', 26, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (13, 48, 87, 83, 80, 48, 67, 53, 72, 87, 85);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (13, 'Derecho', 1.85, 13, 1, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (13, 4);

-- Kevin Castaño
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (14, 'Kevin Castaño', '2000-09-29', 24, 'Colombia');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (14, 61, 50, 79, 63, 71, 47, 58, 56, 42, 60);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (14, 'Derecho', 1.77, 14, 1, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (14, 5);
INSERT INTO player_position (player_id, position_id) VALUES (14, 6);

-- Matías Kranevitter
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (15, 'Matías Kranevitter', '1993-05-21', 32, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (15, 49, 69, 68, 83, 77, 60, 43, 81, 67, 61);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (15, 'Derecho', 1.79, 15, 1, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (15, 5);
INSERT INTO player_position (player_id, position_id) VALUES (15, 6);
INSERT INTO player_position (player_id, position_id) VALUES (15, 2);

-- Enzo Pérez
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (16, 'Enzo Pérez', '1986-02-22', 39, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (16, 65, 85, 49, 68, 72, 65, 85, 90, 52, 48);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (16, 'Derecho', 1.78, 16, 1, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (16, 5);
INSERT INTO player_position (player_id, position_id) VALUES (16, 6);
INSERT INTO player_position (player_id, position_id) VALUES (16, 10);

-- Giuliano Galoppo
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (17, 'Giuliano Galoppo', '1999-06-18', 26, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (17, 89, 71, 65, 57, 46, 57, 45, 54, 61, 52);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (17, 'Derecho', 1.79, 17, 1, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (17, 6);
INSERT INTO player_position (player_id, position_id) VALUES (17, 5);
INSERT INTO player_position (player_id, position_id) VALUES (17, 10);

-- Rodrigo Aliendro
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (18, 'Rodrigo Aliendro', '1991-02-16', 34, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (18, 76, 86, 63, 62, 56, 79, 68, 70, 57, 72);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (18, 'Derecho', 1.73, 18, 1, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (18, 6);
INSERT INTO player_position (player_id, position_id) VALUES (18, 5);
INSERT INTO player_position (player_id, position_id) VALUES (18, 10);

-- Giorgio Costantini
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (19, 'Giorgio Costantini', '2006-04-16', 19, 'Brasil');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (19, 56, 68, 71, 80, 40, 62, 78, 74, 66, 77);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (19, 'Izquierdo', 1.85, 19, 1, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (19, 6);

-- Santiago Simón
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (20, 'Santiago Simón', '2002-06-13', 23, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (20, 62, 88, 73, 56, 47, 46, 40, 71, 70, 62);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (20, 'Derecho', 1.81, 20, 1, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (20, 8);
INSERT INTO player_position (player_id, position_id) VALUES (20, 6);
INSERT INTO player_position (player_id, position_id) VALUES (20, 13);

-- Matías Rojas
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (21, 'Matías Rojas', '1995-11-03', 29, 'Paraguay');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (21, 81, 42, 56, 75, 46, 57, 62, 44, 75, 86);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (21, 'Izquierdo', 1.8, 21, 1, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (21, 10);
INSERT INTO player_position (player_id, position_id) VALUES (21, 13);
INSERT INTO player_position (player_id, position_id) VALUES (21, 11);

-- Gonzalo Martínez
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (22, 'Gonzalo Martínez', '1993-06-13', 32, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (22, 47, 67, 54, 69, 87, 84, 72, 49, 59, 85);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (22, 'Izquierdo', 1.72, 22, 1, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (22, 10);
INSERT INTO player_position (player_id, position_id) VALUES (22, 12);
INSERT INTO player_position (player_id, position_id) VALUES (22, 13);

-- Manuel Lanzini
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (23, 'Manuel Lanzini', '1993-02-15', 32, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (23, 60, 66, 65, 83, 79, 54, 80, 49, 66, 64);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (23, 'Derecho', 1.7, 23, 1, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (23, 10);
INSERT INTO player_position (player_id, position_id) VALUES (23, 6);
INSERT INTO player_position (player_id, position_id) VALUES (23, 7);

-- Nacho Fernández
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (24, 'Nacho Fernández', '1990-01-12', 35, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (24, 54, 66, 77, 51, 40, 62, 59, 53, 53, 43);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (24, 'Izquierdo', 1.82, 24, 1, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (24, 10);
INSERT INTO player_position (player_id, position_id) VALUES (24, 8);
INSERT INTO player_position (player_id, position_id) VALUES (24, 6);

-- Franco Mastantuono
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (25, 'Franco Mastantuono', '2007-08-14', 17, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (25, 84, 89, 63, 56, 73, 80, 50, 50, 63, 74);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (25, 'Izquierdo', 1.77, 25, 1, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (25, 13);
INSERT INTO player_position (player_id, position_id) VALUES (25, 10);

-- Maximiliano Meza
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (26, 'Maximiliano Meza', '1992-12-15', 32, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (26, 79, 72, 87, 48, 88, 41, 78, 78, 43, 73);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (26, 'Derecho', 1.81, 26, 1, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (26, 13);
INSERT INTO player_position (player_id, position_id) VALUES (26, 12);
INSERT INTO player_position (player_id, position_id) VALUES (26, 10);

-- Gonzalo Tapia
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (27, 'Gonzalo Tapia', '2002-02-18', 23, 'Chile');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (27, 43, 85, 81, 49, 69, 76, 90, 76, 45, 81);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (27, 'Derecho', 1.79, 27, 1, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (27, 13);
INSERT INTO player_position (player_id, position_id) VALUES (27, 12);
INSERT INTO player_position (player_id, position_id) VALUES (27, 9);

-- Ian Subiabre
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (28, 'Ian Subiabre', '2007-01-01', 18, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (28, 75, 75, 82, 86, 52, 74, 43, 64, 40, 69);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (28, 'Izquierdo', 1.71, 28, 1, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (28, 13);
INSERT INTO player_position (player_id, position_id) VALUES (28, 12);
INSERT INTO player_position (player_id, position_id) VALUES (28, 9);

-- Facundo Colidio
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (29, 'Facundo Colidio', '2000-01-04', 25, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (29, 50, 45, 56, 70, 66, 76, 51, 86, 46, 81);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (29, 'Derecho', 1.8, 29, 1, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (29, 9);
INSERT INTO player_position (player_id, position_id) VALUES (29, 12);
INSERT INTO player_position (player_id, position_id) VALUES (29, 10);

-- Sebastián Driussi
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (30, 'Sebastián Driussi', '1996-02-09', 29, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (30, 67, 63, 45, 88, 69, 64, 59, 72, 61, 73);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (30, 'Ambidiestro', 1.79, 30, 1, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (30, 9);
INSERT INTO player_position (player_id, position_id) VALUES (30, 10);
INSERT INTO player_position (player_id, position_id) VALUES (30, 12);

-- Adam Bareiro
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (31, 'Adam Bareiro', '1996-07-26', 28, 'Paraguay');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (31, 60, 59, 71, 86, 69, 44, 60, 69, 45, 80);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (31, 'Derecho', 1.8, 31, 1, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (31, 9);

-- Miguel Borja
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (32, 'Miguel Borja', '1993-01-26', 32, 'Colombia');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (32, 41, 57, 74, 44, 53, 49, 88, 61, 87, 73);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (32, 'Derecho', 1.84, 32, 1, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (32, 9);

-- Agustín Ruberto
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (33, 'Agustín Ruberto', '2006-01-14', 19, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (33, 40, 66, 43, 46, 79, 43, 45, 70, 78, 67);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (33, 'Derecho', 1.83, 33, 1, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (33, 9);

-- Bautista Dadín
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (34, 'Bautista Dadín', '2006-05-20', 19, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (34, 43, 46, 71, 43, 69, 52, 56, 44, 45, 72);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (34, 'Izquierdo', 1.75, 34, 1, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (34, 9);

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Club: CA Boca Juniors
INSERT INTO club (id, name, league_id) VALUES (2, 'CA Boca Juniors', 1);
INSERT INTO stadium (id, name, capacity, club_id) VALUES (2, 'Alberto J. Armando', 54000, 2);
INSERT INTO youth_academy (id, club_id) VALUES (2, 2);

-- Leandro Brey
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (35, 'Leandro Brey', '2002-09-21', 22, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (35, 56, 79, 86, 50, 42, 45, 63, 90, 67, 79);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (35, 'Derecho', 1.91, 35, 2, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (35, 1);

-- Agustín Marchesín
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (36, 'Agustín Marchesín', '1988-03-16', 37, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (36, 56, 76, 60, 62, 56, 58, 51, 84, 81, 81);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (36, 'Derecho', 1.88, 36, 2, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (36, 1);

-- Sergio Romero
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (37, 'Sergio Romero', '1987-02-22', 38, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (37, 48, 58, 47, 74, 76, 79, 66, 63, 73, 88);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (37, 'Derecho', 1.92, 37, 2, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (37, 1);

-- Javier García
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (38, 'Javier García', '1987-01-29', 38, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (38, 54, 85, 67, 59, 79, 53, 61, 63, 86, 89);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (38, 'Derecho', 1.8, 38, 2, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (38, 1);

-- Marco Pellegrino
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (39, 'Marco Pellegrino', '2002-07-18', 22, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (39, 73, 75, 55, 76, 47, 81, 82, 76, 68, 77);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (39, 'Izquierdo', 1.84, 39, 2, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (39, 2);

-- Ayrton Costa
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (40, 'Ayrton Costa', '1999-07-12', 25, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (40, 44, 56, 83, 81, 76, 54, 44, 80, 42, 64);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (40, 'Izquierdo', 1.79, 40, 2, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (40, 2);
INSERT INTO player_position (player_id, position_id) VALUES (40, 3);

-- Lautaro Di Lollo
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (41, 'Lautaro Di Lollo', '2004-03-10', 21, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (41, 89, 85, 43, 49, 66, 50, 87, 41, 81, 43);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (41, 'Derecho', 1.87, 41, 2, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (41, 2);
INSERT INTO player_position (player_id, position_id) VALUES (41, 4);

-- Nicolás Figal
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (42, 'Nicolás Figal', '1994-04-03', 31, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (42, 87, 52, 47, 90, 46, 70, 78, 57, 55, 80);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (42, 'Derecho', 1.8, 42, 2, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (42, 2);
INSERT INTO player_position (player_id, position_id) VALUES (42, 4);

-- Cristian Lema
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (43, 'Cristian Lema', '1990-03-24', 35, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (43, 72, 75, 51, 51, 51, 84, 72, 76, 78, 78);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (43, 'Derecho', 1.91, 43, 2, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (43, 2);

-- Marcos Rojo
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (44, 'Marcos Rojo', '1990-03-20', 35, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (44, 87, 89, 64, 76, 84, 79, 46, 65, 83, 53);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (44, 'Izquierdo', 1.86, 44, 2, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (44, 2);
INSERT INTO player_position (player_id, position_id) VALUES (44, 3);

-- Mateo Mendía
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (45, 'Mateo Mendía', '2004-02-03', 21, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (45, 47, 87, 85, 75, 61, 75, 64, 42, 40, 51);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (45, 'Derecho', 1.91, 45, 2, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (45, 2);
INSERT INTO player_position (player_id, position_id) VALUES (45, 5);

-- Lautaro Blanco
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (46, 'Lautaro Blanco', '1999-02-19', 26, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (46, 67, 90, 68, 87, 41, 83, 76, 52, 75, 43);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (46, 'Izquierdo', 1.76, 46, 2, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (46, 3);
INSERT INTO player_position (player_id, position_id) VALUES (46, 12);

-- Marcelo Saracchi
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (47, 'Marcelo Saracchi', '1998-04-23', 27, 'Uruguay');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (47, 56, 81, 41, 86, 85, 88, 82, 72, 64, 46);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (47, 'Izquierdo', 1.72, 47, 2, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (47, 3);
INSERT INTO player_position (player_id, position_id) VALUES (47, 4);
INSERT INTO player_position (player_id, position_id) VALUES (47, 7);

-- Frank Fabra
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (48, 'Frank Fabra', '1991-02-22', 34, 'Colombia');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (48, 63, 54, 60, 81, 55, 62, 70, 47, 50, 45);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (48, 'Izquierdo', 1.74, 48, 2, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (48, 3);

-- Juan Barinaga
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (49, 'Juan Barinaga', '2000-10-10', 24, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (49, 70, 67, 56, 74, 49, 89, 60, 62, 90, 56);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (49, 'Derecho', 1.76, 49, 2, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (49, 4);

-- Lucas Blondel
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (50, 'Lucas Blondel', '1996-09-14', 28, 'Suiza');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (50, 86, 51, 40, 81, 51, 77, 63, 45, 68, 64);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (50, 'Derecho', 1.78, 50, 2, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (50, 4);
INSERT INTO player_position (player_id, position_id) VALUES (50, 8);

-- Luis Advíncula
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (51, 'Luis Advíncula', '1990-03-02', 35, 'Perú');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (51, 47, 84, 76, 80, 65, 54, 61, 74, 73, 55);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (51, 'Derecho', 1.78, 51, 2, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (51, 4);
INSERT INTO player_position (player_id, position_id) VALUES (51, 8);
INSERT INTO player_position (player_id, position_id) VALUES (51, 13);

-- Milton Delgado
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (52, 'Milton Delgado', '2005-06-16', 20, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (52, 90, 40, 75, 60, 79, 46, 83, 65, 81, 42);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (52, 'Derecho', 1.66, 52, 2, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (52, 5);
INSERT INTO player_position (player_id, position_id) VALUES (52, 6);

-- Tomás Belmonte
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (53, 'Tomás Belmonte', '1998-05-27', 27, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (53, 70, 48, 85, 55, 56, 90, 72, 73, 81, 46);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (53, 'Derecho', 1.81, 53, 2, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (53, 5);
INSERT INTO player_position (player_id, position_id) VALUES (53, 6);

-- Ignacio Miramón
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (54, 'Ignacio Miramón', '2003-06-12', 22, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (54, 47, 53, 46, 50, 46, 90, 40, 76, 44, 49);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (54, 'Derecho', 1.73, 54, 2, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (54, 5);

-- Jorman Campuzano
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (55, 'Jorman Campuzano', '1996-04-30', 29, 'Colombia');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (55, 69, 54, 45, 66, 56, 64, 43, 47, 73, 83);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (55, 'Derecho', 1.75, 55, 2, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (55, 5);

-- Rodrigo Battaglia
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (56, 'Rodrigo Battaglia', '1991-07-12', 33, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (56, 45, 76, 80, 52, 62, 47, 87, 87, 53, 42);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (56, 'Derecho', 1.87, 56, 2, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (56, 5);
INSERT INTO player_position (player_id, position_id) VALUES (56, 2);

-- Camilo Rey Domenech
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (57, 'Camilo Rey Domenech', '2006-03-10', 19, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (57, 60, 85, 51, 66, 86, 67, 83, 87, 86, 66);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (57, 'Derecho', 1.78, 57, 2, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (57, 5);
INSERT INTO player_position (player_id, position_id) VALUES (57, 6);

-- Esteban Rolón
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (58, 'Esteban Rolón', '1995-03-25', 30, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (58, 41, 53, 75, 64, 58, 69, 72, 78, 82, 49);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (58, 'Derecho', 1.75, 58, 2, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (58, 5);
INSERT INTO player_position (player_id, position_id) VALUES (58, 6);

-- Williams Alarcón
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (59, 'Williams Alarcón', '2000-11-29', 24, 'Chile');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (59, 67, 71, 43, 48, 86, 63, 81, 54, 57, 44);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (59, 'Derecho', 1.82, 59, 2, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (59, 6);
INSERT INTO player_position (player_id, position_id) VALUES (59, 5);

-- Ander Herrera
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (60, 'Ander Herrera', '1989-08-14', 35, 'España');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (60, 51, 84, 84, 40, 83, 59, 56, 79, 52, 65);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (60, 'Derecho', 1.82, 60, 2, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (60, 6);
INSERT INTO player_position (player_id, position_id) VALUES (60, 5);
INSERT INTO player_position (player_id, position_id) VALUES (60, 10);

-- Simón Rivero
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (61, 'Simón Rivero', '2003-04-16', 22, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (61, 52, 44, 85, 55, 42, 41, 71, 55, 83, 79);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (61, 'Izquierdo', 1.72, 61, 2, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (61, 6);

-- Malcom Braida
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (62, 'Malcom Braida', '1997-05-17', 28, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (62, 51, 42, 49, 78, 74, 45, 40, 84, 86, 46);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (62, 'Derecho', 1.75, 62, 2, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (62, 7);
INSERT INTO player_position (player_id, position_id) VALUES (62, 3);
INSERT INTO player_position (player_id, position_id) VALUES (62, 12);

-- Carlos Palacios
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (63, 'Carlos Palacios', '2000-07-20', 24, 'Chile');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (63, 43, 76, 68, 62, 58, 68, 43, 49, 41, 62);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (63, 'Derecho', 1.8, 63, 2, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (63, 10);
INSERT INTO player_position (player_id, position_id) VALUES (63, 12);
INSERT INTO player_position (player_id, position_id) VALUES (63, 13);

-- Agustín Martegani
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (64, 'Agustín Martegani', '2000-05-20', 25, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (64, 49, 68, 80, 87, 83, 65, 54, 59, 70, 79);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (64, 'Izquierdo', 1.82, 64, 2, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (64, 12);
INSERT INTO player_position (player_id, position_id) VALUES (64, 10);
INSERT INTO player_position (player_id, position_id) VALUES (64, 6);

-- Kevin Zenón
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (65, 'Kevin Zenón', '2001-07-30', 23, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (65, 64, 80, 61, 90, 87, 61, 90, 41, 43, 64);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (65, 'Izquierdo', 1.77, 65, 2, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (65, 12);
INSERT INTO player_position (player_id, position_id) VALUES (65, 13);
INSERT INTO player_position (player_id, position_id) VALUES (65, 7);

-- Brian Aguirre
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (66, 'Brian Aguirre', '2003-01-06', 22, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (66, 60, 79, 63, 40, 74, 47, 67, 53, 79, 75);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (66, 'Derecho', 1.78, 66, 2, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (66, 12);
INSERT INTO player_position (player_id, position_id) VALUES (66, 13);

-- Alan Velasco
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (67, 'Alan Velasco', '2002-07-27', 22, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (67, 53, 59, 74, 67, 86, 76, 43, 69, 73, 64);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (67, 'Derecho', 1.67, 67, 2, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (67, 12);
INSERT INTO player_position (player_id, position_id) VALUES (67, 13);
INSERT INTO player_position (player_id, position_id) VALUES (67, 10);

-- Lucas Janson
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (68, 'Lucas Janson', '1994-08-16', 30, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (68, 88, 89, 88, 51, 67, 63, 78, 62, 79, 73);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (68, 'Derecho', 1.71, 68, 2, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (68, 12);
INSERT INTO player_position (player_id, position_id) VALUES (68, 9);
INSERT INTO player_position (player_id, position_id) VALUES (68, 13);

-- Exequiel Zeballos
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (69, 'Exequiel Zeballos', '2002-04-24', 23, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (69, 46, 70, 75, 44, 73, 69, 45, 75, 66, 78);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (69, 'Derecho', 1.7, 69, 2, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (69, 13);
INSERT INTO player_position (player_id, position_id) VALUES (69, 12);
INSERT INTO player_position (player_id, position_id) VALUES (69, 9);

-- Miguel Merentiel
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (70, 'Miguel Merentiel', '1996-02-24', 29, 'Uruguay');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (70, 48, 57, 64, 83, 78, 58, 83, 60, 54, 53);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (70, 'Derecho', 1.76, 70, 2, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (70, 9);
INSERT INTO player_position (player_id, position_id) VALUES (70, 13);

-- Milton Giménez
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (71, 'Milton Giménez', '1996-08-12', 28, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (71, 45, 54, 88, 83, 82, 84, 87, 82, 61, 69);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (71, 'Derecho', 1.84, 71, 2, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (71, 9);

-- Edinson Cavani
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (72, 'Edinson Cavani', '1987-02-14', 38, 'Uruguay');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (72, 87, 76, 61, 76, 80, 66, 56, 40, 66, 56);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (72, 'Derecho', 1.84, 72, 2, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (72, 9);
INSERT INTO player_position (player_id, position_id) VALUES (72, 12);
INSERT INTO player_position (player_id, position_id) VALUES (72, 13);

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Club: Racing Club
INSERT INTO club (id, name, league_id) VALUES (3, 'Racing Club', 1);
INSERT INTO stadium (id, name, capacity, club_id) VALUES (3, 'Presidente Perón', 55000, 3);
INSERT INTO youth_academy (id, club_id) VALUES (3, 3);

-- Facundo Cambeses
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (73, 'Facundo Cambeses', '1997-04-09', 28, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (73, 80, 50, 72, 41, 89, 42, 84, 70, 46, 80);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (73, 'Derecho', 1.86, 73, 3, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (73, 1);

-- Gabriel Arias
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (74, 'Gabriel Arias', '1987-09-13', 37, 'Chile');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (74, 78, 66, 50, 49, 47, 57, 62, 54, 84, 68);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (74, 'Derecho', 1.89, 74, 3, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (74, 1);

-- Marco Di Césare
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (75, 'Marco Di Césare', '2002-01-30', 23, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (75, 90, 68, 47, 74, 80, 55, 44, 46, 69, 61);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (75, 'Derecho', 1.86, 75, 3, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (75, 2);

-- Santiago Sosa
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (76, 'Santiago Sosa', '1999-05-03', 26, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (76, 69, 84, 86, 65, 47, 65, 50, 74, 78, 72);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (76, 'Derecho', 1.82, 76, 3, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (76, 2);

-- Nazareno Colombo
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (77, 'Nazareno Colombo', '1999-03-20', 26, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (77, 90, 68, 72, 86, 59, 73, 45, 82, 89, 74);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (77, 'Derecho', 1.82, 77, 3, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (77, 2);

-- Santiago Quirós
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (78, 'Santiago Quirós', '2003-03-04', 22, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (78, 66, 77, 79, 76, 44, 52, 79, 42, 77, 89);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (78, 'Izquierdo', 1.79, 78, 3, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (78, 2);

-- Agustín García Basso
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (79, 'Agustín García Basso', '1992-03-26', 33, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (79, 52, 59, 61, 82, 71, 68, 71, 76, 67, 62);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (79, 'Izquierdo', 1.78, 79, 3, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (79, 2);

-- Germán Conti
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (80, 'Germán Conti', '1994-06-03', 31, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (80, 60, 87, 72, 58, 84, 62, 61, 42, 64, 54);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (80, 'Derecho', 1.93, 80, 3, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (80, 2);

-- Gonzalo Escudero
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (81, 'Gonzalo Escudero', '2007-04-01', 18, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (81, 90, 89, 80, 64, 79, 42, 88, 90, 55, 52);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (81, 'Izquierdo', 1.8, 81, 3, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (81, 2);

-- Gabriel Rojas
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (82, 'Gabriel Rojas', '1997-06-22', 28, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (82, 55, 43, 68, 62, 76, 89, 55, 56, 87, 87);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (82, 'Izquierdo', 1.73, 82, 3, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (82, 3);

-- Fabián Sánchez
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (83, 'Fabián Sánchez', '2001-08-17', 23, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (83, 78, 81, 55, 42, 83, 62, 52, 58, 43, 61);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (83, 'Izquierdo', 1.7, 83, 3, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (83, 3);

-- Ignacio Galván
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (84, 'Ignacio Galván', '2002-09-06', 22, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (84, 89, 67, 66, 59, 88, 40, 60, 53, 54, 63);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (84, 'Izquierdo', 1.81, 84, 3, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (84, 3);

-- Fernando Prado
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (85, 'Fernando Prado', '2001-03-21', 24, 'Uruguay');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (85, 69, 90, 80, 74, 79, 68, 81, 89, 75, 67);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (85, 'Izquierdo', 1.76, 85, 3, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (85, 3);

-- Gastón Martirena
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (86, 'Gastón Martirena', '2000-01-05', 25, 'Uruguay');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (86, 58, 63, 42, 87, 40, 41, 76, 58, 90, 41);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (86, 'Derecho', 1.74, 86, 3, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (86, 4);

-- Facundo Mura
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (87, 'Facundo Mura', '1999-03-23', 26, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (87, 72, 69, 62, 51, 47, 53, 50, 51, 52, 56);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (87, 'Derecho', 1.7, 87, 3, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (87, 4);

-- Bruno Zuculini
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (88, 'Bruno Zuculini', '1993-04-02', 32, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (88, 69, 81, 78, 82, 45, 40, 90, 53, 67, 83);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (88, 'Derecho', 1.82, 88, 3, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (88, 5);

-- Alan Forneris
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (89, 'Alan Forneris', '2005-01-28', 20, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (89, 81, 43, 89, 90, 82, 73, 52, 61, 83, 78);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (89, 'Derecho', 1.84, 89, 3, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (89, 5);

-- Patricio Tanda
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (90, 'Patricio Tanda', '2002-04-05', 23, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (90, 86, 90, 53, 87, 65, 66, 69, 73, 71, 52);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (90, 'Izquierdo', 1.77, 90, 3, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (90, 5);

-- Juan Ignacio Nardoni
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (91, 'Juan Ignacio Nardoni', '2002-07-14', 22, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (91, 64, 45, 74, 64, 62, 70, 80, 83, 45, 49);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (91, 'Derecho', 1.8, 91, 3, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (91, 6);

-- Richard Sánchez
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (92, 'Richard Sánchez', '1996-03-29', 29, 'Paraguay');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (92, 41, 64, 90, 46, 86, 63, 52, 78, 54, 40);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (92, 'Derecho', 1.7, 92, 3, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (92, 6);

-- Agustín Almendra
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (93, 'Agustín Almendra', '2000-02-11', 25, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (93, 63, 59, 81, 76, 72, 46, 59, 65, 71, 83);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (93, 'Derecho', 1.82, 93, 3, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (93, 6);

-- Martín Barrios
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (94, 'Martín Barrios', '1999-01-24', 26, 'Uruguay');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (94, 75, 66, 58, 82, 90, 49, 48, 49, 67, 75);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (94, 'Derecho', 1.75, 94, 3, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (94, 6);

-- Ignacio Rodríguez
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (95, 'Ignacio Rodríguez', '2002-02-22', 23, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (95, 53, 87, 50, 77, 77, 73, 81, 86, 42, 41);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (95, 'Izquierdo', 1.76, 95, 3, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (95, 7);

-- Matías Zaracho
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (96, 'Matías Zaracho', '1998-03-10', 27, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (96, 70, 82, 61, 81, 85, 59, 74, 76, 40, 85);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (96, 'Derecho', 1.71, 96, 3, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (96, 10);

-- Adrián Fernández
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (97, 'Adrián Fernández', '2001-05-20', 24, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (97, 55, 51, 79, 53, 77, 48, 53, 49, 79, 69);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (97, 'Derecho', 1.83, 97, 3, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (97, 10);

-- Maico Quiroz
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (98, 'Maico Quiroz', '2001-11-20', 23, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (98, 84, 55, 59, 50, 75, 80, 80, 78, 51, 85);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (98, 'Derecho', 1.75, 98, 3, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (98, 10);

-- David González
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (99, 'David González', '2003-07-08', 21, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (99, 87, 90, 90, 65, 64, 43, 73, 72, 88, 85);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (99, 'Derecho', 1.67, 99, 3, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (99, 10);

-- Santiago Solari
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (100, 'Santiago Solari', '1998-01-19', 27, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (100, 70, 66, 55, 63, 73, 48, 40, 75, 70, 40);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (100, 'Derecho', 1.78, 100, 3, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (100, 13);

-- Ramiro Degregorio
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (101, 'Ramiro Degregorio', '2003-02-06', 22, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (101, 72, 48, 85, 85, 62, 70, 55, 48, 65, 74);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (101, 'Derecho', 1.7, 101, 3, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (101, 13);

-- Maximiliano Salas
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (102, 'Maximiliano Salas', '1997-12-01', 27, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (102, 83, 56, 67, 68, 58, 50, 71, 60, 76, 82);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (102, 'Izquierdo', 1.74, 102, 3, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (102, 9);
INSERT INTO player_position (player_id, position_id) VALUES (102, 13);

-- Adrián Martínez
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (103, 'Adrián Martínez', '1992-07-07', 32, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (103, 48, 83, 51, 82, 52, 70, 60, 45, 72, 48);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (103, 'Izquierdo', 1.76, 103, 3, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (103, 9);

-- Luciano Vietto
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (104, 'Luciano Vietto', '1993-12-05', 31, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (104, 80, 89, 58, 68, 56, 57, 53, 53, 72, 86);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (104, 'Derecho', 1.73, 104, 3, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (104, 9);

-- Adrián Balboa
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (105, 'Adrián Balboa', '1994-01-19', 31, 'Uruguay');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (105, 88, 40, 56, 44, 90, 83, 43, 47, 62, 56);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (105, 'Derecho', 1.86, 105, 3, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (105, 9);

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Club: CA Vélez Sarsfield
INSERT INTO club (id, name, league_id) VALUES (4, 'CA Vélez Sarsfield', 1);
INSERT INTO stadium (id, name, capacity, club_id) VALUES (4, 'José Amalfitani', 49747, 4);
INSERT INTO youth_academy (id, club_id) VALUES (4, 4);

-- Tomás Marchiori
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (106, 'Tomás Marchiori', '1995-06-20', 30, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (106, 46, 87, 47, 65, 49, 74, 44, 83, 61, 90);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (106, 'Derecho', 1.86, 106, 4, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (106, 1);

-- Randall Rodríguez
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (107, 'Randall Rodríguez', '2003-11-29', 21, 'Uruguay');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (107, 57, 72, 64, 48, 40, 61, 72, 72, 85, 41);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (107, 'Derecho', 1.89, 107, 4, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (107, 1);

-- Lautaro Garzón
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (108, 'Lautaro Garzón', '2003-07-30', 21, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (108, 48, 42, 64, 44, 90, 49, 89, 51, 42, 88);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (108, 'Derecho', 1.8, 108, 4, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (108, 1);

-- Valentín Gómez
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (109, 'Valentín Gómez', '2003-06-26', 22, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (109, 45, 80, 44, 49, 64, 40, 65, 41, 89, 64);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (109, 'Izquierdo', 1.81, 109, 4, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (109, 2);

-- Aarón Quirós
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (110, 'Aarón Quirós', '2001-10-31', 23, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (110, 79, 43, 78, 57, 59, 68, 64, 60, 48, 80);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (110, 'Izquierdo', 1.78, 110, 4, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (110, 2);

-- Emanuel Mammana
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (111, 'Emanuel Mammana', '1996-02-10', 29, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (111, 62, 68, 40, 51, 50, 53, 41, 42, 41, 42);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (111, 'Derecho', 1.84, 111, 4, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (111, 2);

-- Damián Fernández
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (112, 'Damián Fernández', '2001-01-02', 24, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (112, 77, 51, 88, 80, 43, 70, 56, 68, 67, 75);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (112, 'Derecho', 1.79, 112, 4, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (112, 2);

-- Jano Gordon
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (113, 'Jano Gordon', '2004-06-16', 21, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (113, 49, 57, 82, 80, 82, 40, 83, 76, 74, 87);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (113, 'Derecho', 1.82, 113, 4, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (113, 2);

-- Patricio Pernicone
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (114, 'Patricio Pernicone', '2001-07-04', 24, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (114, 46, 67, 73, 63, 73, 84, 47, 49, 67, 88);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (114, 'Derecho', 1.83, 114, 4, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (114, 2);

-- Thiago Silvero
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (115, 'Thiago Silvero', '2006-04-18', 19, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (115, 61, 42, 65, 64, 57, 40, 82, 55, 44, 52);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (115, 'Derecho', 1.88, 115, 4, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (115, 2);

-- Elías Gómez
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (116, 'Elías Gómez', '1994-06-09', 31, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (116, 63, 81, 82, 44, 48, 55, 69, 84, 82, 85);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (116, 'Izquierdo', 1.74, 116, 4, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (116, 3);

-- Lautaro Cano
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (117, 'Lautaro Cano', '2002-08-22', 22, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (117, 72, 46, 54, 75, 87, 82, 60, 48, 61, 43);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (117, 'Izquierdo', 1.7, 117, 4, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (117, 3);

-- Tomás Cavanagh
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (118, 'Tomás Cavanagh', '2001-01-05', 24, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (118, 86, 52, 71, 56, 55, 53, 55, 57, 42, 53);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (118, 'Izquierdo', 1.82, 118, 4, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (118, 3);

-- Joaquín García
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (119, 'Joaquín García', '2001-08-20', 23, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (119, 55, 82, 83, 79, 63, 80, 71, 56, 51, 46);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (119, 'Derecho', 1.82, 119, 4, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (119, 4);

-- Agustín Lagos
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (120, 'Agustín Lagos', '2001-10-09', 23, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (120, 44, 80, 67, 55, 87, 44, 54, 86, 80, 63);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (120, 'Derecho', 1.84, 120, 4, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (120, 4);

-- Isaías Andrada
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (121, 'Isaías Andrada', '2003-02-12', 22, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (121, 51, 63, 62, 64, 45, 86, 47, 73, 55, 57);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (121, 'Derecho', 1.74, 121, 4, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (121, 4);

-- Claudio Baeza
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (122, 'Claudio Baeza', '1993-12-23', 31, 'Chile');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (122, 46, 45, 69, 64, 71, 43, 53, 40, 90, 86);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (122, 'Derecho', 1.71, 122, 4, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (122, 5);

-- Agustín Bouzat
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (123, 'Agustín Bouzat', '1994-03-28', 31, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (123, 40, 41, 83, 75, 78, 53, 54, 56, 56, 88);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (123, 'Izquierdo', 1.7, 123, 4, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (123, 5);

-- Kevin Vázquez
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (124, 'Kevin Vázquez', '2001-03-19', 24, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (124, 90, 66, 71, 83, 51, 87, 45, 89, 49, 43);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (124, 'Derecho', 1.75, 124, 4, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (124, 5);

-- Mateo Seoane
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (125, 'Mateo Seoane', '2004-02-09', 21, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (125, 63, 58, 83, 44, 49, 62, 67, 68, 48, 41);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (125, 'Derecho', 1.78, 125, 4, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (125, 5);

-- Leonel Roldán
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (126, 'Leonel Roldán', '2004-10-10', 20, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (126, 76, 44, 57, 55, 60, 84, 59, 58, 59, 88);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (126, 'Derecho', 1.75, 126, 4, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (126, 6);

-- Tomás Galván
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (127, 'Tomás Galván', '2000-04-11', 25, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (127, 78, 83, 86, 67, 48, 65, 63, 52, 46, 88);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (127, 'Derecho', 1.72, 127, 4, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (127, 10);

-- Maximiliano Porcel
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (128, 'Maximiliano Porcel', '2006-01-02', 19, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (128, 50, 81, 61, 67, 81, 50, 55, 44, 41, 43);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (128, 'Izquierdo', 1.71, 128, 4, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (128, 10);

-- Thiago Fernández
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (129, 'Thiago Fernández', '2004-04-03', 21, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (129, 87, 87, 47, 55, 66, 82, 46, 40, 70, 81);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (129, 'Derecho', 1.75, 129, 4, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (129, 12);

-- Lenny Lobato
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (130, 'Lenny Lobato', '2001-02-03', 24, 'Brasil');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (130, 78, 40, 85, 49, 85, 44, 60, 52, 62, 62);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (130, 'Izquierdo', 1.74, 130, 4, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (130, 12);

-- Matías Pellegrini
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (131, 'Matías Pellegrini', '2000-03-11', 25, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (131, 84, 88, 62, 55, 68, 86, 61, 90, 43, 71);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (131, 'Derecho', 1.76, 131, 4, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (131, 12);

-- Maher Carrizo
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (132, 'Maher Carrizo', '2006-02-19', 19, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (132, 50, 56, 75, 77, 75, 81, 70, 41, 73, 67);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (132, 'Izquierdo', 1.8, 132, 4, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (132, 13);

-- Imanol Machuca
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (133, 'Imanol Machuca', '2000-01-15', 25, 'Malasia');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (133, 40, 42, 80, 63, 44, 41, 50, 60, 42, 83);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (133, 'Derecho', 1.7, 133, 4, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (133, 13);

-- Francisco Pizzini
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (134, 'Francisco Pizzini', '1993-09-19', 31, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (134, 53, 88, 44, 61, 77, 75, 52, 78, 44, 77);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (134, 'Derecho', 1.8, 134, 4, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (134, 13);

-- Benjamín Bosch
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (135, 'Benjamín Bosch', '2005-06-15', 20, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (135, 71, 82, 81, 46, 65, 69, 66, 76, 57, 57);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (135, 'Izquierdo', 1.73, 135, 4, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (135, 13);

-- Florián Monzón
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (136, 'Florián Monzón', '2001-01-03', 24, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (136, 64, 78, 61, 65, 47, 45, 69, 71, 60, 51);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (136, 'Derecho', 1.84, 136, 4, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (136, 9);

-- Braian Romero
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (137, 'Braian Romero', '1991-06-15', 34, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (137, 80, 68, 80, 78, 52, 47, 88, 89, 63, 60);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (137, 'Derecho', 1.8, 137, 4, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (137, 9);

-- Michael Santos
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (138, 'Michael Santos', '1993-03-13', 32, 'Uruguay');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (138, 54, 48, 42, 57, 63, 78, 78, 52, 50, 71);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (138, 'Derecho', 1.74, 138, 4, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (138, 9);

-- Francisco Montoro
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (139, 'Francisco Montoro', '2004-06-23', 21, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (139, 80, 53, 48, 86, 73, 89, 76, 86, 77, 67);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (139, 'Derecho', 1.7, 139, 4, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (139, 9);

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Club: Club Estudiantes de La Plata
INSERT INTO club (id, name, league_id) VALUES (5, 'Club Estudiantes de La Plata', 1);
INSERT INTO stadium (id, name, capacity, club_id) VALUES (5, 'Jorge Luis Hirschi', 32530, 5);
INSERT INTO youth_academy (id, club_id) VALUES (5, 5);

-- Matías Mansilla
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (140, 'Matías Mansilla', '1996-01-15', 29, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (140, 81, 69, 48, 55, 53, 49, 59, 77, 60, 72);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (140, 'Derecho', 1.92, 140, 5, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (140, 1);

-- Fabricio Iacovich
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (141, 'Fabricio Iacovich', '2002-01-29', 23, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (141, 53, 44, 52, 89, 56, 63, 85, 68, 50, 60);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (141, 'Izquierdo', 1.98, 141, 5, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (141, 1);

-- Sebastián Boselli
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (142, 'Sebastián Boselli', '2003-12-04', 21, 'Uruguay');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (142, 54, 55, 42, 70, 73, 74, 58, 55, 71, 60);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (142, 'Derecho', 1.83, 142, 5, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (142, 2);

-- Santiago Núñez
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (143, 'Santiago Núñez', '2000-04-29', 25, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (143, 89, 45, 85, 54, 76, 80, 49, 47, 85, 60);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (143, 'Derecho', 1.86, 143, 5, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (143, 2);

-- Facundo Rodríguez
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (144, 'Facundo Rodríguez', '2000-02-26', 25, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (144, 42, 51, 67, 80, 56, 59, 69, 71, 77, 83);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (144, 'Izquierdo', 1.87, 144, 5, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (144, 2);

-- Juan Cruz Guasone
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (145, 'Juan Cruz Guasone', '2001-03-27', 24, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (145, 44, 77, 64, 78, 72, 90, 66, 71, 59, 65);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (145, 'Derecho', 1.97, 145, 5, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (145, 2);

-- Ramiro Funes Mori
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (146, 'Ramiro Funes Mori', '1991-03-05', 34, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (146, 90, 44, 59, 89, 59, 87, 68, 42, 78, 75);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (146, 'Izquierdo', 1.87, 146, 5, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (146, 2);

-- Gastón Benedetti
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (147, 'Gastón Benedetti', '2001-03-29', 24, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (147, 44, 51, 86, 63, 81, 56, 64, 54, 80, 65);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (147, 'Izquierdo', 1.75, 147, 5, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (147, 3);

-- Santiago Arzamendia
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (148, 'Santiago Arzamendia', '1998-05-05', 27, 'Paraguay');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (148, 81, 69, 90, 74, 59, 80, 62, 76, 89, 55);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (148, 'Izquierdo', 1.72, 148, 5, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (148, 3);

-- Eric Meza
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (149, 'Eric Meza', '1999-04-08', 26, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (149, 77, 83, 64, 68, 45, 76, 82, 46, 82, 90);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (149, 'Derecho', 1.75, 149, 5, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (149, 4);

-- Román Gómez
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (150, 'Román Gómez', '2004-07-14', 20, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (150, 90, 58, 59, 78, 62, 61, 62, 90, 69, 51);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (150, 'Derecho', 1.81, 150, 5, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (150, 4);

-- Santiago Ascacíbar
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (151, 'Santiago Ascacíbar', '1997-02-25', 28, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (151, 70, 80, 77, 70, 77, 67, 77, 41, 49, 71);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (151, 'Derecho', 1.69, 151, 5, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (151, 5);

-- Gabriel Neves
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (152, 'Gabriel Neves', '1997-08-11', 27, 'Uruguay');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (152, 52, 65, 40, 90, 44, 54, 47, 71, 60, 48);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (152, 'Derecho', 1.71, 152, 5, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (152, 5);

-- Ezequiel Piovi
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (153, 'Ezequiel Piovi', '1992-08-20', 32, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (153, 84, 61, 61, 60, 73, 62, 81, 72, 75, 64);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (153, 'Derecho', 1.7, 153, 5, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (153, 5);

-- Cristian Medina
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (154, 'Cristian Medina', '2002-06-01', 23, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (154, 49, 89, 78, 85, 43, 65, 67, 77, 62, 76);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (154, 'Derecho', 1.76, 154, 5, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (154, 6);

-- Alexis Castro
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (155, 'Alexis Castro', '1994-10-18', 30, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (155, 69, 42, 64, 57, 44, 73, 88, 62, 70, 76);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (155, 'Izquierdo', 1.83, 155, 5, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (155, 6);

-- Bautista Kociubinski
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (156, 'Bautista Kociubinski', '2001-04-26', 24, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (156, 47, 51, 47, 79, 72, 61, 64, 86, 63, 83);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (156, 'Derecho', 1.81, 156, 5, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (156, 6);

-- Facundo Farías
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (157, 'Facundo Farías', '2002-08-28', 22, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (157, 86, 78, 59, 45, 62, 80, 58, 47, 44, 72);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (157, 'Derecho', 1.75, 157, 5, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (157, 10);

-- José Sosa
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (158, 'José Sosa', '1985-06-19', 40, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (158, 65, 70, 90, 56, 51, 67, 54, 59, 80, 62);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (158, 'Derecho', 1.81, 158, 5, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (158, 10);

-- Edwuin Cetré
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (159, 'Edwuin Cetré', '1998-01-01', 27, 'Colombia');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (159, 62, 65, 70, 62, 67, 84, 61, 67, 41, 69);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (159, 'Derecho', 1.74, 159, 5, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (159, 12);

-- Joaquín Tobio Burgos
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (160, 'Joaquín Tobio Burgos', '2004-12-14', 20, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (160, 71, 48, 57, 54, 48, 52, 74, 44, 89, 79);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (160, 'Izquierdo', 1.77, 160, 5, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (160, 12);

-- Alexis Manyoma
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (161, 'Alexis Manyoma', '2003-01-30', 22, 'Colombia');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (161, 81, 44, 53, 80, 80, 85, 44, 45, 62, 84);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (161, 'Derecho', 1.68, 161, 5, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (161, 12);

-- Matías Godoy
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (162, 'Matías Godoy', '2002-01-10', 23, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (162, 56, 60, 51, 82, 40, 69, 63, 59, 59, 61);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (162, 'Derecho', 1.76, 162, 5, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (162, 12);

-- Tiago Palacios
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (163, 'Tiago Palacios', '2001-03-28', 24, 'Uruguay');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (163, 88, 86, 59, 60, 65, 53, 76, 45, 49, 82);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (163, 'Izquierdo', 1.67, 163, 5, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (163, 13);

-- Fabricio Pérez
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (164, 'Fabricio Pérez', '2005-12-07', 19, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (164, 72, 77, 83, 71, 63, 49, 69, 61, 51, 64);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (164, 'Derecho', 1.8, 164, 5, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (164, 13);

-- Mauro Méndez
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (165, 'Mauro Méndez', '1999-01-17', 26, 'Uruguay');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (165, 90, 41, 86, 67, 64, 82, 72, 52, 65, 81);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (165, 'Derecho', 1.76, 165, 5, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (165, 9);

-- Luciano Giménez
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (166, 'Luciano Giménez', '2000-02-18', 25, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (166, 72, 84, 88, 71, 50, 90, 70, 66, 74, 77);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (166, 'Derecho', 1.87, 166, 5, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (166, 9);

-- Lucas Alario
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (167, 'Lucas Alario', '1992-10-08', 32, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (167, 90, 48, 51, 88, 42, 79, 48, 57, 51, 57);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (167, 'Derecho', 1.85, 167, 5, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (167, 9);

-- Guido Carrillo
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (168, 'Guido Carrillo', '1991-05-25', 34, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (168, 51, 46, 52, 65, 42, 73, 90, 41, 48, 66);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (168, 'Derecho', 1.87, 168, 5, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (168, 9);

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Club: CA Independiente
INSERT INTO club (id, name, league_id) VALUES (6, 'CA Independiente', 1);
INSERT INTO stadium (id, name, capacity, club_id) VALUES (6, 'Libertadores de América-Ricardo Enrique Bochini', 48069, 6);
INSERT INTO youth_academy (id, club_id) VALUES (6, 6);

-- Rodrigo Rey
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (169, 'Rodrigo Rey', '1991-03-08', 34, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (169, 74, 40, 41, 43, 59, 76, 64, 89, 81, 41);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (169, 'Derecho', 1.9, 169, 6, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (169, 1);

-- Joaquín Blázquez
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (170, 'Joaquín Blázquez', '2001-01-28', 24, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (170, 62, 84, 61, 51, 78, 63, 43, 40, 90, 44);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (170, 'Derecho', 1.93, 170, 6, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (170, 1);

-- Manuel Tasso
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (171, 'Manuel Tasso', '2001-03-05', 24, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (171, 49, 61, 58, 85, 80, 90, 62, 50, 73, 90);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (171, 'Derecho', 1.83, 171, 6, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (171, 1);

-- Kevin Lomónaco
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (172, 'Kevin Lomónaco', '2002-01-08', 23, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (172, 42, 61, 70, 51, 78, 55, 42, 52, 72, 42);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (172, 'Derecho', 1.92, 172, 6, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (172, 2);

-- Sebastián Valdez
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (173, 'Sebastián Valdez', '1995-11-06', 29, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (173, 87, 71, 73, 53, 55, 59, 47, 57, 68, 88);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (173, 'Derecho', 1.91, 173, 6, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (173, 2);

-- Nicolás Freire
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (174, 'Nicolás Freire', '1994-02-18', 31, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (174, 74, 53, 89, 63, 41, 62, 65, 61, 80, 58);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (174, 'Izquierdo', 1.87, 174, 6, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (174, 2);

-- Franco Paredes
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (175, 'Franco Paredes', '1999-03-18', 26, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (175, 90, 55, 47, 76, 48, 77, 70, 60, 81, 81);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (175, 'Derecho', 1.76, 175, 6, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (175, 2);

-- Alvaro Angulo
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (176, 'Alvaro Angulo', '1997-03-06', 28, 'Colombia');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (176, 47, 66, 67, 50, 45, 58, 86, 45, 53, 56);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (176, 'Izquierdo', 1.77, 176, 6, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (176, 3);

-- Adrián Spörle
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (177, 'Adrián Spörle', '1995-07-13', 29, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (177, 60, 80, 66, 72, 64, 74, 68, 83, 75, 85);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (177, 'Izquierdo', 1.82, 177, 6, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (177, 3);

-- Federico Vera
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (178, 'Federico Vera', '1998-03-24', 27, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (178, 48, 80, 50, 51, 86, 71, 61, 41, 45, 64);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (178, 'Derecho', 1.78, 178, 6, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (178, 4);

-- Santiago Salle
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (179, 'Santiago Salle', '2004-06-04', 21, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (179, 56, 83, 83, 50, 52, 64, 41, 75, 77, 68);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (179, 'Derecho', 1.85, 179, 6, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (179, 4);

-- Rodrigo Fernández Cedrés
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (180, 'Rodrigo Fernández Cedrés', '1996-01-03', 29, 'Uruguay');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (180, 68, 49, 63, 44, 67, 80, 40, 82, 57, 74);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (180, 'Derecho', 1.74, 180, 6, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (180, 5);

-- David Martínez
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (181, 'David Martínez', '2004-06-14', 21, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (181, 70, 46, 85, 85, 78, 41, 56, 74, 45, 48);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (181, 'Derecho', 1.7, 181, 6, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (181, 5);

-- Iván Marcone
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (182, 'Iván Marcone', '1990-06-03', 35, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (182, 70, 88, 40, 59, 52, 49, 40, 42, 90, 49);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (182, 'Derecho', 1.83, 182, 6, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (182, 5);

-- Felipe Loyola
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (183, 'Felipe Loyola', '2000-11-09', 24, 'Chile');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (183, 88, 58, 64, 80, 62, 72, 62, 72, 44, 73);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (183, 'Derecho', 1.8, 183, 6, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (183, 6);

-- Pablo Galdames
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (184, 'Pablo Galdames', '1996-12-30', 28, 'Chile');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (184, 67, 75, 57, 57, 85, 64, 50, 69, 90, 45);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (184, 'Derecho', 1.76, 184, 6, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (184, 6);

-- Federico Mancuello
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (185, 'Federico Mancuello', '1989-03-26', 36, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (185, 52, 63, 54, 60, 70, 79, 71, 40, 86, 87);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (185, 'Izquierdo', 1.77, 185, 6, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (185, 6);

-- Lautaro Millán
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (186, 'Lautaro Millán', '2005-08-16', 19, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (186, 52, 81, 82, 46, 62, 51, 46, 59, 59, 66);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (186, 'Derecho', 1.69, 186, 6, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (186, 8);

-- Luciano Cabral
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (187, 'Luciano Cabral', '1995-04-26', 30, 'Chile');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (187, 66, 49, 76, 42, 47, 45, 45, 57, 54, 70);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (187, 'Derecho', 1.72, 187, 6, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (187, 10);

-- Diego Tarzia
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (188, 'Diego Tarzia', '2003-04-26', 22, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (188, 59, 51, 42, 47, 73, 63, 47, 80, 67, 90);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (188, 'Izquierdo', 1.74, 188, 6, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (188, 12);

-- Braian Martínez
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (189, 'Braian Martínez', '1999-08-18', 25, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (189, 42, 84, 80, 67, 72, 47, 46, 71, 72, 70);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (189, 'Derecho', 1.6, 189, 6, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (189, 12);

-- Santiago Montiel
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (190, 'Santiago Montiel', '2000-11-22', 24, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (190, 85, 59, 45, 60, 50, 68, 49, 69, 75, 65);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (190, 'Izquierdo', 1.66, 190, 6, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (190, 13);

-- Lucas Román
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (191, 'Lucas Román', '2004-02-10', 21, 'Italia');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (191, 53, 62, 54, 59, 73, 67, 52, 46, 87, 41);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (191, 'Izquierdo', 1.6, 191, 6, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (191, 13);

-- Matías Giménez
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (192, 'Matías Giménez', '1999-03-06', 26, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (192, 49, 85, 73, 75, 41, 86, 87, 85, 41, 60);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (192, 'Izquierdo', 1.85, 192, 6, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (192, 9);

-- Santiago Hidalgo
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (193, 'Santiago Hidalgo', '2005-02-17', 20, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (193, 77, 81, 90, 78, 86, 62, 55, 62, 70, 83);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (193, 'Izquierdo', 1.74, 193, 6, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (193, 9);

-- Gabriel Ávalos
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (194, 'Gabriel Ávalos', '1990-10-12', 34, 'Paraguay');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (194, 45, 43, 83, 58, 69, 70, 70, 42, 57, 60);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (194, 'Derecho', 1.9, 194, 6, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (194, 9);

-- Ignacio Maestro Puch
INSERT INTO person (id, name, birth_date, age, nationality) VALUES (195, 'Ignacio Maestro Puch', '2003-08-13', 21, 'Argentina');
INSERT INTO attributes (id, passing, shooting, dribbling, tackling, pace, stamina, vision, positioning, decision_making, strength) VALUES (195, 59, 85, 88, 53, 83, 46, 76, 82, 50, 57);
INSERT INTO player (id, foot, height, attr_id, club_id, ya_id) VALUES (195, 'Derecho', 1.76, 195, 6, NULL);
INSERT INTO player_position (player_id, position_id) VALUES (195, 9);
