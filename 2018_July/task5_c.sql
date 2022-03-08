CREATE TABLE candidate (
    fn serial NOT NULL,
    ssn char(10),
    name varchar(20),
    CONSTRAINT pk_candidate PRIMARY KEY (fn)
);

CREATE TABLE faculty (
    id serial NOT NULL,
    name varchar(50),
    address varchar(50),
    CONSTRAINT pk_faculty PRIMARY KEY (id),
    CONSTRAINT uniq_faculty_name UNIQUE (name)
);

CREATE TABLE exam (
    id serial NOT NULL,
    name varchar(50),
    date date,
    time time,
    faculty_id serial,
    CONSTRAINT pk_exam PRIMARY KEY (id),
    CONSTRAINT uniq_exam_name UNIQUE (name),
    CONSTRAINT fk_exam_faculty FOREIGN KEY (faculty_id) REFERENCES faculty (id) ON DELETE CASCADE
);

CREATE TABLE takes (
    candidate_fn serial NOT NULL,
    exam_id serial NOT NULL,
    date date,
    sess int,
    grade decimal(3, 2),
    CONSTRAINT pk_takes PRIMARY KEY (candidate_fn, exam_id),
    CONSTRAINT fk_takes_cand FOREIGN KEY (candidate_fn) REFERENCES candidate (fn),
    CONSTRAINT fk_takes_exam FOREIGN KEY (exam_id) REFERENCES exam (id),
    CONSTRAINT chk_takes_sess CHECK (sess > 0),
    CONSTRAINT chk_takes_grade CHECK (grade BETWEEN 2 AND 6)
);

