-- 1 A)
SELECT
    c.country,
    COUNT(o.result)
FROM
    classes c
    LEFT JOIN ships s ON c.class = s.class
    LEFT JOIN outcomes o ON s.name = o.ship
WHERE
    result = 'sunk'
    OR result IS NOT NULL
GROUP BY
    c.country;

-- 2. A)
SELECT DISTINCT
    battle
FROM
    outcomes o1
WHERE (
    SELECT
        COUNT(DISTINCT country)
    FROM
        outcomes o,
        ships s,
        classes c
    WHERE
        o.ship = s.name
        AND s.class = c.class
        AND battle = o1.battle) > (
    SELECT
        count(DISTINCT country)
    FROM
        outcomes o,
        ships s,
        classes c
    WHERE
        o.ship = s.name
        AND s.class = c.class
        AND battle = 'Coral Sea')
