                                                --#########################
                                                --JOIN/INNER JOIN BY Using
                                                --#########################

SELECT
  order_id,customer_id,status,salesman_id,order_date,unit_price
FROM
  orders
INNER JOIN 
    order_items USING( order_id )
ORDER BY
  order_date DESC;
  
-------------------------
SELECT
	name AS customer_name,order_id,order_date,item_id,product_name,quantity,unit_price
FROM
	orders
INNER JOIN order_items USING(order_id)
INNER JOIN customers USING(customer_id)
INNER JOIN products USING(product_id)
ORDER BY
	order_date DESC,order_id DESC,item_id ASC;
-------------------------
SELECT 
    c.customer_id,c.name,o.order_date,o.status
FROM
    customers c
JOIN
    orders o
ON
    c.customer_id=o.customer_id
ORDER BY
    order_date;
    
 -----

SELECT 
    p.product_id,p.product_name,p.description,o.quantity order_quantity,i.quantity inventories_quantity
FROM
    products p
JOIN
    order_items o
ON
    p.product_id=o.product_id
JOIN
    inventories i
ON
    p.product_id=i.product_id
ORDER BY
    p.product_id;
    
                                            --##########################
                                            --RIGHT JOIN USING On
                                            --##########################

SELECT 
    c.customer_id,c.name,o.order_date,o.status
FROM
    customers c
RIGHT JOIN
    orders o
ON
    c.customer_id=o.customer_id
ORDER BY
    order_date;

-----------


SELECT 
    p.product_id,p.product_name,p.description,o.quantity order_quantity,i.quantity inventories_quantity
FROM
    products p
RIGHT JOIN
    order_items o
ON
    p.product_id=o.product_id
RIGHT JOIN
    inventories i
ON
    p.product_id=i.product_id
ORDER BY
    p.product_id;
    
                                                --##########################
                                                --LEFT JOIN
                                                --##########################

SELECT 
    c.customer_id,c.name,o.order_date,o.status
FROM
    customers c
LEFT JOIN
    orders o
ON
    c.customer_id=o.customer_id
ORDER BY
    order_date;

---------------------

SELECT 
    p.product_id,p.product_name,p.description,o.quantity order_quantity,i.quantity inventories_quantity
FROM
    products p
LEFT JOIN
    order_items o
ON
    p.product_id=o.product_id
LEFT JOIN
    inventories i
ON
    p.product_id=i.product_id
ORDER BY
    p.product_id;
      
                                                --##########################
                                                --FULL OUTER JOIN
                                                --##########################

SELECT 
    c.customer_id,c.name,o.order_date,o.status
FROM
    customers c
FULL OUTER JOIN
    orders o
ON
    c.customer_id=o.customer_id
ORDER BY
    order_date;

-----------

SELECT 
    p.product_id,p.product_name,p.description,o.quantity order_quantity,i.quantity inventories_quantity
FROM
    products p
FULL OUTER JOIN
    order_items o
ON
    p.product_id=o.product_id
LEFT JOIN
    inventories i
ON
    p.product_id=i.product_id
ORDER BY
    p.product_id;
  
    
                                            --##########################
                                            --SELF JOIN
                                            --##########################

SELECT 
    e1.employee_id,e1.first_name,e1.email,e2.manager_id
FROM
    employees e1
JOIN 
    employees e2
ON
    e1.employee_id=e2.manager_id


    
                                            --##########################
                                            --CROSS JOIN
                                            --##########################

SELECT 
    c.customer_id,c.name,o.order_date,o.status
FROM
    customers c
 CROSS JOIN
    orders o
ORDER BY
    order_date;
    
-------------

SELECT 
    p.product_id,p.product_name,p.description,o.quantity order_quantity,i.quantity inventories_quantity
FROM
    products p
CROSS JOIN
    order_items o, inventories i
ORDER BY
    p.product_id;
  
                                        --#######################
                                        --ANY
                                        --#######################

SELECT
    product_name,
    list_price
FROM
    products
WHERE
    list_price > ANY(
        2200,
        2259.99,
        2269.99
    )
    AND category_id = 1
ORDER BY
    list_price DESC;
    
                                            --#####################
                                            --ALL
                                            --#####################

SELECT
    product_name,
    list_price
FROM
    products
WHERE
    list_price <= ALL(
        977.99,
        1000,
        2200
    )
    AND category_id = 1
ORDER BY
    list_price DESC;
    
---------------

SELECT
    product_name,
    list_price
FROM
    products
WHERE
    list_price >= ALL(
        1000,
        1500,
        2200
    )
    AND category_id = 1
    
                                                --#####################
                                                --EXISTS
                                                --#####################
                                                
SELECT
    name
FROM
    customers c
WHERE
    EXISTS (
        SELECT
            1
        FROM
            orders
        WHERE
            customer_id = c.customer_id
    )
ORDER BY
    name;
    
----------------------------
CREATE TABLE customers_archive 
AS
        SELECT * 
        FROM
            customers
        WHERE
            NOT EXISTS (
                            SELECT
                                NULL
                            FROM
                                orders
                            WHERE
                                orders.customer_id = customers.customer_id
                        );
                        


