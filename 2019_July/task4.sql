-- a)
-- Answer: C)
SELECT
    s.name,
    count(m.title) AS cnt
FROM
    studio s
    JOIN movie m ON s.name = m.studioname
GROUP BY
    s.name
HAVING
    count(m.title) < 2;

-- b)
SELECT
    me.name
FROM
    movieexec me
WHERE
    me.networth = (
        SELECT
            min(networth)
        FROM
            movieexec);

