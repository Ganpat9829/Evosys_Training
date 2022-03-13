                                         --##########################
                                         --Date query
                                         --##########################

SELECT 
        employee_id,first_name,hiredate  
FROM
        employees
WHERE
        hiredate BETWEEN '17-MAY-16' AND '18-DEC-16';

-------------

SELECT employee_id,first_name,hiredate
FROM employees
WHERE hiredate='17-06-16';

-----------

SELECT employee_id,first_name,hiredate
FROM employees
WHERE hiredate<'17-06-16'
ORDER BY hiredate;

----------------

SELECT employee_id,first_name,hiredate
FROM employees
WHERE hiredate=TO_DATE('17-06-16','dd-mm-yy');

                                        --#############################
                                        --TO_CHAR
                                        --############################

SELECT employee_id,first_name,hiredate
FROM employees
WHERE TO_CHAR(hiredate,'mm')='06'
ORDER BY hiredate;

-------------------------

SELECT employee_id,first_name,hiredate
FROM employees
WHERE TO_CHAR(hiredate,'yyyy')='2016'
ORDER BY hiredate;

--------------------

SELECT employee_id,first_name,hiredate
FROM employees
WHERE TO_CHAR(hiredate,'mm:yyyy')='06:2016'
ORDER BY hiredate;

-----------------

SELECT employee_id,first_name,hiredate
FROM employees
WHERE TO_CHAR(hiredate,'mm') IN (06,01)
ORDER BY hiredate;

----------------

SELECT employee_id,first_name,TO_CHAR(hiredate,'dd')
FROM employees
WHERE TO_CHAR(hiredate,'mm:yyyy')='06:2016'
ORDER BY hiredate;

---------

SELECT TO_CHAR('01120' + 1) 
FROM dual; 

---------------

SELECT TO_CHAR('1250' + 15) 
FROM dual; 

---------------

SELECT TO_CHAR('35110' + '80') 
FROM dual;                                        
                                        
                                        
                                        
                                        
                                        
                                        --########################
                                        --Text literal
                                        --########################
SELECT 
        employee_id,(first_name ||' '|| last_name) AS Full_name,email,phone
FROM 
    employees
WHERE
    job_title='Programmer';

------------

SELECT order_id,item_id,quantity,quantity+50
FROM order_items
ORDER BY order_id;

------------

SELECT order_id,item_id,quantity,quantity+'100' AS total_quantity
FROM order_items
ORDER BY order_id;


                                                --#################
                                                --DECODE
                                                --##################

SELECT employee_id,first_name,phone,job_title,
DECODE(job_title,'President','Power1'
                ,'Administration Vice President','Power2'
                ,'Programmer','Power3'
                ,'Finance Manager','Power4'
                ,'Purchasing Manager','Power5'
                ,'Stock Manager','Power6'
                ,'Sales Representative','Power7'
                ,'Marketing Manager','Power8'
                ,'No Power')
FROM employees
ORDER BY employee_id;

                                        --##########################
                                        --CASE WHEN
                                        --#########################

SELECT employee_id,first_name,phone,hiredate,job_title,
CASE 
WHEN job_title='President' THEN first_name
WHEN job_title='Administration Vice President' THEN last_name
ELSE job_title
END AS new_jobtitle
FROM employees
WHERE phone LIKE '51%'
ORDER BY employee_id;

                                        --###########################
                                        --RANK
                                        --############################

SELECT employee_id,first_name,hiredate,job_title,
RANK() OVER(PARTITION BY TO_CHAR(hiredate,'mm') ORDER BY hiredate )
FROM employees;

--------------------
SELECT employee_id,first_name,hiredate,job_title,
DENSE_RANK() OVER(PARTITION BY TO_CHAR(hiredate,'mm') ORDER BY hiredate )
FROM employees;

--------------------

SELECT 
RANK(32) WITHIN GROUP (ORDER BY quantity) 
FROM order_items;

----