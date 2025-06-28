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
