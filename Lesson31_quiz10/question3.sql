/*
For the account that purchased the most (in total over their lifetime as a customer) standard_qty paper, how many accounts still had more in total purchases?
*/
SELECT count(*)
FROM (
       SELECT a.name
       FROM orders o
         JOIN accounts a
           ON a.id = o.account_id
       GROUP BY a.name
       HAVING sum(o.total) > (
         SELECT total
         FROM (
                SELECT
                  a.name              act_name,
                  SUM(o.standard_qty) tot_std,
                  SUM(o.total)        total
                FROM accounts a
                  JOIN orders o
                    ON o.account_id = a.id
                GROUP BY 1
                ORDER BY 2 DESC
                LIMIT 1) inner_tab)
     ) counter_tab;

