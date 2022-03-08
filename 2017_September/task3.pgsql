-- 1.
SELECT
    name,
    country
FROM
    ships
    LEFT JOIN outcomes ON name = ship
    JOIN classes ON ships.class = classes.class
WHERE
    result <> 'sunk'
    OR result IS NULL;
