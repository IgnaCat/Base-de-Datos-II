

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
			
	
		
#3
SELECT customer_id, 
       first_name, 
       last_name, 
       (SELECT DISTINCT amount 
          FROM payment p
         WHERE c.customer_id = p.customer_id 
           AND amount <= ALL (SELECT amount 
                                FROM payment p1
                               WHERE c.customer_id = p1.customer_id))
	   AS min_amount 
  FROM customer c
 ORDER BY min_amount DESC,
          customer_id DESC;


#4
SELECT customer_id,
	   first_name,
	   last_name,
	   CONCAT((SELECT MAX(amount) 
	      FROM payment p
	     WHERE p.customer_id = c.customer_id),' - ',
	     (SELECT MIN(amount) 
	      FROM payment p1
	     WHERE p1.customer_id = c.customer_id)) as `max and min amount`
  FROM customer c
 ORDER BY `max and min amount` DESC,
           customer_id DESC;
        
       
       
       
       
       