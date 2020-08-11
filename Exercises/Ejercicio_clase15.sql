#Ex 1
CREATE OR REPLACE VIEW list_of_customers AS
SELECT cu.customer_id, CONCAT_WS(' ', cu.first_name, cu.last_name) as name,
a.address, a.postal_code, a.phone, ci.city, co.country,
CASE
WHEN cu.active = 1 THEN "active"
WHEN cu.active = 0 THEN "inactive"
ELSE "No information"
END, s.store_id
FROM customer cu
INNER JOIN store s USING(store_id)
INNER JOIN address a ON a.address_id = s.address_id
INNER JOIN city ci USING(city_id)
INNER JOIN country co USING(country_id);


#Ex 2
#Create a view named film_details, it should contain the following columns: 
#film id, title, description, category, price, length, rating, actors - as a string of all the actors separated by comma. 
#Hint use GROUP_CONCAT

CREATE OR REPLACE VIEW film_details AS
SELECT f.film_id, f.title, f.description, c.name, f.replacement_cost, f.length, f.rating, 
GROUP_CONCAT(DISTINCT CONCAT_WS(' ', a.first_name, a.last_name))
FROM film f
INNER JOIN film_category USING(film_id)
INNER JOIN category c USING(category_id)
INNER JOIN film_actor USING(film_id)
INNER JOIN actor a USING(actor_id)
GROUP BY f.film_id, c.name;

#Ex 3
#Create view sales_by_film_category, it should return 'category' and 'total_rental' columns.

CREATE OR REPLACE VIEW sales_by_film_category AS
SELECT c.name, SUM(p.amount) as 'total_rental'
FROM film f
INNER JOIN film_category USING(film_id)
INNER JOIN category c USING(category_id)
INNER JOIN inventory USING(film_id)
INNER JOIN rental USING(inventory_id)
INNER JOIN payment p USING(rental_id)
GROUP BY c.name
ORDER BY 'total_rental' DESC;

#Ex 4
#Create a view called actor_information where it should return, actor id, first name, last name and the amount of films he/she acted on.

CREATE OR REPLACE VIEW actor_information AS
SELECT a.actor_id, CONCAT_WS(' ', a.first_name, a.last_name), COUNT(fa.film_id) as 'total_films'
FROM actor a 
INNER JOIN film_actor fa USING(actor_id)
GROUP BY a.actor_id
ORDER BY 'total_films' DESC;










