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