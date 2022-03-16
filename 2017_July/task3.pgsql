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
SELECT
    starname,
    title,
    name,
    networth
FROM
    starsin
    JOIN movie ON movietitle = title
        AND movieyear = year
    JOIN (
        SELECT
            certnum,
            networth,
            name
        FROM
            movieexec
        WHERE
            networth = (
                SELECT
                    max(networth)
                FROM
                    movieexec)) t ON t.certnum = producercert;

-- 4.

