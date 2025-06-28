-- Запрос данных из нескольких таблиц — JOIN
USE world;

-- 141. Выведите названия стран и их столиц (городов) — используя country.Code = city.ID.
SELECT country.name AS CountryName,
	city.name AS CityName
FROM country JOIN city
ON country.Code = city.CountryCode;
-- 142. Покажите города с их странами и населением, отсортированные по убыванию населения.
SELECT country.name AS CountryName,
	city.name AS CityName,
    city.population AS CityPopulation
FROM country JOIN city
ON country.Code = city.CountryCode
ORDER BY CityPopulation DESC;
-- 143. Найдите все города, расположенные в странах Европы.
SELECT country.continent AS Continent,
	city.name AS City
FROM country JOIN city
ON country.Code = city.CountryCode
WHERE Continent = 'Europe';
-- 144. Определите количество городов в каждой стране.
SELECT country.Name AS Country,
	COUNT(city.ID) AS CityCount
FROM country JOIN city
ON country.Code = city.CountryCode
GROUP BY country.Name;
-- 145. Выведите страны и их столицу, где население столицы превышает 1 миллион.
SELECT country.Name AS Country,
	city.Name AS Capital,
    city.Population 
FROM country JOIN city
ON country.Capital = city.ID
WHERE city.Population > 1000000;
-- 146. Покажите название страны и официальный язык этой страны.
SELECT country.Name AS Country,
	countrylanguage.Language AS Language
FROM country JOIN countrylanguage
ON country.Code = countrylanguage.CountryCode
WHERE countrylanguage.IsOfficial = 'T';
-- 147. Выведите все языки, говорящиеся в Азии (по континенту страны).
SELECT country.Region AS Region,
	countrylanguage.Language AS Language
FROM country JOIN countrylanguage
ON country.Code = countrylanguage.CountryCode
WHERE country.Region LIKE '%Asia%';
-- 148. Найдите страны, где процент говорящих на официальном языке менее 50%.
SELECT country.Name AS Country,
       countrylanguage.Language,
       countrylanguage.Percentage
FROM country
JOIN countrylanguage ON country.Code = countrylanguage.CountryCode
WHERE countrylanguage.IsOfficial = 'T'
  AND countrylanguage.Percentage < 50;
-- 149. Для каждой страны выведите количество языков.
SELECT country.Name AS Country,
	COUNT(countrylanguage.Language) AS LanguageCount
FROM country JOIN countrylanguage
ON country.Code = countrylanguage.CountryCode
GROUP BY country.name;
-- 150. Покажите страну и язык, где процент говорящих на этом языке максимален.
SELECT c.Name AS Country,
       cl.Language,
       cl.Percentage
FROM country c
JOIN countrylanguage cl ON c.Code = cl.CountryCode
WHERE cl.Percentage = (
    SELECT MAX(cl2.Percentage)
    FROM countrylanguage cl2
    WHERE cl2.CountryCode = c.Code
);
