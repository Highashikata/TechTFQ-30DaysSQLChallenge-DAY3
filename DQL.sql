-- Method 1:
SELECT (SELECT car
        FROM   footer
        WHERE  car IS NOT NULL
        ORDER  BY id DESC
        LIMIT  1) AS last_car,
       (SELECT length
        FROM   footer
        WHERE  length IS NOT NULL
        ORDER  BY id DESC
        LIMIT  1) AS last_length,
       (SELECT width
        FROM   footer
        WHERE  width IS NOT NULL
        ORDER  BY id DESC
        LIMIT  1) AS last_width,
       (SELECT height
        FROM   footer
        WHERE  height IS NOT NULL
        ORDER  BY id DESC
        LIMIT  1) AS last_height; 
		

-- Method2 : using a CROSS JOIN : whenever you have tables that don't have nothing in commun between them, use the CROSS JOIN
SELECT *
FROM   (SELECT car
        FROM   footer
        WHERE  car IS NOT NULL
        ORDER  BY id DESC
        LIMIT  1) AS last_car
       CROSS JOIN (SELECT length
                   FROM   footer
                   WHERE  length IS NOT NULL
                   ORDER  BY id DESC
                   LIMIT  1) AS last_length
       CROSS JOIN(SELECT width
                  FROM   footer
                  WHERE  width IS NOT NULL
                  ORDER  BY id DESC
                  LIMIT  1) AS last_width
       CROSS JOIN (SELECT height
                   FROM   footer
                   WHERE  height IS NOT NULL
                   ORDER  BY id DESC
                   LIMIT  1) AS last_height;


-- Method 3 :

-- SELECT
-- *,
--     CASE 
--         WHEN length IS NULL THEN 'Null length'
--         ELSE 'Non Null Length'
--     END AS length_null_partition, 
-- 	CASE 
--         WHEN car IS NULL THEN 'Null car'
--         ELSE 'Non Null car'
--     END AS car_null_partition,
-- 	CASE 
--         WHEN width IS NULL THEN 'Null width'
--         ELSE 'Non Null width'
--     END AS width_null_partition,
-- 	CASE 
--         WHEN height IS NULL THEN 'Null height'
--         ELSE 'Non Null height'
--     END AS height_null_partition
-- 	, X.rn_length
-- 	, X.rn_height
-- 	, X.rn_width
-- 	, X.rn_car
-- FROM (
--     SELECT
--         *,
--         ROW_NUMBER() OVER (PARTITION BY CASE WHEN length IS NULL THEN 1 ELSE 2 END ORDER BY id) AS rn_length,
-- 		ROW_NUMBER() OVER (PARTITION BY CASE WHEN height IS NULL THEN 1 ELSE 2 END ORDER BY id) AS rn_height,
-- 		ROW_NUMBER() OVER (PARTITION BY CASE WHEN width IS NULL THEN 1 ELSE 2 END ORDER BY id) AS rn_width,
-- 		ROW_NUMBER() OVER (PARTITION BY CASE WHEN car IS NULL THEN 1 ELSE 2 END ORDER BY id) AS rn_car
--     FROM footer
-- ) AS X
-- WHERE X.rn_length = 1 and X.rn_height=1 and X.rn_width=1 and X.rn_car=1 ;

