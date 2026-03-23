--подключение к БД в Session #1 и Session #2
\c SQLB_work

--команда начала режима транзакции в Session #1 и в Session #2
BEGIN;  

--суммируем рейтинг всех пиццерий в Session #1
SELECT SUM(rating) FROM pizzeria;

--добовляем новую пиццерию в таблицу pizzeria в Session #2
INSERT INTO pizzeria(id, name, rating) VALUES (10, 'Kazan Pizza', 5);

--завершаем транзакцию Session #2
COMMIT;

--суммируем рейтинг всех пиццерий в Session #1
SELECT SUM(rating) FROM pizzeria;

--завершаем транзакцию Session #1
COMMIT;

--суммируем рейтинг всех пиццерий в Session #1
SELECT SUM(rating) FROM pizzeria;

--суммируем рейтинг всех пиццерий в Session #2
SELECT SUM(rating) FROM pizzeria;