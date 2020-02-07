/* Subqueries inside WHERE and SELECT clauses (1) */
SELECT *
FROM populations
WHERE life_expectancy > 1.15 *
    (SELECT AVG(life_expectancy)
    FROM populations
    WHERE year = 2015)
    AND year = 2015;


/* Subqueries inside WHERE and SELECT clauses (2) */
SELECT city.name, city.country_code, city.urbanarea_pop
-- from the cities table
FROM cities AS city
-- with city name in the field of capital cities
WHERE city.name IN
  (SELECT capital
   FROM countries)
ORDER BY urbanarea_pop DESC;