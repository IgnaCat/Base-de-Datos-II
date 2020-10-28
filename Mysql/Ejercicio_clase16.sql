#Ex 1
#Insert a new employee to , but with an null email. Explain what happens.
INSERT INTO `employees`(`employeeNumber`,`lastName`,`firstName`,`extension`,`email`,`officeCode`,`reportsTo`,`jobTitle`) 
VALUES (1137,'Martinez','Ignacio','x5730',NULL,'1',NULL,'President');

# En la declaracion de la tabla employees se explicita 
# con una constraint que el email no puede ser null.


#Ex 2
UPDATE employees SET employeeNumber = employeeNumber - 20;

# Actualiza la tabla employees, restandole 20 al valor employeeNumber de todos 
# los registros q haya en esa tabla. 

UPDATE employees SET employeeNumber = employeeNumber + 20;

# En este caso en vez de restar hace una suma, pero sale un error
# de q esta duplicada la entrada para la primery key, ya que
# employeeNumber es la primary key y cada valor que se inserte 
# en ella no puede ser repetido.


#Ex 3
#Add a age column to the table employee where and it can only accept values from 16 up to 70 years old.
ALTER TABLE employees 
	ADD `age` int NOT NULL CHECK (`age` BETWEEN 16 AND 70 );
#(salta error)

#Ex 4
#Describe the referential integrity between tables film, actor and film_actor in sakila db.

# The referential integrity se usa junto a las foreign keys, para establecer enlaces 
# validos entre las tablas, cosa q aquellas entradas en film tengan un id valido en las otras tablas 
# y puedan ser aceptadas y guardadas en la base de datos. 
 

#Ex 5
#Create a new column called lastUpdate to table employee and use trigger(s) to keep the 
#date-time updated on inserts and updates operations. Bonus: add a column lastUpdateUser 
#and the respective trigger(s) to specify who was the last MySQL user that changed the 
#row (assume multiple users, other than root, can connect to MySQL and change this table).
ALTER TABLE employees
	ADD lastUpdate DATETIME,
	ADD lastUpdateUser VARCHAR(45);

DELIMITER $$
CREATE TRIGGER before_employees_insert
    BEFORE INSERT ON employees
    FOR EACH ROW
BEGIN    
    SET NEW.lastUpdate = NOW(),
    NEW.lastUpdateUser = USER();
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER before_employees_update
    BEFORE UPDATE ON employees
    FOR EACH ROW
BEGIN    
    SET NEW.lastUpdate = NOW(),
    NEW.lastUpdateUser = USER();
END$$
DELIMITER ;


#Ex 6
#Find all the triggers in sakila db related to loading film_text table. What do they do? Explain each of them using its source code for the explanation.
# Film_text usa indices para hacer una busqueda mas rapida de los films, pero algunos procesos de insercion son mas lentos.


CREATE DEFINER=`user`@`%` TRIGGER `ins_film` AFTER INSERT ON `film` FOR EACH ROW BEGIN
    INSERT INTO film_text (film_id, title, description)
        VALUES (new.film_id, new.title, new.description);
 END
 # Dice q luego de hacer un insert en la tabla film, hace un loop y me duplica esos datos en film_text.

CREATE DEFINER=`user`@`%` TRIGGER `upd_film` AFTER UPDATE ON `film` FOR EACH ROW BEGIN
   IF (old.title != new.title) OR (old.description != new.description) OR (old.film_id != new.film_id)
   THEN
       UPDATE film_text
           SET title=new.title,
               description=new.description,
               film_id=new.film_id
       WHERE film_id=old.film_id;
   END IF;
 END
 # Luego de hacer un update en film, hace un if para verificar q se hayan hecho cambios y actualiza estos en film_text.
  
 CREATE DEFINER=`user`@`%` TRIGGER `del_film` AFTER DELETE ON `film` FOR EACH ROW BEGIN
   DELETE FROM film_text WHERE film_id = old.film_id;
 END
# Luego de hacer un delete en film, se borra de film_text los films donde 
# el film_id sea igual al film_id de la row q queres borrar.

