                                               --######################
                                               --ROW_NUMBER
                                                --###################### 
                                                
SELECT 
        ROW_NUMBER() OVER( ORDER BY list_price DESC) row_num, 
        product_name,list_price
FROM 
    products;                                              
                                                
---------------------------

WITH cte_products AS (
                        SELECT 
                            row_number() OVER( ORDER BY list_price DESC ) row_num, 
                            product_name,list_price
                        FROM 
                            products
                    )
                SELECT * 
                FROM 
                    cte_products
                WHERE 
                    row_num > 30 and row_num <= 40;                                               

                                                --######################
                                                --DENSE_RANK
                                                --######################

SELECT 
    product_name, list_price, RANK() OVER(ORDER BY list_price) 
FROM 
    products; 
--------------------

WITH cte_products AS(  
                        SELECT 
                                product_name,list_price,RANK() OVER(ORDER BY list_price) my_rank
                        FROM 
                                products
                    )
            SELECT * 
            FROM 
                cte_products
            WHERE 
                my_rank <= 10;
                
--------------------

SELECT 
        DENSE_RANK (31) WITHIN GROUP (ORDER BY quantity)rank_asc ,
        DENSE_RANK (31) WITHIN GROUP (ORDER BY quantity DESC)rank_desc
FROM 
        order_items;

----------

SELECT 
    employee_id,first_name,hiredate,job_title,
    DENSE_RANK() OVER(PARTITION BY TO_CHAR(hiredate,'mm') ORDER BY hiredate )
FROM 
    employees;
    
------------


                                                --######################
                                                --CREATE TABLE AS
                                                --######################

CREATE TABLE emp1
AS (SELECT * 
    FROM 
        employees 
    WHERE 
        job_title='Sales Representative' );

------------

SELECT 
    employee_id,first_name,job_title 
FROM 
    emp1;
    
                                                --#####################
                                                --SUB QUERY
                                                --#####################
SELECT
    product_id,product_name,list_price
FROM
    products
WHERE
    list_price = (
        SELECT
            MAX( list_price )
        FROM
            products
    );
    
--------------------- 

SELECT
    product_id,product_name,list_price
FROM
    products
WHERE
    list_price = 8867.99;
    
------------------------

SELECT 
    employee_id,first_name,hiredate
FROM
    employees
WHERE
    hiredate LIKE '17%';
    
------------------------

SELECT 
    product_id,product_name,description
FROM 
    products
WHERE
    product_id IN(SELECT product_id FROM order_items WHERE unit_price=64099);

---------------------

SELECT 
    product_id,product_name,description
FROM 
    products
WHERE
    product_id IN(SELECT product_id FROM order_items WHERE item_id=6);