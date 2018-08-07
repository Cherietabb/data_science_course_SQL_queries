/*
We would like to understand 3 different branches of customers based on the amount associated with their purchases. The top branch includes anyone with a Lifetime Value (total sales of all orders) greater than 200,000 usd. The second branch is between 200,000 and 100,000 usd. The lowest branch is anyone under 100,000 usd. Provide a table that includes the level associated with each account. You should provide the account name, the total sales of all orders for the customer, and the level. Order with the top spending customers listed first.
*/

SELECT
  a.name account,
  CASE WHEN sum(o.total_amt_usd) > 200000
    THEN 'top branch'
  WHEN sum(o.total_amt_usd) > 100000
    THEN 'middle branch'
  ELSE 'low branch'
  END AS branch
FROM orders o
  JOIN accounts a
    ON o.account_id = a.id
GROUP BY a.name
ORDER BY 2 DESC;

/*
We would now like to perform a similar calculation to the first, but we want to obtain the total amount spent by customers only in 2016 and 2017. Keep the same levels as in the previous question. Order with the top spending customers listed first.
*/

SELECT
  a.name account,
  CASE WHEN sum(o.total_amt_usd) > 200000
    THEN 'top branch'
  WHEN sum(o.total_amt_usd) > 100000
    THEN 'middle branch'
  ELSE 'low branch'
  END AS branch
FROM orders o
  JOIN accounts a
    ON o.account_id = a.id
WHERE o.occurred_at > '2015-12-31'
GROUP BY a.name
ORDER BY 2 DESC;

/*
We would like to identify top performing sales reps, which are sales reps associated with more than 200 orders. Create a table with the sales rep name, the total number of orders, and a column with top or not depending on if they have more than 200 orders. Place the top sales people first in your final table.
*/

SELECT
  sr.name,
  COUNT(*) total_orders,
  CASE
  WHEN count(*) > 200
    THEN 'top'
  ELSE 'low'
  END AS   rank
FROM orders o
  JOIN accounts a
    ON a.id = o.account_id
  JOIN sales_reps sr
    ON a.sales_rep_id = sr.id
GROUP BY sr.name
ORDER BY 2 DESC;

/*
The previous didn't account for the middle, nor the dollar amount associated with the sales. Management decides they want to see these characteristics represented as well. We would like to identify top performing sales reps, which are sales reps associated with more than 200 orders or more than 750000 in total sales. The middle group has any rep with more than 150 orders or 500000 in sales. Create a table with the sales rep name, the total number of orders, total sales across all orders, and a column with top, middle, or low depending on this criteria. Place the top sales people based on dollar amount of sales first in your final table.
*/
SELECT
  sr.name,
  COUNT(*)           total_orders,
  sum(total_amt_usd) total_sales,
  CASE
  WHEN count(*) > 200 OR sum(total_amt_usd) > 750000
    THEN 'top'
  WHEN count(*) > 150 OR sum(total_amt_usd) > 500000
    THEN 'middle'
  ELSE 'low'
  END AS             rank
FROM orders o
  JOIN accounts a
    ON a.id = o.account_id
  JOIN sales_reps sr
    ON a.sales_rep_id = sr.id
GROUP BY sr.name
ORDER BY 3 DESC