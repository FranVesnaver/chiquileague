INSERT INTO country (id, name) VALUES 
    (1,"Argentina"),
    (2,"Brasil"),
    (3,"España"),
    (4,"Inglaterra")
;

INSERT INTO competition (id, name, competition_format) VALUES 
    (1,"Primera División (Argentina)","CHIQUI_LEAGUE"),
    (2,"Primera Nacional (Argentina)","B_ARGENTINA"),
    (3,"Campeonato Brasileiro Serie A","DOUBLE_ROUND_ROBIN"),
    (4,"Campeonato Brasileiro Serie B","DOUBLE_ROUND_ROBIN"),
    (5,"La Liga","DOUBLE_ROUND_ROBIN"),
    (6,"Segunda División (España)","DOUBLE_ROUND_ROBIN_PLAYOFF"),
    (7,"Premier League","DOUBLE_ROUND_ROBIN"),
    (8,"Championship (Inglaterra)","DOUBLE_ROUND_ROBIN_PLAYOFF"),
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

INSERT INTO cup (id) VALUES
	(9),  -- Libertadores
    (10), -- Champions
    (11), -- Copa Argentina, Argentina
    (12), -- Copa Do Brasil, Brasil
    (13), -- Copa Del Rey, España
    (14)  -- The FA Cup, Inglaterra
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