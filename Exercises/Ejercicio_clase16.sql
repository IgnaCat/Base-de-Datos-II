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




