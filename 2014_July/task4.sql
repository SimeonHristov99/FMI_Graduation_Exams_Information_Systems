-- 1.
SELECT DISTINCT
    maker
FROM
    product p
    JOIN pc ON pc.model = p.model
    JOIN laptop l ON l.model = p.model;

-- For testing.
-- insert into pc
-- values (100, 1298, 0, 0, 0, 0, 0);


-- 2.
SELECT
    l.code,
    l.model,
    l.screen
FROM
    laptop l
    JOIN product p ON l.model = p.model
GROUP BY
    maker,
    l.code,
    l.model,
    l.screen
HAVING
    3 >= (
        SELECT
            count(DISTINCT pr.model)
        FROM printer pr
    RIGHT JOIN product prod ON pr.model = prod.model
    WHERE
        pr.model = l.model);

