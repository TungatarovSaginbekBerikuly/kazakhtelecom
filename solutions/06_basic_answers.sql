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
