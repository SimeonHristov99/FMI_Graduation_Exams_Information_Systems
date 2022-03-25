-- 1. A)
SELECT
    t.name,
    title
FROM
    movie m
    JOIN (
        SELECT
            name,
            certnum
        FROM
            movieexec
        WHERE
            certnum IN (
                SELECT
                    producercert
                FROM
                    movie
                WHERE
                    title = 'Pretty Woman')) t ON m.producercert = t.certnum;

-- 2. Г)
SELECT
    studioname,
    starname,
    COUNT(*)
FROM
    movie m
    JOIN starsin ON title = movietitle
        AND year = movieyear
WHERE
    studioname IS NOT NULL
GROUP BY
    studioname,
    starname
HAVING
    COUNT(*) >= ALL (
        SELECT
            COUNT(*)
        FROM
            movie,
            starsin
        WHERE
            title = movietitle
            AND year = movieyear
            AND studioname = m.studioname
        GROUP BY
            studioname,
            starname);
