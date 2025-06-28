-- Сортировка (ORDER BY)
USE world;

-- 41. Выведите все страны (Name) из таблицы country, отсортированные в алфавитном порядке.
SELECT Name FROM country ORDER BY Name;
-- 42. Отобразите все города (Name), отсортированные по убыванию населения (Population).
SELECT Name, Population FROM city 
ORDER BY Population DESC;
-- 43. Найдите 10 стран с самой большой территорией (SurfaceArea), отсортированных по 
SELECT Name, SurfaceArea FROM country
ORDER BY SurfaceArea DESC LIMIT 10;
-- 44. Выведите список всех континентов (Continent), отсортированных по названию.
SELECT DISTINCT(Continent) FROM country ORDER BY Continent;
-- 45. Покажите 5 стран с самой высокой продолжительностью жизни (LifeExpectancy), отсортированных по убыванию.
SELECT * FROM country 
ORDER BY LifeExpectancy DESC
LIMIT 5;
-- 46. Выведите страны, у которых население больше 50 млн, отсортированные по убыванию (Population).
SELECT * FROM country 
WHERE Population > 50000000
ORDER BY Population DESC;
-- 47. Найдите города в США (CountryCode = 'USA'), отсортированные по 
SELECT * FROM city WHERE CountryCode = 'USA' ORDER BY Name;
-- 48. Выведите все страны Европы (Continent = 'Europe'), отсортированные по году независимости 
SELECT * FROM country WHERE Continent = 'Europe' ORDER BY IndepYear;
-- 49. Найдите страны, у которых ВВП (GNP) больше 1 000 000, отсортированные по убыванию.
SELECT * FROM country WHERE GNP > 1000000 ORDER BY GNP DESC;
-- 50. Покажите все страны, у которых население больше 1 млн и они находятся в Азии, отсортированные по убыванию.
SELECT * FROM country 
WHERE Population > 1000000 
AND Continent = "Asia"
ORDER BY Population DESC;
-- 51. Найдите все города, чьи названия начинаются с буквы S, отсортированные по названию.
SELECT Name FROM city 
WHERE Name LIKE "S%" ORDER BY Name;
-- 52. Выведите страны, название которых заканчивается на land, отсортированные по населению.
SELECT Name FROM country 
WHERE Name LIKE "%land%" 
ORDER BY Population; 
-- 53. Найдите города, у которых название содержит New, отсортированные по убыванию населения.
SELECT Name, Population FROM city
WHERE Name LIKE "%New%"
ORDER BY Population DESC; 
-- 54. Выведите страны, название которых содержит ровно 5 букв, отсортированные по площади (SurfaceArea).
SELECT Name, SurfaceArea FROM country
WHERE Name LIKE "_____"
ORDER BY SurfaceArea;
-- 55. Найдите все города, чье название состоит из одного слова (без пробелов), отсортированные по убыванию населения.
SELECT Name, Population FROM city
WHERE Name NOT LIKE "% %"
ORDER BY Population DESC;
-- 56. Выведите страны, у которых форма правления (GovernmentForm) — «Республика», «Королевство» или «Федерация», отсортированные по названию страны.
SELECT DISTINCT(GovernmentForm) FROM country;
SELECT Name, GovernmentForm FROM country
WHERE GovernmentForm IN ('Republic', 'Kingdom', 'Federation')
ORDER BY Name;
-- 57. Найдите страны, у которых плотность населения (Population / SurfaceArea) больше 100 чел/км², отсортированные по убыванию плотности.
SELECT Name, (Population / SurfaceArea) AS PopulationDensity
FROM country
WHERE (Population / SurfaceArea) > 100
ORDER BY PopulationDensity DESC;
-- 58. Покажите все страны с населением от 8 до 15 миллионов, отсортированные по убыванию населения.
SELECT Name, Population FROM country 
WHERE Population BETWEEN 8000000 AND 15000000
ORDER BY Population DESC;
-- 59. Найдите 10 самых густонаселенных стран, отсортированных по убыванию населения.
SELECT Name, Population FROM country
ORDER BY Population DESC LIMIT 10;
-- 60. Выведите 5 стран, где продолжительность жизни (LifeExpectancy) находится между 60 и 70 годами, отсортированные по названию.
SELECT Name, LifeExpectancy FROM country 
WHERE LifeExpectancy BETWEEN 60 AND 70
ORDER BY Name 
LIMIT 5;
