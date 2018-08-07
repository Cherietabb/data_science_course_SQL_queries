/*
What is the lifetime average amount spent in terms of total_amt_usd for only the companies that spent more than the average of all orders.
*/

SELECT AVG(avg_amt)
FROM (
       SELECT
         o.account_id,
         AVG(o.total_amt_usd) avg_amt
       FROM orders o
       GROUP BY 1
       HAVING AVG(o.total_amt_usd) > (
         SELECT AVG(o.total_amt_usd) avg_all
         FROM orders o
           JOIN accounts a
             ON a.id = o.account_id)) temp_table;