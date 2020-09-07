/* Create two or three queries using address table in sakila db:

include postal_code in where (try with in/not it operator)
eventually join the table with city/country tables.
measure execution time.
Then create an index for postal_code on address table.
measure execution time again and compare with the previous ones.
Explain the results */

# Ex 1
select *
from address a
inner join city c using (city_id)
inner join country c2 using (country_id)
where postal_code in ('40301','52625');
# 4ms

select *
from address a
inner join city c using (city_id)
inner join country c2 using (country_id)
where postal_code in ('59025','89668','28396');
# 4ms

create index postalCode 
on address(postal_code);
# 3ms


# Ex 2
# Run queries using actor table, searching for first and last name columns independently. Explain the differences and why is that happening?

select *
from actor a2
where first_name like 'P%';

select *
from actor a2
where last_name like 'G%';

# last name tiene un indice


#Ex 3
# Compare results finding text in the description on table film with LIKE and in the film_text using MATCH ... AGAINST. Explain the results.

select *
from film_text
where description like '%Epic%'
and description like '%Drama%';
# 6 rows - 5ms


select * 
from film_text
where match(title, description) against('Epic,Drama');
# 142 rows - 4ms

# Full text search usa un index, mientras q like tiene q escanear registros en toda la tabla
# Like te trae menos rows xq es mas precisa, ya que
# LIKE "% The%" AND LIKE "% Matrix" seleccionará "The Matrix" pero no "Matrix Reloaded", 
# mientras que full text serach ignorará "The" y devolverá ambos.










