-- 1.
SELECT
    name,
    launched
FROM
    ships
WHERE
    launched IN (
        SELECT
            EXTRACT(year FROM date)
        FROM
            battles)
ORDER BY
    launched;


-- 2.
SELECT
    c.country,
    (
        SELECT
            count(o.ship)
        FROM
            classes c2
        LEFT JOIN ships s1 ON c2.class = s1.class
        LEFT JOIN outcomes o ON o.ship = s1.name
    WHERE
        c2.country = c.country
        AND lower(result) = 'sunk')
FROM
    classes c
GROUP BY
    country
HAVING
    3 >= (
        SELECT
            count(s.name)
        FROM classes c1
    LEFT JOIN ships s ON c1.class = s.class
    WHERE
        c1.country = c.country);

