--подключение к БД в Session #1 и Session #2
\c SQLB_work

--команда начала режима транзакции
BEGIN;  

--обновляем рейтинг в Session #1
UPDATE pizzeria SET rating=5.0 WHERE name='Pizza Hut';

--проверяем изменения в рейтинге в Session #1
SELECT * FROM pizzeria WHERE name='Pizza Hut';

--проверяем изменения в рейтинге в Session #2
SELECT * FROM pizzeria WHERE name='Pizza Hut';

--завершаем транзакцию Session #1
COMMIT;

--проверяем изменения в рейтинге в Session #2
SELECT * FROM pizzeria WHERE name='Pizza Hut';