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

-- Создание базы и таблиц
	
-- 61. Создайте базу данных CinemaDB.
DROP DATABASE IF EXISTS CinemaDB;
CREATE DATABASE CinemaDB;
USE CinemaDB;
-- 62. Создайте таблицу Cinemas (кинотеатры) с колонками: id, name, location.
CREATE TABLE Cinemas(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    location VARCHAR(100)
);
DESCRIBE Cinemas;
-- 63. Создайте таблицу Categories (категории) с колонками: id, name.
CREATE TABLE Categories(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50)
);
DESCRIBE Categories;
-- 64. Создайте таблицу Movies (фильмы) с колонками: id, title, release_year, category_id.
CREATE TABLE Movies(
	id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200),
    release_year INT,
    category_id INT
);
DESCRIBE Movies;
-- 65. Создайте таблицу Screenings (сеансы) с колонками: id, cinema_id, movie_id, showtime.
CREATE TABLE Screenings(
	id INT AUTO_INCREMENT PRIMARY KEY,
    cinema_id INT,
    movie_id INT,
    showtime TIMESTAMP
);
DESCRIBE Screenings;
-- 66. Добавьте в таблице Movies связь category_id → Categories(id).
ALTER TABLE Movies 
ADD CONSTRAINT fk_movies_categories 
FOREIGN KEY (category_id)
REFERENCES Categories(id);

DESCRIBE Movies;
-- 67. Добавьте в таблице Screenings связи cinema_id → Cinemas(id) и movie_id → Movies(id).
ALTER TABLE Screenings
ADD CONSTRAINT fk_screenings_cinemas
FOREIGN KEY (cinema_id)
REFERENCES Cinemas(id);

ALTER TABLE Screenings
ADD CONSTRAINT fk_screenings_movies
FOREIGN KEY (movie_id)
REFERENCES Movies(id);

DESC Screenings;
-- 68. В таблице Cinemas запретите NULL для name и location.
ALTER TABLE Cinemas MODIFY COLUMN name VARCHAR(200) NOT NULL;
ALTER TABLE Cinemas MODIFY COLUMN location VARCHAR(200) NOT NULL;
DESC Cinemas;
-- 69. В таблице Movies сделайте release_year обязательным (NOT NULL).
ALTER TABLE Movies MODIFY COLUMN release_year INT NOT NULL;
DESC Movies;
-- 70. Добавьте в Movies колонку duration (длительность в минутах).
ALTER TABLE Movies ADD COLUMN duration INT;
DESC Movies;
-- 71. Измените duration, чтобы оно по умолчанию было 90.
ALTER TABLE Movies MODIFY COLUMN duration INT DEFAULT 90;
DESC Movies;
-- 72. Удалите колонку location из Cinemas.
ALTER TABLE Cinemas DROP COLUMN location;
DESC Cinemas;
-- 73. Переименуйте колонку title в movie_title в Movies.
ALTER TABLE Movies RENAME COLUMN title TO movie_title;
DESC Movies;
-- 74. Посмотрите стурктура табицы Screenings.
DESC Screenings;
-- 75. Удалите таблицу Screenings.
DROP TABLE IF EXISTS Screenings;
-- 76. Очистите все данные в Movies, не удаляя структуру.
DELETE FROM Movies;
-- 77. Посмотрите стурктура табицы Cinemas;
DESC Cinemas;
-- 78. Посмотрите стурктура табицы Categories;
DESC Categories;
-- 79. Посмотрите стурктура табицы Movies;
DESC Movies;
-- 80. Посмотрите все таблицы из базы данных CinemaDB.
SHOW TABLES FROM CinemaDB;

-- INSERT (Вставка данных)
USE world;

-- 81. Добавить новый город "Almaty" в таблицу city (код страны "KAZ", население 2 млн, район "Almaty Region").
INSERT INTO world.city(Name, CountryCode, District, Population)
VALUES("Almaty", "KAZ", "Almaty Region", 2000000);
-- 82. Добавить страну "Kazakhstan" в таблицу country (код "KZT", континент "Asia", площадь 2,7 млн км²).
UPDATE world.country  
SET Name = "Kazakhstan", Continent = "Asia", SurfaceArea = 2724900, Population = 19000000,  
    LocalName = "Қазақстан", GovernmentForm = "Republic"  
