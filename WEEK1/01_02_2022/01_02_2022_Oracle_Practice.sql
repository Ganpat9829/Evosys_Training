                                        --##############################
                                        --SELECT 
                                        --##############################
SELECT * 
FROM
    locations;
    
SELECT 
    location_id,address,postal_code,city,state,country_id
FROM
    locations;

                                       --##############################
                                        --SELECT DISTINCT
                                        --##############################

SELECT DISTINCT
    state
FROM
    locations;
    
-----------------

SELECT DISTINCT
    country_id,country_name
FROM
    countries;
    
                                        --############################################
                                        --WHERE clause
                                        --############################################

SELECT 
        location_id,address, city
FROM 
        locations
WHERE
        state IS NULL;
----------------------
SELECT 
    product_name,description,list_price
FROM
    products
WHERE product_name='Kingston';

-------------------

SELECT 
    product_name,description,list_price
FROM
    products
WHERE list_price<2000;

----------------------

SELECT 
    product_name,description,list_price,category_id
FROM
    products
WHERE list_price<2000 AND category_id=5 ;

--------------------

SELECT 
    product_name,description,list_price,category_id
FROM
    products
WHERE list_price BETWEEN 600 AND 680;

-------------------------

SELECT 
    product_name,description,list_price,category_id
FROM
    products
WHERE category_id IN(1,2);

---------------------------

SELECT 
    product_name,description,list_price,category_id
FROM
    products
WHERE category_id=2 OR category_id=3;

----------------------------

SELECT 
    product_name,description,list_price,category_id
FROM
    products
WHERE product_name LIKE 'A%';

----------------------------

SELECT 
    product_name,description,list_price,category_id
FROM
    products
WHERE product_name LIKE '%AM%';

------------------------------

SELECT 
    product_name,description,list_price,category_id
FROM
    products
WHERE product_name LIKE 'A_D%';

------------------------

SELECT 
    customer_id,name,website
FROM
    customers
WHERE website IS NULL;

--------------------------

SELECT 
    customer_id,name,website
FROM
    customers
WHERE website IS NOT NULL;

---------------------

SELECT 
    customer_id,name,website,credit_limit
FROM
    customers
WHERE credit_limit>=1500;

---------------------

SELECT 
    customer_id,name,website,credit_limit
FROM
    customers
WHERE credit_limit NOT BETWEEN 1500 AND 8000;

                                        --####################################
                                        --AS aliases
                                        --####################################

SELECT 
    product_name AS pname,description
FROM
    products;

-----------------------------

SELECT 
    product_name pname,description
FROM
    products;

                                        --#################################
                                        --AGGREGATE functions
                                        --#################################

SELECT 
    COUNT(order_id),SUM(quantity),AVG(unit_price),MAX(unit_price),MIN(unit_price)
FROM
    order_items;
                                        --##################################
                                        --ORDER BY clause
                                        --##################################
SELECT 
    location_id,address,postal_code,city,state,country_id
FROM
    locations
ORDER BY
    postal_code;
    

SELECT 
    location_id,address,postal_code,city,state,country_id
FROM
    locations
WHERE
    country_id IN('IT','UK','JP')
ORDER BY
    city, state DESC;
    

SELECT 
    location_id,address,postal_code,city,state,country_id
FROM
    locations
WHERE
    country_id LIKE('J%')
ORDER BY
    city, state DESC;    
                                        --##################################
                                        --GROUP BY clause
                                        --##################################

SELECT 
    job_title,COUNT(employee_id)
FROM
    employees
GROUP BY 
    job_title;

-----------------------

SELECT 
    job_title,COUNT(employee_id)
FROM
    employees
GROUP BY 
    job_title
HAVING
    COUNT(employee_id)>10;

                                        --##################################
                                        --nvl function
                                        --########################

SELECT 
    order_id,quantity,unit_price,quantity+nvl(unit_price,100)
FROM
    order_items;