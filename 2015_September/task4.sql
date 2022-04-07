-- 1 б
SELECT
    *
FROM (
    SELECT
        name,
        address
    FROM
        MovieStar
    WHERE
        gender = 'F'
    UNION
    SELECT
        name,
        address
    FROM
        Studio) T
WHERE
    T.address LIKE '%Sofia%'
ORDER BY
    T.address;

-- 2 в
SELECT
    Studio.name,
    Studio.address,
    AVG(Movie.length) AS avgLength
FROM
    Movie
    RIGHT JOIN Studio ON studioName = name
GROUP BY
    name,
    address
HAVING (
    SELECT
        COUNT(*)
    FROM
        Movie
    WHERE
        inColor = 'n') <= 3;
