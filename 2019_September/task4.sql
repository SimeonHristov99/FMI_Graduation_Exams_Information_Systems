-- task 1
-- Answer: Б)
SELECT
    me.name,
    m.year,
    count(*) AS cnt
FROM
    movieexec me
    JOIN movie m ON me.certnum = m.producercert
GROUP BY
    me.certnum,
    me.name,
    m.year;

-- task 2
SELECT
    m.name
FROM
    moviestar m
WHERE (CURRENT_DATE - birthdate) = (
    SELECT
        min(CURRENT_DATE - birthdate)
    FROM
        moviestar)