WHERE Code = "KAZ";
-- 83. Добавить 5 новых городов в таблицу city.
INSERT INTO world.city (Name, CountryCode, District, Population)  
VALUES  
    ("Astana", "KAZ", "Akmola", 1300000),  
    ("Shymkent", "KAZ", "South Kazakhstan", 1200000),  
    ("Karaganda", "KAZ", "Karaganda", 500000),  
    ("Aktobe", "KAZ", "Aktobe", 400000),  
    ("Pavlodar", "KAZ", "Pavlodar", 350000);
-- 84. Добавить 3 новых страны в таблицу country.
SELECT * FROM world.country WHERE Code IN ("UZB", "KGZ", "TJK");
DELETE FROM world.country WHERE Code IN ("UZB", "KGZ", "TJK");
INSERT INTO world.country (Code, Name, Continent, SurfaceArea, Population, LocalName, GovernmentForm)  
VALUES  
    ("UZB", "Uzbekistan", "Asia", 447400, 36000000, "O‘zbekiston", "Republic"),  
    ("KGZ", "Kyrgyzstan", "Asia", 199951, 7000000, "Кыргызстан", "Republic"),  
    ("TJK", "Tajikistan", "Asia", 141377, 10000000, "Тоҷикистон", "Republic");
-- 85. Добавить столицу "Astana" для Казахстана в таблицу city и указать её как столицу в country.
INSERT INTO world.city (Name, CountryCode, District, Population)  
VALUES ("Astana", "KAZ", "Akmola", 1300000);
SELECT ID FROM world.city WHERE Name = "Astana" AND CountryCode = "KAZ";
UPDATE world.country  
SET Capital = 4082  
WHERE Code = "KAZ";
-- 86. Изменить население города "Almaty" на 2.2 млн.
UPDATE world.city  
SET Population = 2200000  
WHERE Name = "Almaty" AND CountryCode = "KAZ";
-- 87. Изменить площадь Казахстана на 2.72 млн км².
UPDATE world.country  
SET SurfaceArea = 2720000  
WHERE Code = "KAZ";
-- 88. Увеличить население всех городов Казахстана на 10%.
UPDATE world.city  
SET Population = Population * 1.1  
WHERE CountryCode = "KAZ";
-- 89. Изменить форму правления в стране "Kazakhstan" на "Президентская республика".
UPDATE world.country  
SET GovernmentForm = "Президентская республика"  
WHERE Name = "Kazakhstan";
-- 90. Обновить среднюю продолжительность жизни для всех стран Азии, увеличив её на 2 года.
UPDATE world.country  
SET LifeExpectancy = LifeExpectancy + 2  
WHERE Continent = "Asia";
-- 91. Изменить имя главы государства Казахстана на "Kasym-Jomart Tokayev".
SET SQL_SAFE_UPDATES = 0;
UPDATE world.country  
SET HeadOfState = "Kasym-Jomart Tokayev"  
WHERE Name = "Kazakhstan";
-- 92. Обновить код страны "KAZ" на "KZ" (если возможно).
SET FOREIGN_KEY_CHECKS = 0;

UPDATE world.city  
SET CountryCode = "KZ"  
WHERE CountryCode = "KAZ";

UPDATE world.countrylanguage  
SET CountryCode = "KZ"  
WHERE CountryCode = "KAZ";

UPDATE world.country  
SET Code = "KZ"  
WHERE Code = "KAZ";

