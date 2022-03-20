-- 1 Б)
SELECT
    c.country,
    COUNT(o.result)
FROM
    classes c
    JOIN ships s ON c.class = s.class
    JOIN outcomes o ON s.name = o.ship
WHERE
    result = 'sunk'
GROUP BY
    c.country;

-- 2. B)
SELECT DISTINCT
    battle
FROM
    outcomes o,
    ships s,
    classes c
WHERE
    o.ship = s.name
    AND s.class = c.class
GROUP BY
    battle
HAVING
    COUNT(DISTINCT country) > (
        SELECT
            COUNT(country)
        FROM
            outcomes o,
            classes c,
            ships s
        WHERE
            ship = name
            AND s.class = c.class
            AND battle = 'Coral Sea');

