/* UNION (1) */
-- Select fields from 2010 table
SELECT
  * -- From 2010 table
FROM economies2010 -- Set theory clause
UNION
  -- Select fields from 2015 table
SELECT
  * -- From 2015 table
FROM economies2015 -- Order by code and year
ORDER BY code, year;


/* UNION (2) */
-- Select field
SELECT
  country_code -- From cities
FROM cities -- Set theory clause
UNION
  -- Select field
SELECT
  code -- From currencies
FROM currencies -- Order by country_code
ORDER BY
  country_code;


/* UNION ALL */
-- Select fields
SELECT
  code,
  year -- From economies
FROM economies -- Set theory clause
UNION ALL
  -- Select fields
SELECT
  country_code,
  year -- From populations
FROM populations -- Order by code, year
ORDER BY
  code,
  year;


/* INTERSECT (1) */
-- Select fields
SELECT
  code,
  year -- From economies
FROM economies -- Set theory clause
INTERSECT
  -- Select fields
SELECT
  country_code,
  year -- From populations
FROM populations -- Order by code and year
ORDER BY
  code,
  year;


 /* INTERSECT (2) */
 -- Select fields
SELECT
  name -- From countries
FROM countries -- Set theory clause
INTERSECT
  -- Select fields
SELECT
  name -- From cities
FROM cities;


/* EXCEPT (1) */
-- Select field
SELECT
  name -- From cities
FROM cities -- Set theory clause
EXCEPT
  -- Select field
SELECT
  capital -- From countries
FROM countries -- Order by result
ORDER BY
  name;


/* EXCEPT (2) */
-- Select field
SELECT
  capital -- From countries
FROM countries -- Set theory clause
EXCEPT
  -- Select field
SELECT
  name -- From cities
FROM cities -- Order by ascending capital
ORDER BY
  capital;



/* Semi-join *
-- Select distinct fields
SELECT
  DISTINCT name -- From languages
FROM languages -- Where in statement
WHERE
  code IN -- Subquery
  (
    SELECT
      code
    FROM countries
    WHERE
      region = 'Middle East'
  ) -- Order by name
ORDER BY
  name;




