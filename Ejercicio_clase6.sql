
#1
select first_name, last_name 
 from actor a  
  where EXISTS (select *
  				from actor a2
  				where a.last_name = a2.last_name
  				and a.actor_id <> a2.actor_id )
   order by last_name;
   
  
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

 


 