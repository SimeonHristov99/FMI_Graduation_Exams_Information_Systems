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

-- 2.
SELECT
    name,
    displacement,
    numguns
FROM
    classes c
    JOIN ships s ON s.class = c.class
WHERE
    displacement = (
        SELECT
            min(displacement)
        FROM
            classes)
    AND numguns = (
        SELECT
            max(numguns)
        FROM
            classes c1
        WHERE
            c1.displacement = displacement);

-- 3.
SELECT
    battle
FROM
    outcomes o1
WHERE
    NOT EXISTS (
        SELECT
            *
        FROM
            outcomes o2
        WHERE
            o1.ship <> o2.ship);

-- 4. б
-- This is the one I came up with
-- without looking at the proposed solutions.
SELECT
    s.class,
    count(s.name)
FROM
    ships s
    JOIN outcomes o ON s.name = o.ship
WHERE
    result = 'sunk'
    AND 5 < (
        SELECT
            count(name)
        FROM ships
        WHERE
            class = s.class)
GROUP BY
    s.class;

SELECT
    class,
    COUNT(DISTINCT name)
FROM
    ships s
    JOIN outcomes o ON s.name = o.ship
WHERE
    result = 'sunk'
    AND class IN (
        SELECT
            c.class
        FROM
            classes c
            JOIN ships s ON c.class = s.class
        GROUP BY
            c.class
        HAVING
            COUNT(name) > 5)
GROUP BY
    class;

