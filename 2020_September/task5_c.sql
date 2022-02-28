CREATE TABLE client (
    telephone varchar(12) NOT NULL PRIMARY KEY,
    name varchar(50),
    address varchar(150)
);

CREATE TABLE pizza (
    id char(5) NOT NULL PRIMARY KEY,
    name varchar(50),
    price float8 CHECK (price >= 0),
    weight integer CHECK (weight >= 0)
);

CREATE TABLE ingredient (
    id serial NOT NULL PRIMARY KEY,
    name varchar(30),
    price float8 CHECK (price >= 0),
    amount int CHECK (amount >= 0)
);

CREATE TABLE drink (
    id char(5) NOT NULL PRIMARY KEY,
    name varchar(50),
    price float8 CHECK (price >= 0),
    amount int CHECK (amount >= 0)
);

CREATE TABLE client_order (
    order_id serial NOT NULL PRIMARY KEY,
    date timestamp DEFAULT now(),
    client_id varchar(12) REFERENCES client (telephone) ON DELETE CASCADE
);

CREATE TABLE containsl (
    pizza_id char(5) NOT NULL REFERENCES pizza (id) ON DELETE CASCADE,
    ingredient_id serial NOT NULL REFERENCES ingredient (id) ON DELETE CASCADE,
    quantity float8 CHECK (quantity >= 0),
    CONSTRAINT primaryKey PRIMARY KEY (pizza_id, ingredient_id)
);

CREATE TABLE containsd (
    order_id serial NOT NULL REFERENCES client_order (order_id) ON DELETE CASCADE,
    drink_id char(5) NOT NULL REFERENCES drink (id) ON DELETE CASCADE,
    quantity float8 CHECK (quantity >= 0),
    CONSTRAINT pk PRIMARY KEY (order_id, drink_id)
);

CREATE TABLE containsp (
    order_id serial NOT NULL REFERENCES client_order (order_id) ON DELETE CASCADE,
    pizza_id char(5) NOT NULL REFERENCES pizza (id) ON DELETE CASCADE,
    quantity float8 CHECK (quantity >= 0),
    CONSTRAINT pk_containsp PRIMARY KEY (order_id, pizza_id)
);

-- Test
INSERT INTO client
    VALUES ('0912312', 'test', 'test address 1'), ('09111222', 'test 2', 'test address 2');

INSERT INTO pizza
    VALUES ('abc12', 'mozza', 12.54, 1200);

INSERT INTO ingredient (name, price, amount)
    VALUES ('tomato', 0.20, 10);

INSERT INTO drink
    VALUES ('ba321', 'fanta', 1.20, 500);

INSERT INTO containsl
    VALUES ('abc12', 1, 50);

INSERT INTO client_order (client_id)
    VALUES ('0912312');

INSERT INTO client_order (client_id)
    VALUES ('09111222');

INSERT INTO client_order (client_id)
    VALUES ('0912312');

INSERT INTO containsd
    VALUES (1, 'ba321', 1000);

INSERT INTO containsp
    VALUES (1, 'abc12', 3);

SELECT
    *
FROM
    containsd;

SELECT
    *
FROM
    containsp;
