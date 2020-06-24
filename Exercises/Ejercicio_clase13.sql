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
(rental_date, inventory_id, customer_id, return_date, staff_id, last_update)
VALUES('', 0, 0, '', 0, CURRENT_TIMESTAMP);


#Ex 3
UPDATE sakila.film
SET release_year = 2001
WHERE rating = "G";


#Ex 4
select * from film f 
inner join inventory i using(film_id)
inner join rental r using(inventory_id)
where r.return_date is null
order by r.rental_date desc
limit 1;

#Ex 5
DELETE FROM film WHERE title = "AGENT TRUMAN";
#	This query couldn't delete the film because
#	it has references on others tables.


DELETE FROM film_actor 
WHERE film_id IN(
	select film_id from film_id 
	WHERE title = "AGENT TRUMAN");
				
DELETE FROM film_category 
WHERE film_id IN(
	select film_id from film_id 
	WHERE title = "AGENT TRUMAN");

DELETE FROM inventory 
WHERE film_id IN(
	select film_id from film_id 
	WHERE title = "AGENT TRUMAN");

DELETE FROM film 
WHERE title = "AGENT TRUMAN";




















