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
