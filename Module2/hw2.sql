--(1 балл) Вывести все уникальные бренды, у которых стандартная стоимость выше 1500 долларов.

select  distinct brand
from transaction_20240101 t 
where standard_cost  > 1500;

-- (1 балл) Вывести все подтвержденные транзакции за период '2017-04-01' по '2017-04-09' включительно.

select  *
from transaction_20240101 t 
where transaction_date::date between '2017-04-01' and '2017-04-09' and order_status = 'Approved'; 

select  count(*)
from transaction_20240101 t 
where transaction_date::date between '2017-04-01' and '2017-04-09' and order_status = 'Approved'; 

-- (1 балл) Вывести все профессии у клиентов из сферы IT или Financial Services, которые начинаются с фразы 'Senior'.

select  distinct  job_title 
from customer_20240101 c 
where job_industry_category in ('IT', 'Financial Services') and job_title  like 'Senior%';

-- (1 балл) Вывести все бренды, которые закупают клиенты, работающие в сфере Financial Services

select distinct  brand
from customer_20240101 c 
inner join transaction_20240101 t 
on c.customer_id = t.customer_id 
where c.job_industry_category = 'Financial Services';

--(1 балл) Вывести 10 клиентов, которые оформили онлайн-заказ продукции из брендов 'Giant Bicycles', 'Norco Bicycles', 'Trek Bicycles'.
select  count(*)
from customer_20240101 c 
inner join transaction_20240101 t 
on c.customer_id = t.customer_id 
where t.brand in ('Giant Bicycles', 'Norco Bicycles', 'Trek Bicycles') and t.online_order = 'True'
limit 10;

select *
from customer_20240101 c 
where customer_id in
(select distinct customer_id from transaction_20240101 t where brand in ('Giant Bicycles', 'Norco Bicycles', 'Trek Bicycles') and online_order = 'True')
limit 10;

-- (1 балл) Вывести всех клиентов, у которых нет транзакций.
select count(*) 
from customer_20240101 c 
where customer_id  not in
(select distinct customer_id from transaction_20240101 t);

-- (2 балла) Вывести всех клиентов из IT, у которых транзакции с максимальной стандартной стоимостью.
select *
from customer_20240101 c 
where job_industry_category = 'IT' and 
customer_id  in 
(select distinct customer_id from transaction_20240101 t where standard_cost = (select  max(standard_cost) 
from transaction_20240101 t));  


-- (2 балла) Вывести всех клиентов из сферы IT и Health, у которых есть подтвержденные транзакции за период '2017-07-07' по '2017-07-17'.
select *
from customer_20240101 c 
where job_industry_category in ('IT', 'Health') and customer_id in
(select distinct customer_id from transaction_20240101 t where transaction_date::date between '2017-07-07' and '2017-07-17' and order_status = 'Approved');



