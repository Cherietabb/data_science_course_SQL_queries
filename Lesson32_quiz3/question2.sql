/*
There is much debate about how much the name (or even the first letter of a company name) matters. Use the accounts table to pull the first letter of each company name to see the distribution of company names that begin with each letter (or number).
*/

SELECT
  left(upper(name), 1) begins_with,
  count(*)      accounts
FROM accounts
GROUP BY begins_with
ORDER BY begins_with DESC