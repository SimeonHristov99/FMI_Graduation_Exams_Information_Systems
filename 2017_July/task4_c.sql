CREATE TABLE tour (
    id serial NOT NULL,
    name varchar(100),
    days integer,
    vehicle char(1),
    price decimal(10, 2),
    agency_name varchar(100),
    agency_website varchar(100),
    CONSTRAINT pk_tour PRIMARY KEY (id),
    CONSTRAINT chk_tour_vehicle CHECK (vehicle = 'A' OR vehicle = 'B'),
    CONSTRAINT chk_tour_website CHECK (agency_website LIKE 'http://%' OR agency_website LIKE 'https://%')
);

CREATE TABLE landmark (
    id serial NOT NULL,
    name varchar(100),
    city varchar(100),
    country varchar(100),
    CONSTRAINT pk_landmark PRIMARY KEY (id)
);

CREATE TABLE includes (
    tour_id serial NOT NULL,
    landmark_id serial NOT NULL,
    CONSTRAINT pk_includes PRIMARY KEY (tour_id, landmark_id),
    CONSTRAINT fk_includes_tour FOREIGN KEY (tour_id) REFERENCES tour (id),
    CONSTRAINT fk_includes_landmark FOREIGN KEY (landmark_id) REFERENCES landmark (id)
);

