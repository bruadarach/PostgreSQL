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


/* Semi-join */
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


/* ANTI-JOIN */
-- 3. Select fields
SELECT
  code,
  name -- 4. From Countries
FROM countries -- 5. Where continent is Oceania
WHERE
  continent = 'Oceania' -- 1. And code not in
  AND code NOT IN -- 2. Subquery
  (
    SELECT
      code
    FROM currencies
  );


/* Challenge Quesiton */
-- select the city name
SELECT
  name -- alias the table where city name resides
FROM cities AS c1 -- choose only records matching the result of multiple set theory clauses
WHERE
  country_code IN (
    -- select appropriate field from economies AS e
    SELECT
      e.code
    FROM economies AS e -- get all additional (unique) values of the field from currencies AS c2
    UNION
    SELECT
      c2.code
    FROM currencies AS c2 -- exclude those appearing in populations AS p
    EXCEPT
    SELECT
      p.country_code
    FROM populations AS p
  );

   