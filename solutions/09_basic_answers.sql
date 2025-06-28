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