SET FOREIGN_KEY_CHECKS = 1;
-- 93. Изменить население всех городов, где оно менее 50 000, на 50 000.
UPDATE world.city  
SET Population = 50000  
WHERE Population < 50000;
-- 94. Обновить ВНП (GNP) всех стран Европы, увеличив его на 5%.
UPDATE world.country  
SET GNP = GNP * 1.05  
WHERE Continent = "Europe";
-- 95. Изменить регион Казахстана на "Central Asia".
UPDATE world.country  
SET Region = "Central Asia"  
WHERE Code = "KAZ";
-- 96. Удалить город "Almaty" из таблицы city.
DELETE FROM world.city  
WHERE Name = "Almaty";
-- 97. Удалить все города, где население менее 10 000.
DELETE FROM world.city  
WHERE Population < 10000;
-- 98. Удалить страну "Kazakhstan" из таблицы country.
SET FOREIGN_KEY_CHECKS = 0;

DELETE FROM world.country  
WHERE Name = "Kazakhstan";

SET FOREIGN_KEY_CHECKS = 1;
-- 99. Удалить все страны, которые не имеют столицы (Capital IS NULL).
DELETE FROM world.country  
WHERE Capital IS NULL;
-- 100. Удалить все города, где название содержит "New" (например, "New York").
DELETE FROM world.city  
WHERE Name LIKE "%New%";

-- Группировка данных
USE world;

-- 101. Выведите количество стран в каждом континенте.
SELECT Continent, COUNT(*) FROM country GROUP BY Continent;
-- 102. Выведите среднюю продолжительность жизни (LifeExpectancy) по каждому континенту.
SELECT Continent, AVG(LifeExpectancy) FROM country GROUP BY Continent;
-- 103. Посчитайте суммарное население (Population) в каждом регионе.
SELECT Region, SUM(Population) FROM country GROUP BY Region;
-- 104. Найдите максимальную площадь (SurfaceArea) страны в каждом континенте.
SELECT Continent, MAX(SurfaceArea) FROM country GROUP BY Continent;
-- 105. Найдите минимальное значение ВНП (GNP) по каждому региону.
SELECT Region, MIN(GNP) FROM country GROUP BY Region;
-- 106. Определите среднюю продолжительность жизни стран, где она известна (LifeExpectancy IS NOT NULL), сгруппированную по региону.
SELECT Region, AVG(LifeExpectancy) FROM country
WHERE LifeExpectancy IS NOT NULL
GROUP BY Region;
-- 107. Выведите количество стран с ненулевым ВНП в каждом континенте.
SELECT Continent, COUNT(*) FROM country
WHERE GNP > 0
GROUP BY Continent;
-- 108. Найдите общее количество стран с населением более 50 млн, сгруппированное по региону.
SELECT Region, COUNT(*) FROM country
WHERE Population > 50000000
GROUP BY Region;
-- 109. Определите количество стран в каждом типе государственного управления (GovernmentForm).
SELECT GovernmentForm, COUNT(*) FROM country GROUP BY GovernmentForm;
-- 110. Выведите максимальное значение GNP в каждом типе GovernmentForm.
SELECT GovernmentForm, MAX(GNP) FROM country GROUP BY GovernmentForm;
-- 111. Определите количество городов в каждом округе (District).
SELECT District, COUNT(*) FROM city GROUP BY District;
-- 112. Выведите среднюю численность населения городов в каждом округе.
SELECT District, AVG(Population) FROM city GROUP BY District;
-- 113. Найдите общее количество городов в каждом CountryCode.
SELECT CountryCode, COUNT(*) FROM city GROUP BY CountryCode;
-- 114. Найдите округи с наибольшим количеством городов.
SELECT District, COUNT(*) FROM city GROUP BY District ORDER BY COUNT(*) DESC;
-- 115. Посчитайте общее население всех городов в каждом CountryCode.
SELECT CountryCode, SUM(Population) FROM city GROUP BY CountryCode;
-- 116. Найдите среднее население городов, сгруппированное по District, где среднее больше 500 000.
SELECT District, AVG(Population) FROM city 
GROUP BY District 
HAVING AVG(Population) > 500000;
-- 117. Выведите количество разных языков для каждой страны (CountryCode).
SELECT CountryCode, COUNT(Language) FROM countrylanguage GROUP BY CountryCode;
-- 118. Найдите средний процент говорящих на каждом языке (Language).
SELECT Language, AVG(Percentage) AS SREDNY FROM countrylanguage GROUP BY Language;
-- 119. Посчитайте, в скольких странах язык используется как официальный (IsOfficial = 'T').
SELECT IsOfficial, COUNT(*) FROM countrylanguage 
WHERE IsOfficial = 'T' GROUP BY IsOfficial;
-- 120. Для каждого языка найдите максимальное значение Percentage (в какой стране этот язык наиболее распространён).
SELECT Language, MAX(Percentage) FROM countrylanguage GROUP BY Language;

