CREATE TABLE client (
    id serial NOT NULL,
    name varchar(50),
    bank_account char(16),
    CONSTRAINT pk_client PRIMARY KEY (id)
);

CREATE TABLE owner_p (
    id serial NOT NULL,
    name varchar(50),
    iban char(22),
    CONSTRAINT pk_owner PRIMARY KEY (id)
);

CREATE TABLE property (
    id serial NOT NULL,
    address varchar(100),
    descr varchar(50),
    taken int8,
    rent int8,
    owner_id serial NOT NULL,
    CONSTRAINT pk_property PRIMARY KEY (id),
    CONSTRAINT fk_prop_owner FOREIGN KEY (owner_id) REFERENCES owner_p (id),
    CONSTRAINT chk_taken CHECK (taken = 0 OR taken = 1),
    CONSTRAINT chk_rent CHECK (rent > 0)
);

CREATE TABLE rents (
    client_id serial NOT NULL,
    prop_id serial NOT NULL,
    start_date date,
    end_date date,
    CONSTRAINT pk_rents PRIMARY KEY (client_id, prop_id),
    CONSTRAINT fk_rents_cl FOREIGN KEY (client_id) REFERENCES client (id),
    CONSTRAINT fk_rents_prop FOREIGN KEY (prop_id) REFERENCES property (id)
);

