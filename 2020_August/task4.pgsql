-- Update tables so as to have reasonable output.
INSERT INTO moviestar
    VALUES ('Robert Jr.', 'Test address', 'M', make_date(2020, 07, 25));

INSERT INTO moviestar
    VALUES ('Roberta Jr. Senior', 'Y path', 'F', make_date(1992, 05, 5));

INSERT INTO moviestar
    VALUES ('Test', 'Z path', 'M', make_date(1952, 05, 5));

INSERT INTO starsin
    VALUES ('The Man Who Wasn''t There', 2001, 'Test');

INSERT INTO starsin
    VALUES ('Star Wars', 1977, 'Robert Jr.');

INSERT INTO starsin
    VALUES ('Star Wars', 1977, 'Zoro');

INSERT INTO moviestar
    VALUES ('Zoro', 'Baldwin Av.', 'M', make_date(1977, 7, 6));

-- a)
SELECT
    ms.name,
    ms.birthdate
FROM
    moviestar ms
WHERE
    lower(ms.name)
    NOT LIKE '%jr.%' AND 0 < (
        SELECT
            count(*)
        FROM
            starsin si
            JOIN movie m ON m.title = si.movietitle
                AND m.year = si.movieyear
        WHERE
            si.starname = ms.name
            AND LOWER(m.incolor) = 'y')
ORDER BY
    AGE(CURRENT_DATE, ms.birthdate),
    ms.name;

