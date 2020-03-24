/* Local Data */
SELECT
  *
FROM city_data
WHERE
  city = 'Seoul'
  AND country = 'South Korea'
ORDER BY year;


SELECT
  *
FROM city_data
WHERE
  city = 'Seoul'
  AND country = 'South Korea'
  AND avg_temp IS NULL
  AND year IS NULL;


/* Global Data */
SELECT *
FROM global_data
ORDER BY year;


SELECT
  *
FROM global_data
WHERE
  year IS NULL
  AND avg_temp IS NULL;


/* Both Extraction At One Time */
SELECT
  city_data.year,
  city_data.avg_temp AS seoul_avg_temp,
  global_data.avg_temp AS global_avg_temp
FROM city_data
LEFT JOIN global_data ON city_data.year = global_data.year
WHERE
  city_data.city = 'Seoul'
  AND city_data.country = 'South Korea'
ORDER BY
  year;


/* Multiple Cities Comparison */
SELECT
  city_data.year,
  city_list.city,
  city_list.country,
  city_data.avg_temp AS seoul_avg_temp,
  global_data.avg_temp AS global_avg_temp
FROM city_data
LEFT JOIN global_data ON city_data.year = global_data.year
LEFT JOIN city_list ON city_data.city = city_list.city
WHERE
  city_data.city in ('Seoul', 'New York', 'Amsterdam')
  AND city_data.country in ('South Korea', 'United States', 'Netherlands')
  AND city_data.avg_temp IS NOT NULL
  AND global_data.avg_temp IS NOT NULL
ORDER BY
  year;

