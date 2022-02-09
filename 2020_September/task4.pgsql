-- Update tables so as to have reasonable outputs.
UPDATE
    movie
SET
    incolor = 'N'
WHERE
    title ILIKE '%back%';

INSERT INTO studio
    VALUES ('Alexandra Studios', 'James Boucher 5');

INSERT INTO movie
    VALUES ('TestTitle', 1988, 200, 'Y', 'Fox', 199);

-- task 1: should only be 'Fox'
SELECT
    s.name,
    s.address
FROM
    movie m
    JOIN studio s ON m.studioname = s.name
GROUP BY
    s.name,
    s.address
HAVING
    COUNT(DISTINCT m.incolor) = 2
ORDER BY
    s.address;

-- task 2: Fox should not be included
SELECT
    s.name,
    s.address,
    COALESCE(round(avg(m.length), 2), 0) AS avg_len
FROM
    movie m
    RIGHT JOIN studio s ON m.studioname = s.name
GROUP BY
    s.name,
    s.address
HAVING
    count(m.studioname) < 4;