-- Группировки и фильтрация в SQL: HAVING
USE world;

-- 121. Выведите континенты (Continent), в которых количество стран больше 30. (таблица: country)
SELECT Continent, COUNT(*) FROM country
GROUP BY Continent
HAVING COUNT(*) > 30;
-- 122. Найдите регионы (Region), в которых суммарное население (Population) больше 200 миллионов. (таблица: country)
SELECT Region, SUM(Population) FROM country
GROUP BY Region
HAVING SUM(Population) > 200000000;
-- 123. Покажите континенты (Continent), где средняя продолжительность жизни (LifeExpectancy) больше 75 лет. (таблица: country)
SELECT Continent, AVG(LifeExpectancy) FROM country
GROUP BY Continent
HAVING AVG(LifeExpectancy) > 75;
-- 124. Выведите формы правления (GovernmentForm), в которых больше 10 стран. (таблица: country)
SELECT GovernmentForm, COUNT(*) FROM country 
GROUP BY GovernmentForm
HAVING COUNT(*) > 10;
-- 125. Покажите регионы (Region), где средняя площадь стран (SurfaceArea) превышает 300000 км². (таблица: country)
SELECT Region, AVG(SurfaceArea) FROM country
GROUP BY Region HAVING AVG(SurfaceArea) > 300000;
-- 126. Найдите континенты (Continent), где среднее значение ВНП (GNP) больше 20000. (таблица: country)
SELECT Continent, AVG(GNP) FROM country
GROUP BY Continent HAVING AVG(GNP) > 20000;
-- 127. Выведите регионы (Region), в которых менее 5 стран с известной продолжительностью жизни (LifeExpectancy IS NOT NULL). (таблица: country)
SELECT Region, COUNT(*) AS cnt FROM country
WHERE LifeExpectancy IS NOT NULL
GROUP BY Region
HAVING COUNT(*) < 5;
-- 128. Покажите континенты (Continent), где суммарное население стран (Population) превышает 1 миллиард. (таблица: country)
SELECT Continent, SUM(Population) FROM country
GROUP BY Continent
HAVING SUM(Population) > 1000000000;
-- 129. Найдите формы правления (GovernmentForm), где максимальное значение ВНП (GNP) превышает 100000. (таблица: country)
SELECT GovernmentForm, MAX(GNP) FROM country
GROUP BY GovernmentForm
HAVING MAX(GNP) > 100000;
-- 130. Определите регионы (Region), где среднее население стран (Population) меньше 10 миллионов. (таблица: country)
SELECT Region, AVG(Population) FROM country
GROUP BY Region
HAVING AVG(Population) < 10000000;
-- 131. Покажите округа (District), в которых более 10 городов. (таблица: city)
SELECT District, COUNT(*) FROM city
GROUP BY District
HAVING COUNT(*) > 10;
-- 132. Найдите округа (District), где среднее население городов (Population) больше 500000. (таблица: city)
SELECT District, AVG(Population) FROM city
GROUP BY District
HAVING AVG(Population) > 500000;
-- 133. Выведите коды стран (CountryCode), где количество городов больше 50. (таблица: city)
SELECT CountryCode, COUNT(*) FROM city
GROUP BY CountryCode
HAVING COUNT(*) > 50;
-- 134. Покажите округа (District), где общее население всех городов (Population) больше 10 миллионов. (таблица: city)
SELECT District, SUM(Population) FROM city
GROUP BY District
HAVING SUM(Population) > 10000000;
-- 135. Найдите страны (CountryCode), где среднее население города (Population) менее 200000. (таблица: city)
SELECT CountryCode, AVG(Population) FROM city
GROUP BY CountryCode
HAVING AVG(Population) < 200000;
-- 136. Найдите языки (Language), которые используются более чем в 20 странах (CountryCode). (таблица: countrylanguage)
SELECT Language, COUNT(*) FROM countrylanguage
GROUP BY Language
HAVING COUNT(*) > 20;
-- 137. Покажите языки (Language), где средний процент говорящих (Percentage) превышает 60%. (таблица: countrylanguage)
SELECT Language, AVG(Percentage) FROM countrylanguage
GROUP BY Language HAVING AVG(Percentage) > 60;
-- 138. Выведите языки (Language), где максимальный процент неофициального использования (IsOfficial = 'F') превышает 90. (таблица: countrylanguage)
SELECT Language, MAX(IsOfficial) FROM countrylanguage
WHERE IsOfficial = 'F'
GROUP BY Language
HAVING MAX(IsOfficial) > 90;
-- 139. Найдите страны (CountryCode), в которых используется более 5 языков (Language). (таблица: countrylanguage)
SELECT CountryCode, COUNT(Language) FROM countrylanguage
GROUP BY CountryCode HAVING COUNT(Language) > 5;
-- 140. Покажите языки (Language), где минимальный процент говорящих (Percentage) превышает 10%. (таблица: countrylanguage)
SELECT Language, MAX(Percentage) FROM countrylanguage
GROUP BY Language HAVING MAX(Percentage) > 10;

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

