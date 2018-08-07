-- What is the lifetime average amount spent in terms of total_amt_usd for the top 10 total spending accounts?

WITH top_ten AS (SELECT
                   a.name             account,
                   sum(total_amt_usd) total_spent
                 FROM accounts a
                   JOIN orders o
                     ON a.id = o.account_id
                 GROUP BY account
                 ORDER BY total_spent DESC
                 LIMIT 10)
SELECT avg(top_ten.total_spent)
from top_ten
