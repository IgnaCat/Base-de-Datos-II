#1
select title, special_features
 from film 
  where rating = 'PG-13';
  
#2
select title, `length` 
 from film;
 
#3
select title, rental_rate, replacement_cost
 from film 
  where replacement_cost BETWEEN 20 and 24;
  
#4
select f.title, c.name 'category', f.rating
 from film f, category c, film_category fc 
  where f.film_id = fc.film_id 
   and fc.category_id = c.category_id 
    and f.special_features like '%Behind the Scenes%';
   
#5
select a.first_name, a.last_name
 from actor a, film f, film_actor fa 
  where f.film_id = fa.film_id 
   and fa.actor_id = a.actor_id 
    and f.title = 'ZOOLANDER FICTION';
    
    
#6
select address, city, country
 from store s, address a, city ci, country co
  where s.address_id = a.address_id 
   and a.city_id = ci.city_id 
    and ci.country_id = co.country_id 
     and s.store_id = 1;
    

 #falta el 7   
    

#8
select f.title, s2.first_name, s2.last_name 
 from film f, inventory i, store s1, staff s2
  where f.film_id = i.film_id 
   and i.store_id = s1.store_id
    and s1.manager_staff_id = s2.staff_id
     and s1.store_id = 2;
     
    
    
  
   
   
  
   
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
   
   
  
  

  