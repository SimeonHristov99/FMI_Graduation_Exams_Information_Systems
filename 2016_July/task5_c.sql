CREATE TABLE plastic (
    id serial NOT NULL,
    name varchar(50),
    CONSTRAINT pk_plastic PRIMARY KEY (id)
);

CREATE TABLE card (
    id serial NOT NULL,
    price decimal(10, 2) NOT NULL,
    plastic_id serial NOT NULL,
    CONSTRAINT pk_card PRIMARY KEY (id),
    CONSTRAINT fk_card_plastic FOREIGN KEY (plastic_id) REFERENCES plastic (id) ON DELETE CASCADE
);

CREATE TABLE travel_card (
    id serial NOT NULL,
    price decimal(10, 2) NOT NULL,
    num_travels integer NOT NULL,
    plastic_id serial NOT NULL,
    CONSTRAINT pk_travel_card PRIMARY KEY (id),
    CONSTRAINT fk_travel_card_plastic FOREIGN KEY (plastic_id) REFERENCES plastic (id) ON DELETE CASCADE
);

CREATE TABLE line_card (
    id serial NOT NULL,
    price decimal(10, 2),
    date_start date NOT NULL,
    date_end date,
    plastic_id serial NOT NULL,
    CONSTRAINT pk_line_card PRIMARY KEY (id),
    CONSTRAINT fk_line_card_plastic FOREIGN KEY (plastic_id) REFERENCES plastic (id) ON DELETE CASCADE
);

CREATE TABLE transport_line (
    number integer not null,
    vehicle_type varchar(10),
    CONSTRAINT pk_transport_line PRIMARY KEY (number),
    CONSTRAINT chk_type_transport_line CHECK (vehicle_type IN ('Metro', 'Tramvai', 'Troleibus'))
);

CREATE TABLE card_for_line (
    line_card_id serial NOT NULL,
    transport_line_number integer,
    CONSTRAINT pk_for PRIMARY KEY (line_card_id, transport_line_number),
    CONSTRAINT fk_for FOREIGN KEY (transport_line_number) REFERENCES transport_line (number)
);

