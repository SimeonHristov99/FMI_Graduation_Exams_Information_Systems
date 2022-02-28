CREATE TABLE client (
    telephone char(12) NOT NULL PRIMARY KEY,
    name varchar(50),
    email varchar(30)
);

CREATE TABLE technician (
    telephone char(12) NOT NULL PRIMARY KEY,
    name varchar(50),
    email varchar(30)
);

CREATE TABLE serv (
    id serial NOT NULL PRIMARY KEY,
    type varchar(40)
);

CREATE TABLE offers (
    tech_tele char(12) NOT NULL REFERENCES technician (telephone),
    serv_id bigint NOT NULL REFERENCES serv (id),
    charge integer,
    CONSTRAINT pk_offers PRIMARY KEY (tech_tele, serv_id)
);

CREATE TABLE orders (
    date_requested date NOT NULL UNIQUE,
    status varchar(10) UNIQUE,
    address varchar(20),
    client_telephone char(12) NOT NULL UNIQUE REFERENCES client (telephone) ON DELETE CASCADE,
    CONSTRAINT pk_order PRIMARY KEY (date_requested, client_telephone)
);

CREATE TABLE order_serv (
    date_requested date,
    cust_telephone char(12),
    serv_id bigint NOT NULL REFERENCES serv (id),
    CONSTRAINT pk_order_serv PRIMARY KEY (date_requested, cust_telephone, serv_id)
);

CREATE TABLE works_on (
    tech_tel char(12) NOT NULL REFERENCES technician (telephone),
    serv_id bigint NOT NULL REFERENCES serv (id),
    date_requested date NOT NULL REFERENCES orders (date_requested) ON DELETE CASCADE,
    cust_telephone char(12) NOT NULL REFERENCES orders (client_telephone) ON DELETE CASCADE,
    date_worked date,
    CONSTRAINT pk_works_on PRIMARY KEY (tech_tel, serv_id, date_requested, cust_telephone)
);
