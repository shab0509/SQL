use EMP;

CREATE TABLE employees (
    emp_no INT PRIMARY KEY AUTO_INCREMENT,
    department VARCHAR(20),
    salary INT
);
 
INSERT INTO employees (department, salary) VALUES
('engineering', 80000),
('engineering', 69000),
('engineering', 70000),
('engineering', 103000),
('engineering', 67000),
('engineering', 89000),
('engineering', 91000),
('sales', 59000),
('sales', 70000),
('sales', 159000),
('sales', 72000),
('sales', 60000),
('sales', 61000),
('sales', 61000),
('customer service', 38000),
('customer service', 45000),
('customer service', 61000),
('customer service', 40000),
('customer service', 31000),
('customer service', 56000),
('customer service', 55000);
 
SELECT emp_no, department, salary, AVG(salary) OVER() FROM employees;

Select emp_no,department,salary, max(salary) over(partition by department) as agg_func 
from employees
order by agg_func desc;
    
SELECT emp_no, department, salary, 
MIN(salary) over(), 
MAX(salary) over()
FROM employees;

SELECT emp_no,department,salary,
MIN(salary) OVER(partition by department),
MAX(salary) OVER(partition by department)
FROM employees;    



#BASIC_AGGREGATION
#################################################
Select department,avg(salary)
from  EMP.employees
group by department 

#OVER() and PARTITION BY
#################################################
Select emp_no,department,avg(salary) OVER() as avg_sal from EMP.employees

SELECT emp_no,department,salary, AVG(salary) OVER(PARTITION BY department) from EMP.employees

SELECT 
	emp_no,
    department,
    salary, 
    SUM(salary) OVER(PARTITION BY department ORDER BY salary asc) as dept_sal_sum
from EMP.employees

#RANK
#################################################
SELECT 
	emp_no,
    department,
    salary, 
    RANK() OVER(ORDER BY salary desc) as rank_overall,
    RANK() OVER(PARTITION BY department ORDER BY salary desc) as rank_deptwise
from EMP.employees order by department;

#ROW_NUMBER/DENSE_RANK
#################################################
SELECT 
emp_no,
department,
salary,
ROW_NUMBER() OVER() as rownumber_overall
from EMP.employees order by department;

SELECT 
	emp_no,
    department,
    salary,
    ROW_NUMBER() OVER(PARTITION BY department ORDER BY salary desc) as rownumber_overall,
    RANK() OVER(ORDER BY salary desc) as rank_overall_salary,
    RANK() OVER(PARTITION BY department ORDER BY salary desc) as rank_deptwise,
    DENSE_RANK() OVER(PARTITION BY department order by salary desc) as denserank_new
from EMP.employees order by department;

#DENSE_RANK
#################################################
SELECT 
	emp_no,
    department,
    salary,
    DENSE_RANK() OVER(ORDER BY salary) as denserank_new,
    RANK() OVER(ORDER BY salary desc) as rank_overall
from EMP.employees order by denserank_new;

#LAG
#################################################
SELECT 
	emp_no,
    department,
    salary,
    LAG(salary) over(order by salary desc) as lag_salary
from EMP.employees;


#LEAD <Returns the value of the Nth row after the current row in a partition. It returns NULL if no subsequent row exists.>
#################################################
SELECT 
	emp_no,
    department,
    salary,
    LEAD(salary) over(order by salary desc) as lead_salary
from EMP.employees;


#NTile <Distributes the rows for each window partition into a specified number of ranked groups.>
#################################################
SELECT emp_no,
    department,
    salary,   
NTile(5) OVER() AS N_tiling   
FROM employees; 



