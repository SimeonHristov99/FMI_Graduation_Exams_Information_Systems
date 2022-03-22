-- 1.
SELECT
    t.name,
    title
FROM
    movie m
    JOIN (
        SELECT
            name,
            certnum
        FROM
            movieexec
        WHERE
            certnum IN (
                SELECT
                    producercert
                FROM
                    movie
                WHERE
                    title = 'Pretty Woman')) t ON m.producercert = t.certnum;

