
-- Создание базы данных
DROP DATABASE IF EXISTS phone_store;
CREATE DATABASE phone_store;
USE phone_store;

-- Таблица: client
CREATE TABLE client (
  id INT PRIMARY KEY,
  name VARCHAR(100),
  email VARCHAR(100)
);

-- Таблица: client_profile (1 к 1)
CREATE TABLE client_profile (
  client_id INT PRIMARY KEY,
  address VARCHAR(200),
  phone VARCHAR(20),
  FOREIGN KEY (client_id) REFERENCES client(id)
);

-- Таблица: category
CREATE TABLE category (
  id INT PRIMARY KEY,
  name VARCHAR(50)
);

-- Таблица: product
CREATE TABLE product (
  id INT PRIMARY KEY,
  name VARCHAR(100),
  price DECIMAL(10,2),
  category_id INT,
  FOREIGN KEY (category_id) REFERENCES category(id)
);

-- Таблица: order
CREATE TABLE `order` (
  id INT PRIMARY KEY,
  client_id INT,
  order_date DATE,
  FOREIGN KEY (client_id) REFERENCES client(id)
);

-- Таблица: order_product (многие ко многим)
CREATE TABLE order_product (
  order_id INT,
  product_id INT,
  quantity INT,
  PRIMARY KEY (order_id, product_id),
  FOREIGN KEY (order_id) REFERENCES `order`(id),
  FOREIGN KEY (product_id) REFERENCES product(id)
);

-- Вставка данных

-- Категории
INSERT INTO category VALUES (1, 'iPhone'), (2, 'Samsung');

-- Товары
INSERT INTO product VALUES 
(1, 'iPhone 13', 999.99, 1),
(2, 'iPhone 14', 1099.99, 1),
(3, 'iPhone SE', 499.99, 1),
(4, 'Samsung Galaxy S21', 899.99, 2),
(5, 'Samsung Galaxy S22', 999.99, 2),
(6, 'Samsung A52', 399.99, 2),
(7, 'iPhone 13 Mini', 799.99, 1),
(8, 'Samsung M31', 299.99, 2),
(9, 'iPhone 12 Pro', 899.99, 1),
(10, 'Samsung Z Flip', 1299.99, 2);

-- Клиенты
INSERT INTO client VALUES 
(1, 'Alice', 'alice@example.com'),
(2, 'Bob', 'bob@example.com'),
(3, 'Charlie', 'charlie@example.com'),
(4, 'David', 'david@example.com'),
(5, 'Eve', 'eve@example.com'),
(6, 'Frank', 'frank@example.com');

-- Профили клиентов
INSERT INTO client_profile VALUES 
(1, 'Almaty, KZ', '+77001112233'),
(2, 'Astana, KZ', '+77002223344'),
(3, 'Shymkent, KZ', '+77003334455'),
(4, 'Atyrau, KZ', '+77004445566'),
(5, 'Aktobe, KZ', '+77005556677'),
(6, 'Karaganda, KZ', '+77006667788');

-- Заказы
INSERT INTO `order` VALUES 
(1, 1, '2025-06-01'),
(2, 2, '2025-06-03'),
(3, 3, '2025-06-05'),
(4, 1, '2025-06-07'),
(5, 5, '2025-06-08');

-- Заказанные товары
INSERT INTO order_product VALUES 
(1, 1, 1), (1, 4, 1),
(2, 2, 2),
(3, 5, 1),
(4, 3, 1), (4, 10, 1),
(5, 6, 1), (5, 8, 2);
