-- CREATE DATABASE chiqui;
-- USE chiqui;
-- DROP DATABASE chiqui;

CREATE TABLE country (
    id BIGINT NOT NULL,
    name VARCHAR(255) NOT NULL UNIQUE,
    PRIMARY KEY (id)
);

CREATE TABLE competition (
    id BIGINT NOT NULL,
    name VARCHAR(255) NOT NULL UNIQUE,
    PRIMARY KEY (id)
);

CREATE TABLE cup (
    id BIGINT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES competition(id)
);

CREATE TABLE national_cup (
    id BIGINT NOT NULL,
    country_id BIGINT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES cup(id),
    FOREIGN KEY (country_id) REFERENCES country(id)
);

CREATE TABLE international_cup (
    id BIGINT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES cup(id)
);

CREATE TABLE international_cup_country (
    id BIGINT NOT NULL,
    country_id BIGINT NOT NULL,
    PRIMARY KEY (id, country_id),
    FOREIGN KEY (id) REFERENCES international_cup(id),
    FOREIGN KEY (country_id) REFERENCES country(id)
);

CREATE TABLE league (
    id BIGINT NOT NULL,
    country_id BIGINT NOT NULL,
    league_rank INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES competition(id),
    FOREIGN KEY (country_id) REFERENCES country(id)
);

CREATE TABLE club (
    id BIGINT NOT NULL,
    name VARCHAR(255) NOT NULL,
    league_id BIGINT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (league_id) REFERENCES league(id)
);

CREATE TABLE attributes (
    id INT NOT NULL,
    passing INT NOT NULL,
    shooting INT NOT NULL,
    dribbling INT NOT NULL,
    tackling INT NOT NULL,
    pace INT NOT NULL,
    stamina INT NOT NULL,
    vision INT NOT NULL,
    positioning INT NOT NULL,
    decision_making INT NOT NULL,
    strength INT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE youth_academy (
    id BIGINT NOT NULL,
    club_id BIGINT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (club_id) REFERENCES club(id)
);

CREATE TABLE person (
    id BIGINT NOT NULL,
    name VARCHAR(255) NOT NULL,
    birth_date DATE NOT NULL,
    age INT NOT NULL,
    nationality VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE manager (
    id BIGINT NOT NULL,
    club_id BIGINT NOT NULL,
    FOREIGN KEY (id) REFERENCES person(id),
    FOREIGN KEY (club_id) REFERENCES club(id)
);

CREATE TABLE player (
    id BIGINT NOT NULL,
    foot VARCHAR(12) NOT NULL,
    height DECIMAL(5,2) NOT NULL,
    attr_id INT NOT NULL,
    club_id BIGINT NOT NULL,
    ya_id BIGINT,
    FOREIGN KEY (id) REFERENCES person(id),
    FOREIGN KEY (club_id) REFERENCES club(id),
    FOREIGN KEY (attr_id) REFERENCES attributes(id),
    FOREIGN KEY (ya_id) REFERENCES youth_academy(id)
);

CREATE TABLE f_position (
    id BIGINT NOT NULL,
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
    player_id BIGINT NOT NULL,
    position_id BIGINT NOT NULL,
    PRIMARY KEY (player_id, position_id),
    FOREIGN KEY (player_id) REFERENCES player(id),
    FOREIGN KEY (position_id) REFERENCES f_position(id)
);

CREATE TABLE stadium (
    id BIGINT NOT NULL,
    name VARCHAR(255) NOT NULL UNIQUE,
    capacity INT NOT NULL,
    club_id BIGINT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (club_id) REFERENCES club(id)
);

CREATE TABLE f_match (
    id BIGINT NOT NULL,
    date DATE NOT NULL,
    home_goals INT NOT NULL,
    away_goals INT NOT NULL,
    home_club_id BIGINT NOT NULL,
    away_club_id BIGINT NOT NULL,
    stadium_id BIGINT NOT NULL,
    competition_id BIGINT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (home_club_id) REFERENCES club(id),
    FOREIGN KEY (away_club_id) REFERENCES club(id),
    FOREIGN KEY (stadium_id) REFERENCES stadium(id),
    FOREIGN KEY (competition_id) REFERENCES competition(id)
);

CREATE TABLE contract (
    id BIGINT NOT NULL,
    player_id BIGINT NOT NULL,
    club_id BIGINT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    wage DECIMAL(10,2) NOT NULL,
    release_clause DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (player_id) REFERENCES player(id),
    FOREIGN KEY (club_id) REFERENCES club(id)
);

CREATE TABLE transfer (
    id BIGINT NOT NULL,
    player_id BIGINT NOT NULL,
    from_club_id BIGINT NOT NULL,
    to_club_id BIGINT NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    transfer_date DATE NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (player_id) REFERENCES player(id),
    FOREIGN KEY (from_club_id) REFERENCES club(id),
    FOREIGN KEY (to_club_id) REFERENCES club(id)
);