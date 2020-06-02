
#Ex 4
select title
from film f 
left join inventory i using (film_id)
where i.film_id is null;


#Ex 5
select f.title, i.inventory_id
from film f
inner join inventory i using (film_id)
left join rental r using (inventory_id)
where r.inventory_id is null;


#Ex 6
select c.first_name, c.last_name, s.store_id, f.title
from film f
inner join inventory i using (film_id)
inner join rental r using (inventory_id)
inner join customer c using (customer_id)
inner join store s on c.store_id = s.store_id;


#Ex 7
select CONCAT_WS(" ", ci.city, co.country, "-", 
st.first_name, st.last_name) AS "store - manager info", sum(p.amount) as sales
from store s 
inner join address a using (address_id)
inner join city ci using (city_id)
inner join country co using (country_id)
inner join staff st on st.staff_id = s.manager_staff_id
inner join payment p on st.staff_id = p.staff_id
group by s.store_id;


#Ex 8
select a.actor_id, a.first_name, a.last_name, count(*) as film_count
from actor a
inner join film_actor using (actor_id)
inner join film using (film_id)
group by a.actor_id
having film_count >= all(select count(*) from actor a2 
							inner join film_actor fa on fa.actor_id = a2.actor_id 
							group by a2.actor_id );
						













