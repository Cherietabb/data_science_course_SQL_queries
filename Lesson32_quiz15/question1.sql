/*
Use COALESCE to fill in the accounts.id column with the account.id for the NULL value for the table.
*/

SELECT
  *,
  coalesce(a.id, a.id) AS ID
FROM accounts a
  LEFT JOIN orders o
    ON a.id = o.account_id
WHERE o.total IS NULL;

/*
Use COALESCE to fill in the orders.account_id column with the account.id for the NULL value for the table 1.
*/

SELECT
  *,
  coalesce(a.id, a.id)         AS ID,
  coalesce(o.account_id, a.id) AS modified_order_id
FROM accounts a
  LEFT JOIN orders o
    ON a.id = o.account_id
WHERE o.total IS NULL;

/*
Use COALESCE to fill in each of the qty and usd columns with 0 for the table in 1.
*/

SELECT
  coalesce(a.id, a.id) AS         ID,
  coalesce(o.account_id, a.id)    account_id,
  coalesce(o.standard_qty, 0)     standard_qty,
  coalesce(o.gloss_qty, 0)        gloss_qty,
  coalesce(o.poster_qty, 0)       poster_qty,
  coalesce(o.total, 0)            total,
  coalesce(o.standard_amt_usd, 0) standard_amt_usd,
  coalesce(o.gloss_amt_usd, 0)    gloss_amt_usd,
  coalesce(o.poster_amt_usd, 0)   poster_amt_usd,
  coalesce(o.total_amt_usd, 0)    total_amt_usd

FROM accounts a
  LEFT JOIN orders o
    ON a.id = o.account_id
WHERE o.total IS NULL;
/*
Run the query 1 with the WHERE removed and COUNT the number of ids.
*/

SELECT count(*)

FROM accounts a
  LEFT JOIN orders o
    ON a.id = o.account_id

/*
Run the query in 5, but wit the COALESCE function used in questions 2 through 4.
*/

SELECT
  COALESCE(a.id, a.id)            filled_id,
  a.name,
  a.website,
  a.lat,
  a.long,
  a.primary_poc,
  a.sales_rep_id,
  COALESCE(o.account_id, a.id)    account_id,
  o.occurred_at,
  COALESCE(o.standard_qty, 0)     standard_qty,
  COALESCE(o.gloss_qty, 0)        gloss_qty,
  COALESCE(o.poster_qty, 0)       poster_qty,
  COALESCE(o.total, 0)            total,
  COALESCE(o.standard_amt_usd, 0) standard_amt_usd,
  COALESCE(o.gloss_amt_usd, 0)    gloss_amt_usd,
  COALESCE(o.poster_amt_usd, 0)   poster_amt_usd,
  COALESCE(o.total_amt_usd, 0)    total_amt_usd
FROM accounts a
  LEFT JOIN orders o
    ON a.id = o.account_id;