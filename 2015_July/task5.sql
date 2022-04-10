-- 1.
SELECT
    ms.name,
    ms.birthdate
FROM
    moviestar ms
WHERE
    ms.name NOT LIKE '%a'
    AND EXISTS (
        SELECT
            COUNT(starname)
        FROM
            starsin si
            JOIN movie m ON si.movietitle = m.title
                AND si.movieyear = m.year
        WHERE
            si.starname = ms.name
        GROUP BY
            si.starname
        HAVING
            count(DISTINCT incolor) = 2)
ORDER BY
    ms.birthdate,
    name;

-- For testing purposes.
-- INSERT INTO starsin
--     VALUES ('The Man Who Wasn''t There', 2001, 'Harrison Ford');


-- 2.
SELECT
    name,
    extract(year FROM ms.birthdate) AS "year_born",
    COALESCE((
        SELECT
            count(DISTINCT m.studioname)
        FROM movie m
    RIGHT JOIN starsin si ON m.title = si.movietitle
        AND m.year = si.movieyear
    WHERE
        si.starname = name), 0) AS "num_movies"
FROM
    moviestar ms
GROUP BY
    name
HAVING
    5 >= (
        SELECT
            count(DISTINCT m.studioname)
        FROM movie m
    RIGHT JOIN starsin si ON m.title = si.movietitle
        AND m.year = si.movieyear
    WHERE
        si.starname = name)
ORDER BY
    name;

