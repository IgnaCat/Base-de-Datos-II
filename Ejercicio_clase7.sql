

#1
select title, rating, `length` 
from film f
where `length` <= all(select `length` 
			from film f2
			where f.film_id <> f2.film_id);
			
		
		
#2
select title, `length` 
from film f
where `length` < all(select `length` 
			from film f2
			where f.film_id <> f2.film_id);