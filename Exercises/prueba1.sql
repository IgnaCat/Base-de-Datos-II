

#Ex 1
select co.country, ci.city, CONCAT_WS(' ', a.address, a.address2) as address, a.district, a.postal_code
from country co
inner join city ci using (country_id)
inner join address a using (city_id)
where co.country like '%a'
and co.country like 'E%'
order by co.country, ci.city;

#Ex 2
select CONCAT_WS('  ', first_name, last_name) as name,
    (select count(*) from rental r where r.customer_id = cu.customer_id) as peliculas_alquiladas,
    (select sum(amount) from payment p where p.customer_id = cu.customer_id ) as dinero_gastado
from customer cu
group by cu.customer_id 
having dinero_gastado between 10 and 100
order by peliculas_alquiladas, dinero_gastado;

#Ex 3 
select CONCAT_WS('  ', cu.first_name, cu.last_name) as name, count(*) as peliculas_alquiladas, f.rating
from customer cu
inner join rental r2 using (customer_id)
inner join inventory i using (inventory_id)
inner join film f using (film_id)
where r2.return_date is null
group by f.rating, cu.customer_id 
order by f.rating, peliculas_alquiladas;

