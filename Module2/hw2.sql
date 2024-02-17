select  distinct brand
from transaction_20240101 t 
where standard_cost  > 1500;

-- (1 балл) Вывести все подтвержденные транзакции за период '2017-04-01' по '2017-04-09' включительно.

select  count(*)
from transaction_20240101 t 
where transaction_date::date between '2017-04-01' and '2017-04-09' and order_status = 'Approved'; 


