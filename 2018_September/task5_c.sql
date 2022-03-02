CREATE TABLE season (
    id serial NOT NULL UNIQUE,
    production varchar(50) NOT NULL UNIQUE,
    date_start date,
    date_end date,
    CONSTRAINT pk_season PRIMARY KEY (id, production)
);

CREATE TABLE episode (
    number serial NOT NULL UNIQUE,
    date_shown date,
    length int8,
    season_id serial NOT NULL UNIQUE,
    prod_name varchar(50) NOT NULL UNIQUE,
    CONSTRAINT chk_episode_len CHECK (length > 0),
    CONSTRAINT fk_episode_season FOREIGN KEY (season_id) REFERENCES season (id) ON DELETE CASCADE,
    CONSTRAINT fk_episode_prod FOREIGN KEY (prod_name) REFERENCES season (production) ON DELETE CASCADE,
    CONSTRAINT pk_episode PRIMARY KEY (number, season_id, prod_name)
);

CREATE TABLE hero (
    id serial NOT NULL,
    name varchar(50),
    actor_name varchar(50),
    CONSTRAINT pk_hero PRIMARY KEY (id)
);

CREATE TABLE stars_in (
    season serial NOT NULL,
    season_prod varchar(50) NOT NULL,
    episode_num serial NOT NULL,
    hero_id serial NOT NULL,
    CONSTRAINT fk_si_s_id FOREIGN KEY (season) REFERENCES episode (season_id),
    CONSTRAINT fk_si_s_prod FOREIGN KEY (season_prod) REFERENCES episode (prod_name),
    CONSTRAINT fk_si_episode_num FOREIGN KEY (episode_num) REFERENCES episode (number),
    CONSTRAINT fk_si_hero FOREIGN KEY (hero_id) REFERENCES hero (id),
    CONSTRAINT pk_stars_in PRIMARY KEY (season, season_prod, episode_num, hero_id)
);

