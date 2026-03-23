--подключение к БД в Session #1 и Session #2
\c SQLB_work

--устанавливаем уровень изоляции REPEATABLE READ и начинаем транзакцию в Session #1 и Session #2
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ; 

--суммируем рейтинг всех пиццерий в Session #1
SELECT SUM(rating) FROM pizzeria;

--добовляем новую пиццерию в таблицу pizzeria в Session #2
INSERT INTO pizzeria(id, name, rating) VALUES (11, 'Kazan Pizza 2', 4);

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