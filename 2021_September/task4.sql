-- Task 1: в
SELECT
    studioName
FROM
    Movie
WHERE
    inColor = 'Y'
INTERSECT
SELECT
    studioName
FROM
    Movie
WHERE
    length IS NULL;

-- Task 2: б)
SELECT
    name,
    COUNT(title)
FROM
    MovieStar
    LEFT JOIN StarsIn ON name = starName
    LEFT JOIN Movie ON movieTitle = title
        AND movieYear = year
        AND inColor = 'N'
WHERE
    gender = 'F'
GROUP BY
    name;

