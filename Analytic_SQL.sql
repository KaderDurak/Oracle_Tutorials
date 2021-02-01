select department_id, employee_id,first_name, salary, sum(salary) over (partition  by department_id order by employee_id rows between 1 preceding and 1 following) as cumul from hr.employees order by department_id

select department_id, employee_id,first_name, salary, avg(salary) over (partition  by department_id order by employee_id rows between unbounded  preceding and 1 following) as cumul from hr.employees order by department_id

select department_id, employee_id, salary, avg(salary) over () as ortalama from hr.employees

select department_id, employee_id, salary, avg(salary) over (partition by department_id) as ortalama from hr.employees order by department_id

select first_name, department_id, first_value(salary) over (partition by department_id order by employee_id) as deptsal from hr.employees order by department_id

select first_name, department_id, first_value(salary) over (partition by department_id order by employee_id) as deptsal from hr.employees order by department_id

/* null values will be  at last on the table*/
select first_name, department_id, commission_pct, first_value(commission_pct ignore nulls) over (partition by department_id order by employee_id) as deptsal from hr.employees order by commission_pct

/* range between : you can use for date (ex. range between 180 ) 180 day */
/* rows between: you can use for row (ex rows between 1  preceding and 1 following) 1 row from before row + 1 row after current row */ 

select department_id, employee_id, hire_date, salary, avg(salary) over (partition by department_id order by hire_date range between 180 preceding and 180 following) as ortalama from hr.employees order by department_id

select first_name, department_id, salary, avg(salary) over (partition by department_id order by department_id) as deptsal
from hr.employees order by department_id;

/* 1 row before (you can change how many row -> (salary, 1)) */
select employee_id,first_name, salary, LAG (salary, 1) over (order by salary) as LAG1
from hr.employees;

/*1 row after (you can change how many row -> (salary, 1))*/
select employee_id,first_name, salary, LEAD (salary, 1) over (order by salary) as LEAD1
from hr.employees;

/*  LISTAGG (make column horizontal) */
select department_id, LISTAGG (first_name, ',') WITHIN GROUP (order by department_id) as newlist 
from hr.employees group by department_id

select department_id, LISTAGG (first_name, ',') WITHIN GROUP (order by department_id) as newlist 
from hr.employees group by department_id


/* RANK () can do where did you partitioned (1 ,2, 3  etc.) If we have multiple person, product.. in 2.nd rank  RANK() will do 1, 2, 2, 4 it will pass 3 */
select department_id, last_name, salary, RANK() OVER (partition by department_id order by salary desc) "Rank" 
from hr. employees where department_id =60 order by  department_id,"Rank", salary

/* DENSE_RANK can show if we have multiple value in n.th row (1,2,2,3,4,4,5) it wont pass the next number) */
select department_id, last_name, salary, DENSE_RANK() OVER (partition by department_id order by salary desc) "D_Rank" 
from hr. employees where department_id =60 order by  department_id,"D_Rank", salary

/* PERCENT_RANK() (rank of row in this partition -1) / (number of rows in the partition -1)
example (last_name = ernst (4-1)/(5-1) =0,75  */

select department_id, last_name, salary, PERCENT_RANK() OVER (partition by department_id order by salary) "P_Rank" 
from hr. employees where department_id =60 order by  department_id,"P_Rank", salary

select employee_id, first_name, job_id, hire_date, salary, rank() over (partition by job_id order by hire_date) as rnk from hr.employees order by job_id, rnk;

