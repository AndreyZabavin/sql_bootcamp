--подключение к БД в Session #1 и Session #2
\c SQLB_work

--команда начала режима транзакции в Session #1 и в Session #2
BEGIN;  

--делаем обновление в pizzeria в Session #1
UPDATE pizzeria SET rating = 1 WHERE id = 1;

--делаем обновление в pizzeria в Session #2
UPDATE pizzeria SET rating = 2 WHERE id = 2;

--делаем обновление в pizzeria в Session #1
UPDATE pizzeria SET rating = 3 WHERE id = 2;

--делаем обновление в pizzeria в Session #2
UPDATE pizzeria SET rating = 4 WHERE id = 1;

--завершаем транзакцию в Session #1 и в Session #2
COMMIT;
