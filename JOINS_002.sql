CREATE TABLE CONTINENTS(continent_code varchar(255),continent_name varchar(255));
CREATE TABLE COUNTRIES(country_code varchar(255),country_name varchar(255),continent_code varchar(255));
-------------
insert into  CONTINENTS(continent_code,continent_name) values('AS','Asia' );
insert into  CONTINENTS(continent_code,continent_name) values('AF','Africa' );
insert into  CONTINENTS(continent_code,continent_name) values('NA','North America' );
insert into  CONTINENTS(continent_code,continent_name) values('SA','South America' );
insert into  CONTINENTS(continent_code,continent_name) values('EU','Europe' );
insert into  CONTINENTS(continent_code,continent_name) values('AU','Australia' );
 
INSERT INTO COUNTRIES(country_code,country_name,continent_code) VALUES('IN','INDIA','ASIA');
INSERT INTO COUNTRIES(country_code,country_name,continent_code) VALUES('ZA','South Africa','AF');
INSERT INTO COUNTRIES(country_code,country_name,continent_code) VALUES('US','United States of America','NA');
INSERT INTO COUNTRIES(country_code,country_name,continent_code) VALUES('BR','Brazil','SA');
INSERT INTO COUNTRIES(country_code,country_name,continent_code) VALUES('AU','Australia','AU');
INSERT INTO COUNTRIES(country_code,country_name,continent_code) VALUES('AQ','Antartica','AN');
-------------
###SELF JOIN
### When you join a table to itself. 

### INNER JOIN 
SELECT cr.country_name, ct.continent_name,cr.country_code
FROM continents ct
INNER JOIN countries cr 
ON ct.continent_code = cr.continent_code;

###NATURAL JOIN is similar to INNER join,
###but we do not need to use the ON clause during the join.
###Meaning in a natural join we just specify the tables. We do not specify the columns based on which this join should work. 
SELECT cr.country_name, ct.continent_name,cr.country_code
FROM continents ct
NATURAL JOIN countries cr;

### LEFT JOIN <LEFT JOIN will fetch all records from the left table>
SELECT ct.continent_name,cr.country_name
FROM continents ct
LEFT JOIN countries cr 
ON ct.continent_code = cr.continent_code;

### RIGHT JOIN <RIGHT JOIN will fetch all records from the right table>
SELECT ct.continent_name,cr.country_name
FROM continents ct
RIGHT JOIN countries cr 
ON ct.continent_code = cr.continent_code;

###CROSS JOIN will join all the records from left table with all the records from right table. 
SELECT cr.country_name, ct.continent_name
FROM continents ct
CROSS JOIN countries cr 
on ct.continent_code = cr.continent_code;

### FULL JOIN <FULL JOIN will fetch all records from both left and right table>





