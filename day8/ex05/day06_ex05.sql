COMMENT ON TABLE person_discounts IS 
'Таблица хранит персональные скидки клиентов для конкретных пиццерий';

COMMENT ON COLUMN person_discounts.id IS 
'Уникальный идентификатор записи о скидке';

COMMENT ON COLUMN person_discounts.person_id IS
'Ссылка на клиента, которому предоставлена скидка';

COMMENT ON COLUMN person_discounts.pizzeria_id IS
'Ссылка на пиццерию, в которой действует скидка';

COMMENT ON COLUMN person_discounts.discount IS
'Размер скидки в процентах для данного клиента и пиццерии';