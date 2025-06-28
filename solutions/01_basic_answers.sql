-- Основные операторы SQL
USE world;

-- 1. Выведите все данные из таблицы country.
SELECT * FROM country;
-- 2. Выведите названия всех стран (Name).
SELECT Name FROM country;
-- 3. Выведите названия стран и их столицы (Capital).
SELECT Name, Capital FROM country;
-- 4. Выведите страны, расположенные на континенте "Europe".
SELECT * FROM country WHERE Continent = 'Europe';
-- 5. Выведите страны, в которых население превышает 50 миллионов.
SELECT * FROM country WHERE Population >= 50000000;
-- 6. Выведите все континенты, представленные в таблице, без повторений.
SELECT DISTINCT(Continent) FROM country;
-- 7. Выведите все формы правления (GovernmentForm), встречающиеся в странах.
SELECT DISTINCT(GovernmentForm) FROM country;
-- 8. Выведите страны, в которых продолжительность жизни (LifeExpectancy) выше 80 лет.
SELECT * FROM country WHERE LifeExpectancy > 80;
-- 9. Выведите страны, которые стали независимыми после 1990 года.
SELECT * FROM country WHERE IndepYear > 1990;
-- 10. Найдите страны, где официальным главой является "Elisabeth II".
SELECT * FROM country WHERE HeadOfState = 'Elisabeth II';
-- 11. Выведите 10 стран с наибольшим населением.
SELECT * FROM country 
ORDER BY Population DESC 
LIMIT 10;
-- 12. Выведите 5 стран с наименьшей продолжительностью жизни.
SELECT * FROM country
WHERE LifeExpectancy IS NOT NULL
ORDER BY LifeExpectancy
LIMIT 5;
-- 13. Отсортируйте страны по названию в алфавитном порядке и выведите первые 5 записей.
SELECT Name FROM country 
ORDER BY Name 
LIMIT 5;
-- 14. Выведите 3 страны с самым высоким ВВП (GNP).
SELECT * FROM country ORDER BY GNP DESC LIMIT 3;
-- 15. Выведите первые 7 стран, у которых наибольшее население.
SELECT * FROM country ORDER BY Population DESC LIMIT 7;
-- 16. Выведите страны и их ВВП, но назовите столбец GNP как GDP.
SELECT Name, GNP AS GDP FROM country;
-- 17. Выведите страны и их среднюю продолжительность жизни, но назовите столбец LifeExpectancy как Avg_Life.
SELECT Name, LifeExpectancy AS Avg_Life FROM country;
-- 18. Найдите все страны, названия которых начинаются с буквы "A".
SELECT * FROM country WHERE Name LIKE "A%";
-- 19. Найдите страны, в названии которых содержится слово "stan".
SELECT * FROM country WHERE Name LIKE "%stan%";
-- 20. Выведите страны, у которых нет информации о ВВП (GNP).
SELECT * FROM country 
WHERE GNP IS NULL
OR GNPOld IS NULL;