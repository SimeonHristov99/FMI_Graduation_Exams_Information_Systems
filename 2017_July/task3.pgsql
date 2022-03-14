-- 1.
SELECT
    studioname,
    title,
    year
FROM
    movie m
WHERE
    year = (
        SELECT
            max(year)
        FROM
            movie
        WHERE
            studioname = m.studioname);

-- 2.
SELECT
    name,
    coalesce(sum(length), 0) AS len
FROM
    movieexec
    JOIN movie ON producercert = certnum
WHERE
    EXISTS (
        SELECT
            m.year
        FROM
            movie m
        WHERE
            m.producercert = certnum
            AND m.year < 1980)
GROUP BY
    name;

-- 3.
-- todo