-- Схема базы данных (связи JOIN)
USE phone_store;

-- 151. Выведите имена клиентов и их e-mail. (таблица: client)
SELECT name FROM client;
-- 152. Покажите имя клиента, его адрес и номер телефона. (INNER JOIN client + client_profile)
SELECT client.name,
	   client_profile.address,
       client_profile.phone
FROM client JOIN client_profile
ON client.id = client_profile.client_id;
-- 153. Найдите клиентов, у которых есть заказы. (INNER JOIN client + orders)
SELECT c.name 
FROM client AS c JOIN orders AS o
ON c.id = o.client_id;
-- 154. Выведите имя клиента и дату каждого его заказа. (INNER JOIN client + orders)
SELECT c.name,
	   o.order_date
FROM client c JOIN orders o 
ON c.id = o.client_id;
-- 155. Покажите имя клиента и список продуктов, которые он заказал. (JOIN client, orders, order_product, product)
SELECT 
	client.name,
    product.name AS product
FROM client JOIN orders
	ON client.id = orders.client_id
JOIN order_product
    ON orders.id = order_product.order_id
JOIN product 
	ON order_product.product_id = product.id;
-- 156. Выведите ID заказа и названия всех товаров, входящих в него. (JOIN order_product + product)
SELECT 
	o.order_id,
    p.name
FROM order_product o JOIN product p
ON o.product_id = p.id;
-- 157. Для каждого заказа покажите имя клиента и дату заказа. (JOIN orders + client)
SELECT 
	client.name,
    orders.order_date
FROM client JOIN orders
ON client.id = orders.client_id;
-- 158. Покажите все заказы, где есть товар с названием, содержащим "iPhone". (JOIN order_product + product)
SELECT 
	op.order_id,
    p.name
FROM order_product op JOIN product p
ON op.product_id = p.id
WHERE p.name LIKE '%iPhone%';
-- 159. Найдите клиентов, заказавших хотя бы один Samsung. (JOIN product, order_product, orders, client)
SELECT 
	c.name,
    p.name AS product
FROM client c JOIN orders o ON c.id = o.client_id
JOIN order_product op ON o.id = op.order_id
JOIN product p ON op.product_id = p.id
WHERE p.name LIKE '%Samsung%';
-- 160. Посчитайте общее количество товаров в каждом заказе. (JOIN order_product + агрегатная функция)
SELECT 
	order_id,
    COUNT(*)
