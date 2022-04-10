DROP SCHEMA public CASCADE;
CREATE SCHEMA public;
-- Restore default permissions
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO public;

CREATE TABLE agency (
    id serial NOT NULL,
    website varchar(1000) UNIQUE,
    name varchar(50),
    CONSTRAINT pk_agency PRIMARY KEY (id),
    CONSTRAINT chk_agency_website CHECK (website LIKE 'http://%' OR website LIKE 'https://%')
);

CREATE TABLE offer (
    id serial NOT NULL,
    description varchar(1000) NOT NULL,
    city varchar(30) NOT NULL,
    neigh varchar(1000) NOT NULL,
    price decimal(10, 2) NOT NULL,
    space integer NOT NULL,
    closeObj varchar(50),
    agency_id serial NOT NULL,
    CONSTRAINT pk_offer PRIMARY KEY (id),
    CONSTRAINT fk_offer_agency FOREIGN KEY (agency_id) REFERENCES agency (id) ON DELETE CASCADE
);

CREATE TABLE apartment_offer (
    id serial NOT NULL,
    floor integer NOT NULL,
    rooms integer NOT NULL,
    description varchar(1000) NOT NULL,
    city varchar(30) NOT NULL,
    neigh varchar(1000) NOT NULL,
    price decimal(10, 2) NOT NULL,
    space integer NOT NULL,
    closeObj varchar(50),
    agency_id serial NOT NULL,
    CONSTRAINT pk_apart_offer PRIMARY KEY (id),
    CONSTRAINT fk_offer_apart FOREIGN KEY (agency_id) REFERENCES agency (id) ON DELETE CASCADE
);

CREATE TABLE land_offer (
    id serial NOT NULL,
    is_regulated char(1),
    description varchar(1000) NOT NULL,
    city varchar(30) NOT NULL,
    neigh varchar(1000) NOT NULL,
    price decimal(10, 2) NOT NULL,
    space integer NOT NULL,
    closeObj varchar(50),
    agency_id serial NOT NULL,
    CONSTRAINT pk_land_offer PRIMARY KEY (id),
    CONSTRAINT chk_regulated CHECK (is_regulated IN ('0', '1')),
    CONSTRAINT fk_offer_land FOREIGN KEY (agency_id) REFERENCES agency (id) ON DELETE CASCADE
);

