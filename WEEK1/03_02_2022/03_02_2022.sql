SELECT * FROM movie;
SELECT * FROM cust;
SELECT * FROM invoice;
--  movie type wise ranking

        SELECT 
            type,
            RANK() OVER (ORDER BY type) Ranking
        FROM 
            movie;
    
--  Ranking based on movie price in descending order    
  
        SELECT  
                title,type,price,
                RANK() OVER( PARTITION BY type ORDER BY price DESC) price_rank
        FROM 
                movie

--  movie type wise dense ranking

        SELECT type,
                DENSE_RANK() OVER ( ORDER BY type) Ranking
        FROM 
                movie; 

--Action type  vise on price give the row number

        SELECT 
            mv_no,title,type,star,price, ROW_NUMBER() OVER(ORDER BY price, type) Rank
        FROM 
            movie
        ORDER BY 
            price,type;
            
--Find the rank of 200 rupees over order by price	
        SELECT 
            rank(200) WITHIN GROUP(ORDER BY price)
        FROM 
            movie
        ORDER BY 
            price;
        
-- Partition by type with Dense rank

        SELECT type,
                DENSE_RANK() OVER (PARTITION BY type ORDER BY star)
        FROM 
                 movie;
   

-- Display the most expensive movie FROM each category:

        WITH Ganpat AS (
            SELECT 
                Title, 
                type,
                star,
                price,
                RANK() OVER(PARTITION BY type ORDER BY star DESC) price_rank
            FROM 
                movie
        )
        SELECT 
            title,type,price_rank
        FROM 
            Ganpat
        WHERE
            price_rank <= 1;
 





   

   
   





    


  