FROM order_product GROUP BY order_id;
-- 161. Выведите список всех товаров с указанием их категории. (JOIN product + category)
SELECT 
	p.name AS product,
	c.name AS category
FROM product p JOIN category c
ON p.category_id = c.id;
-- 162. Покажите названия всех iPhone'ов и их цены. (JOIN product + category, фильтр category = 'iPhone')
SELECT 
	p.name AS product,
	c.name AS category
FROM product p JOIN category c
ON p.category_id = c.id
WHERE c.name = 'iPhone';
-- 163. Выведите список товаров, цена которых выше 1000, с указанием категории. (JOIN + фильтрация)
SELECT 
	p.name AS product,
    p.price,
	c.name AS category
FROM product p JOIN category c
ON p.category_id = c.id
WHERE p.price > 1000;
-- 164. Найдите среднюю цену товаров в каждой категории. (JOIN + агрегатная функция + GROUP BY)
SELECT 
	p.name AS product,
    c.name AS category,
    AVG(p.price)
FROM product p JOIN category c
ON p.category_id = c.id
GROUP BY p.name, c.name;
-- 165. Покажите продукты, которые никогда не заказывали. (JOIN-альтернатива: можно сделать через LEFT JOIN и IS NULL — продвинутый вариант)
SELECT 
	p.name 
FROM product p LEFT JOIN  order_product op
ON p.id = op.product_id
WHERE op.product_id IS NULL;
-- 166. Выведите клиентов и количество сделанных ими заказов. (JOIN client + orders, с COUNT(*))
SELECT 
	client.name AS client,
    COUNT(orders.client_id)
FROM client JOIN orders
ON client.id = orders.client_id
GROUP BY client.name;
-- 167. Покажите клиентов и общее количество товаров, которые они заказали. (JOIN нескольких таблиц + SUM(quantity))
SELECT
	client.name AS client,
    SUM(order_product.quantity)
FROM client JOIN orders 
	ON client.id = orders.client_id
JOIN order_product 
	ON order_product.order_id = orders.id
GROUP BY client.name;
-- 168. Выведите клиента и общую сумму всех его покупок. (JOIN product, order_product, orders, client + SUM(product.price * quantity))
SELECT
	c.name AS client,
    SUM(op.quantity * p.price)
FROM client c JOIN orders o
	ON c.id = o.client_id
JOIN order_product op
	ON op.order_id = o.id
JOIN product p 
	ON p.id = op.product_id
GROUP BY c.name;
-- 169. Найдите заказы, содержащие более 1 товара. (JOIN + HAVING COUNT(product_id) > 1)
SELECT
	order_id,
    COUNT(*)
FROM order_product
GROUP BY order_id
HAVING COUNT(*) > 1;
-- 170. Покажите имена клиентов, их телефоны и категории заказанных ими товаров. (JOIN: client + profile + orders + order_product + product + category)
SELECT 
	c.name,
    cp.phone,
    p.name AS product,
    c.name AS productCategory
FROM client c JOIN client_profile cp
	ON c.id  = cp.client_id
JOIN orders o
	ON c.id = o.client_id
JOIN order_product op
	ON op.order_id = o.id
JOIN product p 
	ON p.id = op.product_id;

-- Подзапросы (Subqueries)
USE phone_store;

-- 171. Найдите товары, цена которых выше средней. (подзапрос в SELECT)
SELECT * FROM product WHERE price > (SELECT AVG(price) FROM product);
-- 172. Выведите клиентов, не сделавших заказ. (подзапрос в WHERE NOT IN)
SELECT * FROM client WHERE id NOT IN (SELECT client_id FROM orders);
-- 173. Выведите категории с товарами дешевле 500. (подзапрос в WHERE EXISTS)
SELECT *
FROM category c
WHERE EXISTS (
    SELECT 1
    FROM product p
    WHERE p.category_id = c.id
      AND p.price < 500
);
-- 174. Выведите товары, заказанные клиентом с email 'example@email.com'. (подзапрос с фильтрацией)
SELECT *
FROM product
WHERE id IN (
    SELECT op.product_id
    FROM orders o
    JOIN client c ON c.id = o.client_id
    JOIN order_product op ON op.order_id = o.id
    WHERE c.email = 'example@email.com'
);
-- 175. Покажите клиентов с числом заказов больше, чем у клиента ID 5. (подзапрос в HAVING)
SELECT client_id, COUNT(*) AS order_count
FROM orders
GROUP BY client_id
HAVING COUNT(*) > (
    SELECT COUNT(*)
    FROM orders
    WHERE client_id = 5
);

