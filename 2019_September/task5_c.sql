CREATE TABLE patient (
    id serial NOT NULL,
    name varchar(50),
    CONSTRAINT pk_patient PRIMARY KEY (id)
);

CREATE TABLE dentist (
    id serial NOT NULL,
    name varchar(50),
    CONSTRAINT pk_dentist PRIMARY KEY (id)
);

CREATE TABLE proc (
    id serial NOT NULL,
    price float8,
    description varchar(100),
    CONSTRAINT pk_procedure PRIMARY KEY (id)
);

CREATE TABLE d_check (
    patient_id serial NOT NULL UNIQUE,
    dentist_id serial NOT NULL UNIQUE,
    date_made timestamp NOT NULL UNIQUE,
    symptoms varchar(50),
    CONSTRAINT pk_check PRIMARY KEY (patient_id, dentist_id, date_made),
    CONSTRAINT fk_check_patient FOREIGN KEY (patient_id) REFERENCES patient (id) ON DELETE CASCADE,
    CONSTRAINT fk_check_dentist FOREIGN KEY (dentist_id) REFERENCES dentist (id) ON DELETE CASCADE
);

CREATE TABLE applied (
    patient_id serial NOT NULL,
    dentist_id serial NOT NULL,
    date_made timestamp NOT NULL,
    proc_id serial NOT NULL,
    CONSTRAINT pk_applied PRIMARY KEY (patient_id, dentist_id, date_made, proc_id),
    CONSTRAINT fk_applied_check_p FOREIGN KEY (patient_id) REFERENCES d_check (patient_id),
    CONSTRAINT fk_applied_check_d FOREIGN KEY (dentist_id) REFERENCES d_check (dentist_id),
    CONSTRAINT fk_applied_check_date FOREIGN KEY (date_made) REFERENCES d_check (date_made),
    CONSTRAINT fk_applied_proc FOREIGN KEY (proc_id) REFERENCES proc (id)
);

