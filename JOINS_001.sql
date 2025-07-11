 CREATE TABLE customers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50)
);
 
CREATE TABLE orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);
 
INSERT INTO customers (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');
       
       
INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016-02-10', 99.99, 1),
       ('2017-11-11', 35.50, 1),
       ('2014-12-12', 800.67, 2),
       ('2015-01-03', 12.50, 2),
       ('1999-04-11', 450.25, 5);
       
       
Select * from EMP.customers; <id | first_name | last_name | email >

Select * from EMP.orders; <id | order_date | amount | customer_id>

#Cross Joins
##########################################
#Provides cartesian product number of rows.

Select count(*) 
from EMP.customers,EMP.orders;

# INNER JOIN
##########################################

Select A.id,concat(last_name,' ',last_name) as name,email,order_date,amount from EMP.customers A 
inner join EMP.orders B
on A.id= B.customer_id;

Select concat(first_name,' ',last_name) as name,sum(amount)  as total from EMP.customers A 
inner join EMP.orders B
on A.id= B.customer_id
group by last_name,first_name,email;

# LEFT JOIN
##########################################

Select concat(first_name,' ',last_name) as name,sum(amount)  as total from EMP.customers A 
LEFT join EMP.orders B
on A.id= B.customer_id
group by last_name,first_name,email;

Select concat(first_name,' ',last_name) as name,IFNULL(sum(amount),0) as total from EMP.customers A 
LEFT join EMP.orders B
on A.id= B.customer_id
group by last_name,first_name,email;

Select first_name,
	   last_name,
       order_date,
       amount
       from EMP.customers A 
LEFT join EMP.orders B
on A.id= B.customer_id;

# RIGHT JOIN
##########################################
Select concat(first_name,' ',last_name) as name,sum(amount)  as total from EMP.customers A 
right join EMP.orders B
on A.id= B.customer_id
group by last_name,first_name,email;

Select concat(first_name,' ',last_name) as name,IFNULL(sum(amount),0) as total from EMP.customers A 
right join EMP.orders B
on A.id= B.customer_id
group by last_name,first_name,email;

Select first_name,
	   last_name,
       order_date,
       amount
       from EMP.customers A 
right join EMP.orders B
on A.id= B.customer_id;

# FULL OUTER  JOIN
##########################################
Select first_name,last_name as name,amount 
from EMP.customers A 
full join EMP.orders B
on A.id= B.customer_id
 
Select concat(first_name,' ',last_name) as name,IFNULL(sum(amount),0) as total from EMP.customers A 
right join EMP.orders B
on A.id= B.customer_id
group by last_name,first_name,email;

Select first_name,
	   last_name,
       order_date,
       amount
       from EMP.customers A 
right join EMP.orders B
on A.id= B.customer_id;