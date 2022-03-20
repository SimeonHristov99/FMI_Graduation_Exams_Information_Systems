CREATE TABLE exam (
    id serial NOT NULL,
    title varchar(100),
    CONSTRAINT pk_exam PRIMARY KEY (id)
);

CREATE TABLE student (
    fn serial NOT NULL,
    name varchar(50),
    CONSTRAINT pk_student PRIMARY KEY (fn)
);

CREATE TABLE e_for_s (
    student_fn serial NOT NULL,
    exam_id serial NOT NULL,
    can_go char(1),
    CONSTRAINT pk_for PRIMARY KEY (student_fn, exam_id),
    CONSTRAINT fk_for_student FOREIGN KEY (student_fn) REFERENCES student (fn),
    CONSTRAINT fk_for_exam FOREIGN KEY (exam_id) REFERENCES exam (id),
    CONSTRAINT chk_can_go CHECK (can_go IN ('Y', 'N'))
);

CREATE TABLE question (
    id serial NOT NULL,
    description varchar(100),
    CONSTRAINT pk_question PRIMARY KEY (id)
);

CREATE TABLE part_of (
    q_id serial NOT NULL,
    e_id serial NOT NULL,
    points decimal(3, 1),
    CONSTRAINT pk_part_of PRIMARY KEY (q_id, e_id),
    CONSTRAINT fk_part_of_q FOREIGN KEY (q_id) REFERENCES question (id),
    CONSTRAINT fk_part_of_e FOREIGN KEY (e_id) REFERENCES exam (id),
    CONSTRAINT chk_points CHECK (points >= 1)
);

CREATE TABLE essay_question (
    id serial NOT NULL,
    description varchar(100),
    CONSTRAINT pk_essay_question PRIMARY KEY (id)
);

CREATE TABLE closed_question (
    id serial NOT NULL,
    description varchar(100),
    CONSTRAINT pk_closed_question PRIMARY KEY (id)
);

CREATE TABLE answer (
    id serial NOT NULL,
    value varchar(100),
    is_true char(1),
    closed_q_id serial, -- this can be left to be null when math question
    CONSTRAINT pk_answer PRIMARY KEY (id),
    CONSTRAINT chk_is_true CHECK (is_true IN ('Y', 'N')),
    CONSTRAINT fk_closed_q FOREIGN KEY (closed_q_id) REFERENCES closed_question (id)
);

CREATE TABLE math_question (
    id serial NOT NULL,
    description varchar(100),
    answer_id serial,
    CONSTRAINT pk_math_question PRIMARY KEY (id),
    CONSTRAINT fk_math_question FOREIGN KEY (answer_id) REFERENCES answer (id)
);

