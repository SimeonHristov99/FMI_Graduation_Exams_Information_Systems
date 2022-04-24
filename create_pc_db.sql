-- Code to recreate schema
-- Recreate the schema
DROP SCHEMA public CASCADE;
CREATE SCHEMA public;
-- Restore default permissions
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO public;


CREATE TABLE laptop (
    code int NOT NULL,
    model varchar(4) NOT NULL,
    speed decimal(4, 0) NOT NULL,
    ram decimal(4, 0) NOT NULL,
    hd decimal(3, 0) NOT NULL,
    price float NOT NULL,
    screen int NOT NULL
);

CREATE TABLE pc (
    code int NOT NULL,
    model varchar(4) NOT NULL,
    speed decimal(4, 0) NOT NULL,
    ram decimal(4, 0) NOT NULL,
    hd decimal(3, 0) NOT NULL,
    cd varchar(3) NOT NULL,
    price float NOT NULL
);

CREATE TABLE product (
    maker char(1) NOT NULL,
    model varchar(4) NOT NULL,
    type varchar(7) NOT NULL
);

CREATE TABLE printer (
    code int NOT NULL,
    model varchar(4) NOT NULL,
    color char(1) NOT NULL,
    type varchar(6) NOT NULL,
    price float NOT NULL
);

ALTER TABLE laptop
    ADD CONSTRAINT PK_laptop PRIMARY KEY (code);

ALTER TABLE pc
    ADD CONSTRAINT PK_pc PRIMARY KEY (code);

ALTER TABLE product
    ADD CONSTRAINT PK_product PRIMARY KEY (model);

ALTER TABLE printer
    ADD CONSTRAINT PK_printer PRIMARY KEY (code);

ALTER TABLE laptop
    ADD CONSTRAINT FK_laptop_product FOREIGN KEY (model) REFERENCES product (model);

ALTER TABLE pc
    ADD CONSTRAINT FK_pc_product FOREIGN KEY (model) REFERENCES product (model);

ALTER TABLE printer
    ADD CONSTRAINT FK_printer_product FOREIGN KEY (model) REFERENCES product (model);

----Product------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO product
    VALUES ('B', '1121', 'PC');

INSERT INTO product
    VALUES ('A', '1232', 'PC');

INSERT INTO product
    VALUES ('A', '1233', 'PC');

INSERT INTO product
    VALUES ('E', '1260', 'PC');

INSERT INTO product
    VALUES ('A', '1276', 'Printer');

INSERT INTO product
    VALUES ('D', '1288', 'Printer');

INSERT INTO product
    VALUES ('A', '1298', 'Laptop');

INSERT INTO product
    VALUES ('C', '1321', 'Laptop');

INSERT INTO product
    VALUES ('A', '1401', 'Printer');

INSERT INTO product
    VALUES ('A', '1408', 'Printer');

INSERT INTO product
    VALUES ('D', '1433', 'Printer');

INSERT INTO product
    VALUES ('E', '1434', 'Printer');

INSERT INTO product
    VALUES ('B', '1750', 'Laptop');

INSERT INTO product
    VALUES ('A', '1752', 'Laptop');

INSERT INTO product
    VALUES ('E', '2111', 'PC');

INSERT INTO product
    VALUES ('E', '2112', 'PC');

----PC------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO pc
    VALUES (1, '1232', 500, 64, 5, '12x', 600);

INSERT INTO pc
    VALUES (2, '1121', 750, 128, 14, '40x', 850);

INSERT INTO pc
    VALUES (3, '1233', 500, 64, 5, '12x', 600);

INSERT INTO pc
    VALUES (4, '1121', 600, 128, 14, '40x', 850);

INSERT INTO pc
    VALUES (5, '1121', 600, 128, 8, '40x', 850);

INSERT INTO pc
    VALUES (6, '1233', 750, 128, 20, '50x', 950);

INSERT INTO pc
    VALUES (7, '1232', 500, 32, 10, '12x', 400);

INSERT INTO pc
    VALUES (8, '1232', 450, 64, 8, '24x', 350);

INSERT INTO pc
    VALUES (9, '1232', 450, 32, 10, '24x', 350);

INSERT INTO pc
    VALUES (10, '1260', 500, 32, 10, '12x', 350);

INSERT INTO pc
    VALUES (11, '1233', 900, 128, 40, '40x', 980);

----Laptop------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO laptop
    VALUES (1, '1298', 350, 32, 4, 700, 11);

INSERT INTO laptop
    VALUES (2, '1321', 500, 64, 8, 970, 12);

INSERT INTO laptop
    VALUES (3, '1750', 750, 128, 12, 1200, 14);

INSERT INTO laptop
    VALUES (4, '1298', 600, 64, 10, 1050, 15);

INSERT INTO laptop
    VALUES (5, '1752', 750, 128, 10, 1150, 14);

INSERT INTO laptop
    VALUES (6, '1298', 450, 64, 10, 950, 12);

----Printer------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO printer
    VALUES (1, '1276', 'n', 'Laser', 400);

INSERT INTO printer
    VALUES (2, '1433', 'y', 'Jet', 270);

INSERT INTO printer
    VALUES (3, '1434', 'y', 'Jet', 290);

INSERT INTO printer
    VALUES (4, '1401', 'n', 'Matrix', 150);

INSERT INTO printer
    VALUES (5, '1408', 'n', 'Matrix', 270);

INSERT INTO printer
    VALUES (6, '1288', 'n', 'Laser', 400);

