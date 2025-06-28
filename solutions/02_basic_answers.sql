-- Фильтрация данных WHERE
USE world;

-- 21. Выберите все страны, где население больше 100 миллионов.
SELECT * FROM country WHERE Population > 100000000;
-- 22. Найдите города, в которых проживает менее 50 000 человек.
SELECT * FROM city WHERE Population < 50000;
-- 23. Найди все строки в таблице countrylanguage, где язык — английский (English) и он является официальным (IsOfficial = 'T').
SELECT * FROM countrylanguage WHERE Language = 'English' AND IsOfficial = 'T';
-- 24. Найдите страны, чей валовой национальный продукт (GNP) находится в диапазоне от 500 000 до 1 000 000 (в миллионах).
SELECT * FROM country WHERE GNP BETWEEN 500000 AND 1000000;
-- 25. Отобразите все города, названия которых начинаются с буквы "S".
SELECT Name FROM city WHERE Name LIKE "S%";
-- 26. Выберите страны, чьи названия содержат слово "United".
SELECT * FROM country WHERE Name LIKE "%United%";
-- 27. Найдите страны, у которых площадь больше 1 000 000 км² и население превышает 50 миллионов.
SELECT * FROM country WHERE SurfaceArea > 1000000 AND Population >= 50000000;
-- 28. Выберите страны, где продолжительность жизни (LifeExpectancy) меньше 50 лет.
SELECT * FROM country WHERE LifeExpectancy < 50;
-- 29. Найдите все города, которые находятся в Австралии (AUS) или Новой Зеландии (NZL).
SELECT * FROM city WHERE CountryCode IN ('AUS', 'NZL');
-- 30. Выберите страны, у которых название заканчивается на букву "a".
SELECT * FROM country WHERE Name LIKE "%a";
-- 31. Найдите города, население которых находится в диапазоне от 500 000 до 1 000 000 человек.
SELECT * FROM city WHERE Population BETWEEN 500000 AND 1000000;
-- 32. Найди все строки в таблице countrylanguage, где язык — НЕ французский (French).
SELECT * 
FROM countrylanguage
WHERE Language != 'French';
-- 33. Найдите все страны, у которых площадь меньше 50 000 км² или население меньше 1 миллиона.
SELECT * FROM country WHERE SurfaceArea < 50000 OR Population < 1000000;
-- 34. Выберите страны, у которых ВВП (GNPOld) не указан (NULL).
SELECT * FROM country WHERE GNPOld IS NULL;
-- 35. Найдите города, название которых содержит "New".
SELECT * FROM city WHERE Name LIKE '%New%';
-- 36. Отобразите страны, где регион начинается с буквы "M".
SELECT * FROM country WHERE Region LIKE 'M%';
-- 37. Выберите страны, где плотность населения больше 100 человек на км².
SELECT * FROM country WHERE (Population / SurfaceArea) > 100;
-- 38. Найдите страны, чей код начинается с "U", "E" или "G".
SELECT * FROM country 
WHERE Code LIKE 'U%' 
OR Code LIKE 'E%'
OR Code LIKE 'G%';
-- 39. Выбрать страны, где доля населения старше 65 лет (LifeExpectancy).
SELECT * FROM country WHERE LifeExpectancy > 65;
-- 40. Найдите страны, у которых название состоит из четерых слова.
SELECT * FROM country WHERE Name LIKE '____';