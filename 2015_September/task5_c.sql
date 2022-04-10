CREATE TABLE category (
    id serial NOT NULL,
    name varchar(20),
    CONSTRAINT pk_category PRIMARY KEY (id)
);

CREATE TABLE appliance (
    id serial NOT NULL,
    manufacturer varchar(50) NOT NULL,
    model varchar(20) NOT NULL,
    year_made integer,
    client_name varchar(100) NOT NULL,
    category_id serial,
    CONSTRAINT pk_appliance PRIMARY KEY (id),
    CONSTRAINT fk_appliance FOREIGN KEY (category_id) REFERENCES category (id),
    CONSTRAINT chk_appliance_year CHECK (year_made > 1900)
);

CREATE TABLE technician (
    id serial NOT NULL,
    name varchar(100),
    ssn char(10),
    CONSTRAINT pk_technician PRIMARY KEY (id)
);

CREATE TABLE can_fix (
    category_id serial NOT NULL,
    technician_id serial NOT NULL,
    CONSTRAINT pk_can_fix PRIMARY KEY (category_id, technician_id),
    CONSTRAINT fk_can_fix_cat FOREIGN KEY (category_id) REFERENCES category (id) ON DELETE CASCADE,
    CONSTRAINT fk_can_fix_tech FOREIGN KEY (technician_id) REFERENCES technician (id) ON DELETE CASCADE
);

CREATE TABLE fixes (
    technician_id serial NOT NULL,
    appliance_id serial NOT NULL,
    date date,
    price decimal(10, 2),
    CONSTRAINT pk_fixes PRIMARY KEY (technician_id, appliance_id),
    CONSTRAINT fk_fixes_t FOREIGN KEY (technician_id) REFERENCES technician (id) ON DELETE CASCADE,
    CONSTRAINT fk_fixes_a FOREIGN KEY (appliance_id) REFERENCES appliance (id) ON DELETE CASCADE
);

