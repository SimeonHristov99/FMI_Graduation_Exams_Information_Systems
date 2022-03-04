-- a)
SELECT
    m.studioname,
    min(m.year) AS min_year,
    max(m.year) AS max_year,
    count(m.title) AS num_movies
FROM
    movie m
WHERE
    lower(m.studioname)
    LIKE 'm%'
GROUP BY
    m.studioname;

-- b)
-- add data, so as to have resonable output
INSERT INTO starsin
    VALUES ('Terms of Endearment', 1983, 'Sandra Bullock');

WITH t AS (
    SELECT
        ms.name AS starname,
        count(s.movietitle) AS num_movies
    FROM
        moviestar ms
        JOIN starsin s ON ms.name = s.starname
    WHERE
        lower(ms.gender)
        LIKE 'f'
    GROUP BY
        ms.name
)
SELECT
    starname,
    num_movies
FROM
    t
WHERE
    num_movies >= ALL (
        SELECT
            num_movies
        FROM
            t);

