-- 1.
-- insert values so as to have reasonable output
INSERT INTO classes (class, type, country)
    VALUES ('Name that starts with N', 'bb', 'Bulgaria');

-- execute query
SELECT
    c.class,
    min(b.date),
    max(b.date),
    count(DISTINCT b.name)
FROM
    classes c
    LEFT JOIN ships s ON c.class = s.class
    LEFT JOIN outcomes o ON s.name = o.ship
    LEFT JOIN battles b ON o.battle = b.name
WHERE
    lower(c.class)
    LIKE 'n%'
GROUP BY
    c.class;
