# TechTFQ-30DaysSQLChallenge-DAY3
going through the challenge of SQL interview questions featured in the TechTFQ channel



In this repository we will be going through the SQL interview questions featured in the following YouTube video [SQL Interview Questions](https://www.youtube.com/watch?v=w67I_aPKygE&list=PLavw5C92dz9Hxz0YhttDniNgKejQlPoAn&index=3).

# **Day 3: The problem statement: Fetch footer values**

Write a SQL query to return the footer values from input table, meaning all the last non null values from each field as shown in expected output

![image](https://github.com/Highashikata/TechTFQ-30DaysSQLChallenge-DAY3/assets/96960411/47130d6b-c816-47fe-8e1d-95dfbb3187ca)

**DDL**
```
DROP TABLE IF EXISTS FOOTER;
CREATE TABLE FOOTER 
(
	id 			INT PRIMARY KEY,
	car 		VARCHAR(20), 
	length 		INT, 
	width 		INT, 
	height 		INT
);

```

**DML**
```
INSERT INTO FOOTER VALUES (1, 'Hyundai Tucson', 15, 6, NULL);
INSERT INTO FOOTER VALUES (2, NULL, NULL, NULL, 20);
INSERT INTO FOOTER VALUES (3, NULL, 12, 8, 15);
INSERT INTO FOOTER VALUES (4, 'Toyota Rav4', NULL, 15, NULL);
INSERT INTO FOOTER VALUES (5, 'Kia Sportage', NULL, NULL, 18); 

SELECT * FROM FOOTER;
```
**DQL**

```
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


```
