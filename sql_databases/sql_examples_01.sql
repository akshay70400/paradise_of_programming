REFERENCE:
www.w3resource.com/sql-exercises

########################### WILDCARDS #########################################
% zero/one/multiple characters
_ single character
'a%' start with a
'a%' end with a
'%a%' a is anywhere in between
LIKE '%/%%' ESCAPE '/' % anywhere in text
'a%b' start with a end with b
-- to get the Nth character match we can use '_' till that char to represent each other char
'___A%' whose fourth character is A


SELECT * 
FROM salesman 
WHERE city IN('Paris','Rome');

SELECT * 
FROM salesman 
WHERE city = 'Paris' or city = 'Rome';

SELECT * 
FROM salesman 
WHERE city NOT IN('Paris','Rome');

SELECT * 
FROM salesman 
WHERE customer_id IN('3005','3009');

WHERE commision BETWEEN 0.2 AND 0.5

-- name starts with any letter between A and L
SELECT * FROM salesman 
WHERE name NOT BETWEEN 'A%' and 'L%';

-- start with B and ends with s
WHERE cust_name LIKE 'B%s';

--begins with N and fourth letter is i
WHERE name LIKE 'N__i%';

--name contains underscore which itself is a wildcard
WHERE name LIKE '%/_%' ESCAPE '/';

--name contains forward slash which itself is a wildcard
WHERE name LIKE '%//%' ESCAPE '/';

--name not contains %
WHERE name NOT LIKE '%/%%' ESCAPE '%';

WHERE grades IS NOT NULL;

-- whose last name begins with R Ex. 'Patrick Robson'
WHERE name LIKE '% R%'


########################### QUERYING MULTIPLE TABLES ################################
Select c.cust_name, s.name, s.city
from salesman s
inner join customer c
on s.city=c.city;

-- salesman and customers from same city
SELECT c.cust_name, s.name, s.city
FROM salesman s, customer c
WHERE salesman.city = customer.city;

--find salesman working for customers
select c.cust_name, s.name
from customers, salesman
where c.salesman_id=s.salesman_id

--find salesman who generated orders for their customers but are not from same cities
SELECT ord_no, cust_name, orders.customer_id, orders.salesman_id
FROM salesman, customer, orders
WHERE customer.city <> salesman.city
AND orders.customer_id = customer.customer_id
AND orders.salesman_id = salesman.salesman_id;

select cust_name as Customer, grade as Grade
from customer, salesman, orders
where orders.salesman_id = salesman.salesman_id
and customer.grade is not NULL
and salesman.city is not NULL;

############################### AGGREGATION ###################################
select SUM(purchase_amt)
select AVG(purchase_amt)
select distinct(poeple)
select COUNT(people)
select count(distinct(people))
select min(amount)
select max(amount)

############################### FILTERING, SORTING, GROUPING ###################################
-- WHERE age=45
-- WHERE id IN (14, 56, 48)
-- WHERE name NOT LIKE '%da%'
-- WHERE name IN (select name from ...)
-- WHERE c.id = s.id

-- notice: in usecase of groupby, keyword like 'for each' is mostly used
-- ex. 'for each country', 'for each deparment'
-- Group by 1 means to group by the first column and group by 1,2 means to group by the first and second column.

select city, max(amount)
from customers
group by city

SELECT customer_id,ord_date,MAX(purch_amt) 
FROM orders 
GROUP BY customer_id,ord_date;

-- determine the highest purchase amount made by each salesperson on '2012-08-17'
SELECT salesman_id,MAX(purch_amt) 
FROM orders 
WHERE ord_date = '2012-08-17' 
GROUP BY salesman_id;

-- highest order (purchase) amount by each customer on a particular order date. 
-- Filter the result by highest order (purchase) amount above 2000
SELECT customer_id,ord_date,MAX(purch_amt) 
FROM orders 
GROUP BY customer_id,ord_date 
HAVING MAX(purch_amt)>2000.00;

-- both where and having giving same result in example below
SELECT customer_id,MAX(purch_amt) FROM orders 
WHERE customer_id BETWEEN 3002 and 3007 
GROUP BY customer_id
-- HAVING customer_id BETWEEN 3002 and 3007 

-- exaple of using where and hvaing both in a groupby query
SELECT customer_id, MAX(purch_amt) as max_amt
FROM orders 
WHERE customer_id BETWEEN 3002 and 3007 
GROUP BY customer_id 
HAVING max_amt>1000;

>>>>>>>>>>>>>>>
                ID   COMPANY_ID   EMPLOYEE
                1    1            Anna
                2    1            Bill
                3    2            Carol
                4    2            Dave
SELECT company_id, string_agg(employee, ', ')
FROM mytable
GROUP BY company_id;
                COMPANY_ID   EMPLOYEE
                1            Anna, Bill
                2            Carol, Dave
                

SELECT *
FROM  departments
WHERE department_name = 'Marketing';

SELECT first_name || ' ' || last_name as Full_Name, department_id
FROM employees
WHERE first_name NOT LIKE '%M%'
ORDER BY department_id;

SELECT first_name, last_name, email, salary, manager_id
FROM employees
WHERE manager_id IN (120 , 103 , 145);

SELECT *
FROM employees
WHERE first_name LIKE '%D%'
    OR first_name LIKE '%S%'
    OR first_name LIKE '%N%'
ORDER BY salary DESC;

select job_id
from job_history
where (start_date - end_date)>300
group by department_id
having count(employee_id)>2;

--  to find each job ids where two or more employees worked for more than 300 days
select job_id
from job_history
where (end_date- start_date)>300
group by job_id
having count(employee_id)>=2;


