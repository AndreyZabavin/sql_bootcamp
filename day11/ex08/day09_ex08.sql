CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop INTEGER DEFAULT 10)
RETURNS TABLE (fib INTEGER) AS $$
DECLARE
	a INTEGER := 0;
	b INTEGER := 1;
	temp INTEGER;
BEGIN
	WHILE a < pstop LOOP
		fib := a;
		RETURN NEXT;
		temp := a + b;
		a := b;
		b := temp;
	END LOOP;
END;
$$ LANGUAGE plpgsql;

select * from fnc_fibonacci(100);

select * from fnc_fibonacci();
