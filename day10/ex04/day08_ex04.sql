--подключение к БД в Session #1 и Session #2
\c SQLB_work

--начинаем транзакцию и устанавливаем уровень изоляции SERIALIZABLE в Session #1 и Session #2
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;

--проверяем рейтинг в Session #1
SELECT * FROM pizzeria WHERE name='Pizza Hut';

--обновляем рейтинг в Session #2
UPDATE pizzeria SET rating=3.0 WHERE name='Pizza Hut';

--завершаем транзакцию Session #2
COMMIT;

--проверяем рейтинг в Session #1
SELECT * FROM pizzeria WHERE name='Pizza Hut';

--завершаем транзакцию Session #1
COMMIT;

--проверяем изменения в рейтинге в Session #1
SELECT * FROM pizzeria WHERE name='Pizza Hut';

--проверяем изменения в рейтинге в Session #2
SELECT * FROM pizzeria WHERE name='Pizza Hut';