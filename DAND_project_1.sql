"""Local Data"""
SELECT
  year
FROM city_data
WHERE
  city = 'Seoul'
  AND country = 'South Korea'
  AND year IS NULL;


SELECT
  avg_temp
FROM city_data
WHERE
  city = 'Seoul'
  AND country = 'South Korea'
  AND avg_temp IS NULL;


"""Global Data"""
SELECT
  year
FROM global_data
WHERE
  year IS NULL;


SELECT
  avg_temp
FROM global_data
WHERE
  avg_temp IS NULL;