############################### JOINING TABLES  #################################

-- finding salesman and customers from same city
        SELECT salesman.name AS "Salesman", customer.cust_name, customer.city 
        FROM salesman, customer 
        WHERE salesman.city=customer.city;

        SELECT  a.ord_no,a.purch_amt, b.cust_name,b.city 
        FROM orders a,customer b 
        WHERE a.customer_id=b.customer_id 
        AND a.purch_amt BETWEEN 500 AND 2000;

-- find the salesperson(s) and the customer(s) he represents
        SELECT a.cust_name AS "Customer Name", a.city, b.name AS "Salesman", b.commission 
        FROM customer a 
        INNER JOIN salesman b 
        ON a.salesman_id=b.salesman_id;

-- find salespeople who received commissions of more than 12 percent
        SELECT a.cust_name AS "Customer Name", a.city, b.name AS "Salesman", b.commission 
        FROM customer a 
        INNER JOIN salesman b 
            ON a.salesman_id=b.salesman_id 
        WHERE b.commission>.12;
        --------- OR ---------
        SELECT a.cust_name AS "Customer Name", a.city, b.name AS "Salesman", b.commission 
        FROM customer a, salesman b
        WHERE a.salesman_id=b.salesman_id
        and b.commission>.12    
        
-- get all details of evry order
        SELECT  a.ord_no,a.ord_date,a.purch_amt,
                b.cust_name AS "Customer Name", b.grade, 
                c.name AS "Salesman", c.commission 
        FROM orders a 
        INNER JOIN customer b 
            ON a.customer_id=b.customer_id 
        INNER JOIN salesman c 
            ON a.salesman_id=c.salesman_id;
            
-- to display all customers info and sort also
        SELECT  a.cust_name,a.city,a.grade, 
                b.name AS "Salesman",b.city 
        FROM customer a 
        LEFT JOIN salesman b 
            ON a.salesman_id=b.salesman_id 
        order by a.customer_id desc;

--  find those customers with a grade less than 300, as well as other infor about salesman
        SELECT a.cust_name,a.city,a.grade, b.name AS "Salesman", b.city 
        FROM customer a
        -- WHERE a.grade<300 --thwors error, better to use filter on resultant joined table 
        LEFT OUTER JOIN salesman b 
            ON a.salesman_id=b.salesman_id 
        WHERE a.grade<300 
        ORDER BY a.customer_id;
    
-- to determine whether any of the existing customers have placed an order or not
        select c.customer_name, c.city, o.order_number, o.order_date, o.order_amount
        from customers c
        inner join orders o
            on c.customer_id = o.customer_id
        order by o.order_date

-- to combine each row of the salesman table with each row of the customer table.
        -- Salesman will appear for all customer and vice versa
        -- Cartesian product between salesperson and customer
        -- no need to mention on key
        SELECT * 
        FROM salesman a 
        CROSS JOIN customer b;

-- cross join with condition
-- Customers from a different city than the salesmen
        SELECT * 
        FROM salesman a 
        CROSS JOIN customer b 
        WHERE a.city IS NOT NULL 
        AND b.grade IS NOT NULL 
        AND  a.city<>b.city;

-- select all rows from both participating tables as long as there is a match between pro_com and com_id.
        SELECT *
        FROM item_mast 
        INNER JOIN company_mast  --LEFT join is also giving the same result here
        ON item_mast.pro_com= company_mast.com_id;
        
-- to find avg price of items of each company
        SELECT AVG(pro_price), company_mast.com_name
        FROM item_mast INNER 
        JOIN company_mast
            ON item_mast.pro_com= company_mast.com_id
        GROUP BY company_mast.com_name; -- this group by operation happens on resultant joined table

-- to find the most expensive product of each company.
        SELECT MAX(A.pro_price), F.com_name 
        FROM item_mast A 
        LEFT JOIN company_mast F 
        ON A.pro_com = F.com_id
        GROUP BY F.com_name
        HAVING A.pro_price>200;

############################### UNION  ###############################
-- Display all salesmen and customer located in London
        SELECT salesman_id "ID", name, 'Salesman'
        FROM salesman
        WHERE city='London'
        UNION
            (SELECT customer_id "ID", cust_name, 'Customer'
            FROM customer
            WHERE city='London')

-- find all distinct salespeople and their cities
        SELECT salesman_id, city
        FROM customer
        UNION
        (SELECT salesman_id, city
        FROM salesman)

-- to find all those salespeople and customers who are involved in the database(inventory management system)
        SELECT salesman_id, customer_id
        FROM customer
        UNION 
        (SELECT salesman_id, customer_id
        FROM orders)

--  to find those salespersons and customers who have placed more than one order.
SELECT customer_id as “ID”,  cust_name as “NAME”
FROM customer a
WHERE 1<
    (SELECT COUNT (*)
       FROM orders b
       WHERE a.customer_id = b.customer_id)
UNION
(SELECT salesman_idas “ID”,   nameas “NAME”
FROM salesman a
WHERE 1 <
    (SELECT COUNT (*)
     FROM orders b
    WHERE  a.salesman_id = b.salesman_id))
ORDER BY 2
############################### SUBQUERIES  ###############################



############################### INTERVIEW EXAMPLES ###############################

-- to get second highest salary
        -- using LIMIT
        SELECT * 
        FROM jobs
        order by max_salary desc
        limit 1 offset 1
        
        -- using rank function
        select *
        from (
            select *, 
                    ROW_NUMBER() over(order by total desc) AS rnk
            from Invoice i
        ) a
        where rnk=2;
        
        -- using subquery
        


###############################     ###############################


###############################     ###############################


###############################     ###############################