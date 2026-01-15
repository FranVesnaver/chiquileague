-- CREATE DATABASE chiqui;
-- USE chiqui;
-- DROP DATABASE chiqui;

CREATE TABLE country (
    id INTEGER NOT NULL,
    name VARCHAR(255) NOT NULL UNIQUE,
    PRIMARY KEY (id)
);

CREATE TABLE competition (
    id INTEGER NOT NULL,
    name VARCHAR(255) NOT NULL UNIQUE,
    competition_format VARCHAR(50) NOT NULL,
    type VARCHAR(30) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE national_cup (
    id INTEGER NOT NULL,
    country_id INTEGER NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES competition(id),
    FOREIGN KEY (country_id) REFERENCES country(id)
);

CREATE TABLE international_cup (
    id INTEGER NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES competition(id)
);

CREATE TABLE international_cup_country (
    id INTEGER NOT NULL,
    country_id INTEGER NOT NULL,
    PRIMARY KEY (id, country_id),
    FOREIGN KEY (id) REFERENCES international_cup(id),
    FOREIGN KEY (country_id) REFERENCES country(id)
);

CREATE TABLE league (
    id INTEGER NOT NULL,
    country_id INTEGER NOT NULL,
    league_rank INTEGER NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES competition(id),
    FOREIGN KEY (country_id) REFERENCES country(id)
);

CREATE TABLE club (
    id INTEGER NOT NULL,
    name VARCHAR(255) NOT NULL,
    league_id INTEGER NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (league_id) REFERENCES league(id)
);

CREATE TABLE participates(
	competition_id INTEGER,
    club_id INTEGER,
    points INTEGER DEFAULT 0,
    matches_played INTEGER GENERATED ALWAYS AS (wins + draws + losses) STORED,
    wins INTEGER DEFAULT 0,
    draws INTEGER DEFAULT 0,
    losses INTEGER DEFAULT 0,
    goals_for INTEGER DEFAULT 0,
    goals_against INTEGER DEFAULT 0,
    goal_difference INTEGER GENERATED ALWAYS AS (goals_for - goals_against) STORED,
    PRIMARY KEY (competition_id, club_id),
    FOREIGN KEY (competition_id) REFERENCES competition(id),
    FOREIGN KEY (club_id) REFERENCES club(id)
);

CREATE TABLE attributes (
    id INTEGER NOT NULL,
    passing INTEGER NOT NULL,
    shooting INTEGER NOT NULL,
    dribbling INTEGER NOT NULL,
    tackling INTEGER NOT NULL,
    pace INTEGER NOT NULL,
    stamina INTEGER NOT NULL,
    vision INTEGER NOT NULL,
    positioning INTEGER NOT NULL,
    decision_making INTEGER NOT NULL,
    strength INTEGER NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE youth_academy (
    id INTEGER NOT NULL,
    club_id INTEGER NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (club_id) REFERENCES club(id)
);

CREATE TABLE person (
    id INTEGER,
    name VARCHAR(255) NOT NULL,
    birth_date DATE NOT NULL,
    age INTEGER NOT NULL,
    nationality VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE manager (
    id INTEGER NOT NULL,
    club_id INTEGER NOT NULL,
    FOREIGN KEY (id) REFERENCES person(id),
    FOREIGN KEY (club_id) REFERENCES club(id)
);

CREATE TABLE player (
    id INTEGER NOT NULL,
    foot VARCHAR(12) NOT NULL,
    height DECIMAL(5,2) NOT NULL,
    attr_id INTEGER NOT NULL,
    club_id INTEGER NOT NULL,
    ya_id INTEGER,
    FOREIGN KEY (id) REFERENCES person(id),
    FOREIGN KEY (club_id) REFERENCES club(id),
    FOREIGN KEY (attr_id) REFERENCES attributes(id),
    FOREIGN KEY (ya_id) REFERENCES youth_academy(id)
);

CREATE TABLE f_position (
    id INTEGER NOT NULL,
    name VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO f_position (id, name) VALUES
    (1,"PO"),
    (2,"DFC"),
    (3,"DFI"),
    (4,"DFD"),
    (5,"MCD"),
    (6,"MC"),
    (7,"MI"),
    (8,"MD"),
    (9,"DC"),
    (10,"MCO"),
    (11,"MP"),
    (12,"EI"),
    (13,"ED")
;

CREATE TABLE player_position (
    player_id INTEGER NOT NULL,
    position_id INTEGER NOT NULL,
    PRIMARY KEY (player_id, position_id),
    FOREIGN KEY (player_id) REFERENCES player(id),
    FOREIGN KEY (position_id) REFERENCES f_position(id)
);

CREATE TABLE stadium (
    id INTEGER NOT NULL,
    name VARCHAR(255) NOT NULL UNIQUE,
    capacity INTEGER NOT NULL,
    club_id INTEGER NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (club_id) REFERENCES club(id)
);

CREATE TABLE f_match (
    id INTEGER,
    date DATE NOT NULL,
    home_goals INTEGER,
    away_goals INTEGER,
    home_club_id INTEGER NOT NULL,
    away_club_id INTEGER NOT NULL,
    stadium_id INTEGER NOT NULL,
    competition_id INTEGER NOT NULL,
    matchday INTEGER,
	PRIMARY KEY (id),
    FOREIGN KEY (home_club_id) REFERENCES club(id),
    FOREIGN KEY (away_club_id) REFERENCES club(id),
    FOREIGN KEY (stadium_id) REFERENCES stadium(id),
    FOREIGN KEY (competition_id) REFERENCES competition(id)
);

CREATE TABLE contract (
    id INTEGER,
    player_id INTEGER NOT NULL,
    club_id INTEGER NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    wage DECIMAL(10,2) NOT NULL,
    release_clause DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (player_id) REFERENCES player(id),
    FOREIGN KEY (club_id) REFERENCES club(id)
);

CREATE TABLE transfer (
    id INTEGER,
    player_id INTEGER NOT NULL,
    from_club_id INTEGER NOT NULL,
    to_club_id INTEGER NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    transfer_date DATE NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (player_id) REFERENCES player(id),
    FOREIGN KEY (from_club_id) REFERENCES club(id),
    FOREIGN KEY (to_club_id) REFERENCES club(id)
);

CREATE TABLE game (
	id INTEGER,
    name VARCHAR(50) NOT NULL UNIQUE,
    club_id INTEGER NOT NULL,
	time Date NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (club_id) REFERENCES club(id)
);