-- Транзакции
USE phone_store;
SET SQL_SAFE_UPDATES = 0;


-- 176. Начни транзакцию, измени цену всех товаров категории 1 (iPhone) — увеличь на 10%, затем COMMIT.
START TRANSACTION;
UPDATE product SET price = ROUND(price * 1.1, 2)
WHERE category_id = (
	SELECT c.id FROM category c 
    WHERE c.name = 'iPhone'
);
COMMIT;

-- 177. Начни транзакцию, измени цену всех товаров Samsung — уменьши на 5%, затем ROLLBACK.START TRANSACTION;
START TRANSACTION;
UPDATE product SET price = ROUND(price * 0.95, 2)
WHERE category_id = (
	SELECT c.id FROM category c 
    WHERE c.name = 'Samsung'
);
COMMIT;

-- 178. Удали из таблицы product товар с name = 'Samsung Galaxy S21', затем передумай и ROLLBACK.
START TRANSACTION;

DELETE FROM order_product
WHERE product_id = (
    SELECT id FROM product WHERE name = 'Samsung Galaxy S21'
);

DELETE FROM product
WHERE name = 'Samsung Galaxy S21';

ROLLBACK;

-- 179. Вставь 2 новых товара (один в категорию 1, другой в 2), затем откати транзакцию.
START TRANSACTION;

INSERT INTO product (id, name, price, category_id)
VALUES 
    (101, 'iPhone 16 Pro', 999.99, 1),
    (102, 'Samsung Galaxy Z Fold 6', 1199.99, 2);
ROLLBACK;

-- 180. Начни транзакцию, обнули цену всех товаров с price > 1000, затем выполни ROLLBACK.
START TRANSACTION;

UPDATE product
SET price = 0
WHERE price > 1000;

SELECT * FROM product WHERE price = 0;

ROLLBACK;

-- Индексы
USE phone_store;

-- 181. Создайте индекс на email в таблице client для ускорения поиска.
CREATE INDEX idx_client_email ON client (email);
-- 182. Добавьте составной индекс по client_id, order_date в таблице orders для отчётов по клиенту и дате.
CREATE INDEX idx_order_client_created ON orders (client_id, order_date);
-- 183. Создайте уникальный индекс на price в таблице product.
CREATE UNIQUE INDEX uq_product_sku ON product (price);
-- 184. Постройте индекс на price в product и убедитесь, что запросы ORDER BY price выполняются быстрее.
CREATE INDEX idx_product_price ON product (price);
-- 185. Добавьте частичный индекс на товары с id > 0 для быстрого поиска доступных позиций.
CREATE INDEX idx_product_stock ON product (id);

-- Ограничение в SQL
USE phone_store;

-- 186. Создаём новую таблицу type с первичным ключом id
CREATE TABLE type (
    id   INT PRIMARY KEY,
    name VARCHAR(100)
);

-- 187. В таблице product добавляем колонку type_id
ALTER TABLE product
    ADD COLUMN type_id INT,
    ADD CONSTRAINT fk_product_type
        FOREIGN KEY (type_id) REFERENCES type(id);

-- 188. Делаем client.email обязательным (NOT NULL)
ALTER TABLE client
    MODIFY email VARCHAR(255) NOT NULL;

-- 189. Добавляем уникальное ограничение на client.email
ALTER TABLE client
    ADD CONSTRAINT uq_client_email UNIQUE (email);

-- 190. Проверка: price должен быть > 0
ALTER TABLE product
    ADD CONSTRAINT chk_product_price_positive
        CHECK (price > 0);