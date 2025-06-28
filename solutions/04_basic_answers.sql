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
