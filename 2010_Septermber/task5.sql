-- 1.
SELECT
    ms.name
FROM
    moviestar ms
WHERE
    lower(ms.gender) = 'f'
    AND NOT EXISTS (
        SELECT
            movietitle
        FROM
            starsin
        WHERE
            movieyear BETWEEN 1970 AND 1979
            AND starname = ms.name);

-- 2.
SELECT
    name,
    min(movieyear) AS debut_age
FROM
    moviestar
    JOIN starsin ON name = starname
WHERE
    extract(year FROM birthdate) < 1990
GROUP BY
    name;

