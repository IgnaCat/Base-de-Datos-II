-- Ex 1
select country_id, country, (select count(*) from city c where c.country_id = co.country_id) as cities
from country co
group by country_id 
order by country, country_id;


-- Ex 2
select country_id, country, (select count(*) from city c where c.country_id = co.country_id) as cities
from country co
group by country_id 
having cities > 10
order by cities desc;


-- Ex 3
select CONCAT(cu.first_name, " ", cu.last_name) as name,  a.address,
	(select count(*) from rental r where r.customer_id = cu.customer_id) as total_films,
	(select sum(amount) from payment p2 where p2.customer_id = cu.customer_id) as total_money
from customer cu, address a 
where cu.address_id = a.address_id
order by total_money desc;


-- Ex 4 
select c2.name, 
	(select avg(f2.length) from film f2 where f2.film_id in 
		(select fc.film_id from film_category fc where fc.category_id = c2.category_id)) as promedio
from category c2
group by c2.category_id 
order by promedio desc;


-- Ex 5
-- Esta mal xd
select f.rating,
	(select sum(p.amount) from payment p where p.rental_id in
		(select r.rental_id from rental r where r.inventory_id in 
			(select i.inventory_id from inventory i where i.film_id = f.film_id))) as sales
from film f
group by f.rating
order by sales;













