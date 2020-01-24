/*
c.f) SQL is not case sensitive

1. FROM

2. SELECT
    - Derivd Column with arithmetic operators (+,-,*,/) : a manipulation of the existing columns
        
        SELECT id, (standard_amt_usd/total_amt_usd)*100 AS std_percent, total_amt_usd
        FROM orders
        LIMIT 10;

3. LIMIT 

4. ORDER BY (DESC)

5. WHERE with numeric data (>, <, >=, <=, =, !=)
   WHERE with non-numeric data (column name = ' ')
    - LIKE, NOT LIKE : for cases when you might not know exactly what you are looking for.

        SELECT name
        FROM accounts
        WHERE name LIKE '%one%'; 

    - IN, NOT IN : for more than one condition

        SELECT name, primary_poc, sales_rep_id
        FROM accounts
        WHERE name IN ('Walmart', 'Target', 'Macy"s'); 

    - NOT (NOT LIKE / NOT IN)

    - AND (column name = $$ AND column name = &&)

    - BETWEEN
    You will notice that using BETWEEN is tricky for dates! 
    While BETWEEN is generally inclusive of endpoints, 
    it assumes the time is at 00:00:00 (i.e. midnight) for dates. 
    
        SELECT *
        FROM web_events
        WHERE channel IN ('organic', 'adwords') AND occurred_at BETWEEN '2016-01-01' AND '2017-01-01'
        ORDER BY occurred_at DESC;

    - OR

    - IS NULL (column name IS NULL)
        SELECT COUNT(*)
        FROM people
        WHERE birthdate IS NULL;

*/