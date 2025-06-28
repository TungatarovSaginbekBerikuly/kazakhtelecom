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