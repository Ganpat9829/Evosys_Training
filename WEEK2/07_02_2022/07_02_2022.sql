Select * from cust;
select * from movie;
select * from invoice;

-- ################################### JOIN ###################################################
   #                                                                                          #
   #                     -- movie -- (MV_no) -- invoice -- (Cust_id) -- cust                  #  
   #                                                                                          #  
-- ################################### JOIN ###################################################


-- Get the fname,issue date and return date for all the customer.
        SELECT 
                c.fname,i.issue_date,i.return_date
        FROM 
               cust c JOIN invoice i on c.cust_id=i.cust_id;
               
-- Get the phone number and title of movie of all the customer who buy  the ticket greater then equal to 180
        SELECT 
              c.fname,m.title,c.phone_no
        FROM 
             invoice i JOIN  cust c  ON i.cust_id=c.cust_id
             JOIN 
                    movie m ON m.mv_no=i.mv_no;
        WHERE m.price>180
        ORDER BY 
                c.fname;

-- Get the  phone number and full name   of all the customer who buy  the ticket greater then equal to 180
        SELECT 
              concat(c.fname ,(concat(' ',c.lname))) as total_name,m.title,c.phone_no
        FROM 
             invoice i JOIN  cust c  ON i.cust_id=c.cust_id
             JOIN 
                    movie m ON m.mv_no=i.mv_no
        WHERE m.price>180
        ORDER BY
                total_name;
                
-- ################################### Correlated Subquery   ##################################
-- #                                                                                          #
-- #                     -- movie -- (MV_no) -- invoice -- (Cust_id) -- cust                  #  
-- #                                                                                          #  
-- ################################### Correlated Subquery   ##################################
                
--  Returns the cheapest movie from the movie.
        SELECT
                title,
                type,
                star,price
        FROM
                movie
        WHERE
                price =(
                                SELECT
                                        MIN( price )
                                FROM
                                        movie
                            );
                
--  finds all movie whose price is above and equal average for their category.
        SELECT
                title,
                type,
                star,price
        FROM
                movie m
        WHERE
                price >=(
                                SELECT
                                        AVG( price )
                                FROM
                                        movie
                                WHERE
                                        mv_no = m.mv_no
                            )
        ORDER BY
                price;
                
-- ################################### ANY  ###################################################
   #                                                                                          #
   #                     -- movie -- (MV_no) -- invoice -- (Cust_id) -- cust                  #  
   #                                                                                          #  
-- ################################### ANY  ###################################################

-- finds ANY movie title  whose prices are less than the lowest price in the average price.
        SELECT
            title,
            price
        FROM
            movie
        WHERE
            price< ANY(
                SELECT
                    AVG( price )
                FROM
                    movie
                GROUP BY
                    type
            )
        ORDER BY
            price DESC;
            
-- ################################### ALL  ###################################################
   #                                                                                          #
   #                     -- movie -- (MV_no) -- invoice -- (Cust_id) -- cust                  #  
   #                                                                                          #  
-- ################################### ALL  ###################################################

-- finds ALL movie title  whose prices are less than equal to the lowest price in the average price.
        SELECT
            title,
            price
        FROM
            movie
        WHERE
            price<= ALL(
                SELECT
                    MIN( price )
                FROM
                    movie
                GROUP BY
                    type
            )
        ORDER BY
            price DESC;
            
-- finds ALL movie title  whose prices are greater than equal to the lowest price in the average price.
        SELECT
            title,
            price
        FROM
            movie
        WHERE
            price>= ALL(
                SELECT
                    MIN( price )
                FROM
                    movie
                GROUP BY
                    type
            )
        ORDER BY
            price DESC;

