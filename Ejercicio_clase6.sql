
#1
select first_name, last_name 
 from actor a  
  where EXISTS (select *
  			from actor a2
  			where a.last_name = a2.last_name
  			and a.actor_id <> a2.actor_id )
   order by last_name;
   
  
#2
select first_name, last_name
from actor a
where NOT EXISTS (select fa.actor_id 
			from film_actor fa 
			where fa.actor_id = a.actor_id);
		
		
#3
select c.first_name, c.last_name 
from customer c 
where ((select count(*) from rental r2 where r2.customer_id = c.customer_id) = 1);


#4
select c.first_name, c.last_name 
from customer c 
where ((select count(*) from rental r2 where r2.customer_id = c.customer_id) > 1);

# Otra forma
SELECT c.customer_id, first_name, last_name
  FROM rental r1, customer c
 WHERE c.customer_id = r1.customer_id
   AND NOT EXISTS (SELECT *
                     FROM rental r2
 		            WHERE r1.customer_id = r2.customer_id
 		              AND r1.rental_id <> r2.rental_id);
 		             
#5
select first_name, last_name
from actor 
where actor_id in (select actor.actor_id 
 				from actor, film f, film_actor fa
 				where actor.actor_id = fa.actor_id 
 				and fa.film_id = f.film_id 
 				and f.title in ('BETRAYED REAR', 'CATCH AMISTAD'));
 				
 			
 			
#6
select first_name, last_name
from actor 
where actor_id in (select actor.actor_id 
 				from actor, film f, film_actor fa
 				where actor.actor_id = fa.actor_id 
 				and fa.film_id = f.film_id 
 				and f.title = 'BETRAYED REAR')
and actor_id not in (select actor.actor_id 
 				from actor, film f, film_actor fa
 				where actor.actor_id = fa.actor_id 
 				and fa.film_id = f.film_id 
 				and f.title = 'CATCH AMISTAD');
 				
 				
#7
select first_name, last_name
from actor 
where actor_id in (select actor.actor_id 
 				from actor, film f, film_actor fa
 				where actor.actor_id = fa.actor_id 
 				and fa.film_id = f.film_id 
 				and f.title = 'BETRAYED REAR')
and actor_id in (select actor.actor_id 
 				from actor, film f, film_actor fa
 				where actor.actor_id = fa.actor_id 
 				and fa.film_id = f.film_id 
 				and f.title = 'CATCH AMISTAD');
 				
 				
#8
select first_name, last_name
from actor 
where actor_id not in (select actor.actor_id 
 				from actor, film f, film_actor fa
 				where actor.actor_id = fa.actor_id 
 				and fa.film_id = f.film_id 
 				and f.title in ('BETRAYED REAR', 'CATCH AMISTAD'));

 


 