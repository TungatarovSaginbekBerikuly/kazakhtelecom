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
