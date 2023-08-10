/* EJERCICIO 1 */

SELECT countries.name, languages.language, languages.percentage FROM countries
JOIN world.languages ON countries.id = languages.country_id 
WHERE world.languages.language = "Slovene"
ORDER BY percentage DESC;

/* EJERCICIO 2 */

SELECT countries.name, COUNT(cities.id) AS cities
FROM countries
JOIN world.cities ON countries.id = cities.country_id
GROUP BY countries.name
ORDER BY cities DESC;

/* EJERCICIO 3 */

SELECT cities.name, cities.population, cities.country_id
FROM cities 
WHERE cities.country_CODE = "MEX" AND cities.population  > 500000
ORDER BY cities.population DESC;

/* EJERCICIO 4 */

SELECT countries.name, languages.language, languages.percentage
FROM countries 
JOIN languages ON countries.id = languages.country_id 
WHERE languages.percentage > 89
ORDER BY languages.percentage DESC;

/* EJERCICIO 5 */

SELECT countries.name, countries.surface_area, countries.population
FROM world.countries
WHERE countries.surface_area < 501 AND countries.population > 100000;

/* EJERCICIO 6 */

SELECT countries.name, countries.government_form, countries.capital, countries.life_expectancy
FROM world.countries
WHERE countries.government_form = "Constitutional Monarchy" 
AND countries.capital > 200 
AND countries.life_expectancy > 75;

/* EJERCICIO 7 */

SELECT countries.name as country_name, cities.name as city_name, cities.district, cities.population
FROM world.countries JOIN world.cities
WHERE countries.name = "Argentina" 
AND cities.district = "Buenos Aires" 
AND cities.population > 500000;

/* EJERCICIO 8 */

SELECT countries.region, COUNT(countries.region) AS countries
FROM countries
GROUP BY countries.region
ORDER BY COUNT(countries.region) DESC;