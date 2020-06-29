/* 

    1.Add a new customer
        To store 1
        For address use an existing address. The one that has the biggest address_id in 'United States'

    2.Add a rental
        Make easy to select any film title. I.e. I should be able to put 'film tile' in the where, and not the id.
        Do not check if the film is already rented, just use any from the inventory, e.g. the one with highest id.
        Select any staff_id from Store 2.

    3.Update film year based on the rating
        For example if rating is 'G' release date will be '2001'
        You can choose the mapping between rating and year.
        Write as many statements are needed.

    4.Return a film
        Write the necessary statements and queries for the following steps.
        Find a film that was not yet returned. And use that rental id. Pick the latest that was rented for example.
        Use the id to return the film.

    5.Try to delete a film
        Check what happens, describe what to do.
        Write all the necessary delete statements to entirely remove the film from the DB.

    6.Rent a film
        Find an inventory id that is available for rent (available in store) pick any movie. Save this id somewhere.
        Add a rental entry
        Add a payment entry
        Use sub-queries for everything, except for the inventory id that can be used directly in the queries.
 */

#Ex 1
INSERT INTO sakila.customer
(store_id, first_name, last_name, email, address_id, active, create_date, last_update)
VALUES(1, 'Ignacio', 'Martinez', 'ignacio@gmail.com', 
(select max(address_id) from address 
inner join city using (city_id)
inner join country co using (country_id)
where co.country = "United States"),
1, CURDATE(), CURRENT_TIMESTAMP);


#Ex 2
INSERT INTO sakila.rental
(rental_date, inventory_id, customer_id, staff_id, last_update)
VALUES(CURRENT_TIMESTAMP, 
(select MAX(inventory_id) from inventory
inner join film using (film_id)
where film.title = "AGENT TRUMAN"),
1, 
(select staff_id from staff 
inner join store using (store_id)
where store.store_id = 2), CURRENT_TIMESTAMP);


#Ex 3
UPDATE sakila.film
SET release_year = 2001
WHERE rating = "G";


#Ex 4
set @inv_id = (
select i.inventory_id from inventory i
inner join film f using(film_id)
inner join rental r using(inventory_id)
where r.return_date is null
order by r.rental_date desc
limit 1);

UPDATE sakila.rental 
SET return_date = CURRENT_TIMESTAMP
WHERE inventory_id = @inv_id;


#Ex 5
DELETE FROM film WHERE title = "AGENT TRUMAN";
#	This query couldn't delete the film because
#	it has references on others tables.


DELETE FROM film_actor 
WHERE film_id IN(
	select film_id from film 
	WHERE title = "AGENT TRUMAN");
				
DELETE FROM film_category 
WHERE film_id IN(
	select film_id from film 
	WHERE title = "AGENT TRUMAN");

DELETE FROM rental
WHERE inventory_id IN(
	SELECT inventory_id FROM inventory 
	INNER JOIN film USING (film_id)
	WHERE film.title = "AGENT TRUMAN");

DELETE FROM inventory 
WHERE film_id IN(
	select film_id from film 
	WHERE title = "AGENT TRUMAN");

DELETE FROM film 
WHERE title = "AGENT TRUMAN";






















