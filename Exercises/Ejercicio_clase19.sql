# Ex 1
# Create a user data_analyst

CREATE USER 'data_analyst'@'localhost' IDENTIFIED BY 'catto123';

# Ex 2
# Grant permissions only to SELECT, UPDATE and DELETE to all sakila tables to it

GRANT SELECT, DELETE, UPDATE ON sakila.* TO 'data_analyst'@'localhost';

# Ex 3
# Login with this user and try to create a table. Show the result of that operation.

ERROR 1142 (42000): CREATE command denied to user 'data_analyst'@'localhost' for table 'personas'

# Ex 4
# Try to update a title of a film. Write the update script.

UPDATE film
SET title = 'Cambiado'
WHERE film_id = 1;

# Ex 5
# With root or any admin user revoke the UPDATE permission. Write the command

REVOKE UPDATE ON sakila.* FROM data_analyst@localhost;

# Ex 6
# Login again with data_analyst and try again the update done in step 4. Show the result.

ERROR 1142 (42000): UPDATE command denied to user 'data_analyst'@'localhost' for table 'film'

