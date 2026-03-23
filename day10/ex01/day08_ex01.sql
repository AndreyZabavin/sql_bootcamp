--подключение к БД в Session #1 и Session #2
\c SQLB_work

--проверяем уровень изоляции в Session #1 и Session #2
SHOW TRANSACTION ISOLATION LEVEL;

--команда начала режима транзакции в Session #1
BEGIN;  

--команда начала режима транзакции в Session #2
BEGIN;  

--проверяем рейтинг в Session #1
SELECT * FROM pizzeria WHERE name='Pizza Hut';

--проверяем рейтинг в Session #2
SELECT * FROM pizzeria WHERE name='Pizza Hut';

--обновляем рейтинг в Session #1
UPDATE pizzeria SET rating=4.0 WHERE name='Pizza Hut';

--обновляем рейтинг в Session #2
UPDATE pizzeria SET rating=3.6 WHERE name='Pizza Hut';

--завершаем транзакцию Session #1
COMMIT;

--завершаем транзакцию Session #2
COMMIT;

--проверяем изменения в рейтинге в Session #1
SELECT * FROM pizzeria WHERE name='Pizza Hut';

--проверяем изменения в рейтинге в Session #2
SELECT * FROM pizzeria WHERE name='Pizza Hut';