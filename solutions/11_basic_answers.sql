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
