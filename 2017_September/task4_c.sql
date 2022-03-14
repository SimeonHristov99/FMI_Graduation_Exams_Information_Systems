CREATE TABLE writer (
    id serial NOT NULL,
    name varchar(100),
    city varchar(100),
    country varchar(100),
    CONSTRAINT pk_writer PRIMARY KEY (id)
);

CREATE TABLE category (
    id serial NOT NULL,
    name varchar(100),
    CONSTRAINT pk_category PRIMARY KEY (id),
    CONSTRAINT chk_category CHECK (name NOT LIKE '%?%' and name NOT LIKE '%!%')
);

CREATE TABLE writes_in (
    writer_id serial NOT NULL,
    category_id serial NOT NULL,
    date_start date NOT NULL,
    date_end date,
    CONSTRAINT pk_writes_in PRIMARY KEY (writer_id, category_id),
    CONSTRAINT fk_writes_in_writer FOREIGN KEY (writer_id) REFERENCES writer (id),
    CONSTRAINT fk_writes_in_category FOREIGN KEY (category_id) REFERENCES category (id)
);

CREATE TABLE keyword (
    id serial NOT NULL,
    word varchar(100),
    CONSTRAINT pk_keyword PRIMARY KEY (id)
);

CREATE TABLE news_article (
    id serial NOT NULL,
    date date,
    content varchar(8000),
    writer_id serial NOT NULL,
    category_id serial NOT NULL,
    CONSTRAINT pk_news_article PRIMARY KEY (id),
    CONSTRAINT fk_news_article_writer FOREIGN KEY (writer_id) REFERENCES writer (id) ON DELETE CASCADE,
    CONSTRAINT fk_news_article_category FOREIGN KEY (category_id) REFERENCES category (id) ON DELETE CASCADE
);

CREATE TABLE k_in_a (
    keyword_id serial NOT NULL,
    article_id serial NOT NULL,
    CONSTRAINT pk_k_in_a PRIMARY KEY (keyword_id, article_id),
    CONSTRAINT fk_k_in_a_keyword FOREIGN KEY (keyword_id) REFERENCES keyword (id),
    CONSTRAINT fk_k_in_a_article FOREIGN KEY (article_id) REFERENCES news_article (id)
);

