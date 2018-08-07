/*
For each account, determine the average amount spent per order on each paper type. Your result should have four columns - one for the account name and one for the average amount spent on each paper type.
*/

SELECT
  a.name,
  avg(o.standard_amt_usd) standard,
  avg(o.poster_amt_usd)   poster,
  avg(o.gloss_amt_usd)    gloss
FROM accounts a
  JOIN orders o
    ON a.id = o.account_id
GROUP BY a.name;
