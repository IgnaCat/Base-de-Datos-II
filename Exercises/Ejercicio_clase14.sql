
#Ex 1
select CONCAT_WS(' ', cu.first_name, cu.last_name), a.address, ci.city 
from customer cu
inner join address a using (address_id)
inner join city ci using (city_id) 
inner join country co using (country_id)
where co.country = "Argentina";


#Ex 2
select f.title, l.name, 
	case f.rating
		when 'G' then 'G (General Audiences) – All ages admitted'
		when 'PG' then 'PG (Parental Guidance Suggested) – Some material may not be suitable for children'
		when 'PG-13' then 'PG-13 (Parents Strongly Cautioned) – Some material may be inappropriate for children under 13'
		when 'R' then 'R (Restricted) – Under 17 requires accompanying parent or adult guardian'
		when 'NC-17' then 'NC-17 (Adults Only) – No one 17 and under admitted'
		else 'Unrated'
	end as 'rating'
from film f
inner join language l using (language_id);


#Ex 3
select f.title, f.release_year, CONCAT_WS(' ', ac.first_name, ac.last_name) as name
from film f
inner join film_actor using (film_id)
inner join actor ac using (actor_id)
where CONCAT_WS(' ', ac.first_name, ac.last_name) = TRIM('PENELOPE GUINESS');

#Ex 4
select f.title, CONCAT_WS(' ', cu.first_name, cu.last_name),
case 
	when r.return_date is not null then 'Yes'
	else 'No'
end as 'returned'
from film f
inner join inventory using (film_id)
inner join rental r using (inventory_id)
inner join customer cu using (customer_id)
where MONTH(r.rental_date) in (5, 6);

#Ex 5

#Ex 6





















