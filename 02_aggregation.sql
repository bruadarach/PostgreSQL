/*

1. SELECT COUNT()
    - he number of rows in each table
    - all columns welcome! 
    - NOT consider NULL values!! 
    
        SELECT COUNT(accounts.id)
        FROM accounts;


2. SELECT SUM()
    - ONLY for colums that have quantitative data!
    - SUM treats NULL as 0
    - Result : one row of aggregation only


3. SELECT MAX()
    - all types of column values
    - don't count null values
    - Result : the lowest number, earliest date, or non-numerical value as early in the alphabet as possible


4. SELECT MIN()
    - all types of column values
    - don't count null values
    - Result : the highest number, the latest date, or the non-numerical value closest alphabetically to “Z.”


5. SELECT AVG()
    - ignores NULL!
    - If you want to count NULL as 0, you need to use SUM / COUNT 
    - However, this is probably not a good idea if the NULL values truly just represent unknown values for a cell.

        SELECT AVG(standard_qty) mean_standard, AVG(gloss_qty) mean_gloss, 
                AVG(poster_qty) mean_poster, AVG(standard_amt_usd) mean_standard_usd, 
                AVG(gloss_amt_usd) mean_gloss_usd, AVG(poster_amt_usd) mean_poster_usd
        FROM orders;


    C.f) How to find a 'MEDIAN'?

        SELECT *
        FROM (SELECT total_amt_usd
            FROM orders
            ORDER BY total_amt_usd
            LIMIT 3457) AS Table1
        ORDER BY total_amt_usd DESC
        LIMIT 2;


6. SELECT DISTINCT : unique value in a column only

        SELECT COUNT(DISTINCT birthdate)
        FROM people;

        (OK)
            SELECT DISTINCT column1, column2, column3
            FROM table1;

        (NOT Okay)
            SELECT DISTINCT column1, DISTINCT column2, DISTINCT column3
            FROM table1;    


7. GROUP BY 
    - sort unique index of columns
    - position : WHERE - GROUP BY - ORER BY
    - *Any column in the SELECT statement that is not within an aggregator must be in the GROUP BY clause.

        SELECT s.name, w.channel, COUNT(*) num_events
        FROM accounts a
        JOIN web_events w
        ON a.id = w.account_id
        JOIN sales_reps s
        ON s.id = a.sales_rep_id
        GROUP BY s.name, w.channel
        ORDER BY num_events DESC;


8. HAVING
    - HAVING : filter based on the result of an aggregate function


9. DATE functions
    - SELECT DATE_TRUNC()

        SELECT DATE_TRUNC('month', o.occurred_at) ord_date, SUM(o.gloss_amt_usd) tot_spent
        FROM orders o 
        JOIN accounts a
        ON a.id = o.account_id
        WHERE a.name = 'Walmart'
        GROUP BY 1
        ORDER BY 2 DESC
        LIMIT 1;

    - SELECT DATE_PART()

        SELECT DATE_PART('month', occurred_at) ord_month, SUM(total_amt_usd) total_spent
        FROM orders
        WHERE occurred_at BETWEEN '2014-01-01' AND '2017-01-01'
        GROUP BY 1
        ORDER BY 2 DESC; 

    - SELECT DATAE_PART('dow')
        : 'DOW'(='week') is The day of the week as Sunday (0) to Saturday (6)
    
        SELECT DATE_PART('dow', occured_at) AS day_of_week, account_id, occurred_at, total
        FROM orders;


10. CASE
    : SELECT <column1> CASE WHEN (logic_1) THEN 'value_1'
                            WHEN (logic_2) THEN 'value_2'
                            ELSE 'value_3' END AS <column_name>


            SELECT s.name, COUNT(*), SUM(o.total_amt_usd) total_spent, 
                CASE WHEN COUNT(*) > 200 OR SUM(o.total_amt_usd) > 750000 THEN 'top'
                WHEN COUNT(*) > 150 OR SUM(o.total_amt_usd) > 500000 THEN 'middle'
                ELSE 'low' END AS sales_rep_level
            FROM orders o
            JOIN accounts a
            ON o.account_id = a.id 
            JOIN sales_reps s
            ON s.id = a.sales_rep_id
            GROUP BY s.name
            ORDER BY 3 DESC;

*/