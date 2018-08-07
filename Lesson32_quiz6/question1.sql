-- Use the accounts table to create first and last name columns that hold the first and last names for the primary_poc.

SELECT
  left(primary_poc, position(' ' IN primary_poc) - 1)                AS first_name,
  right(primary_poc, LENGTH(primary_poc) - STRPOS(primary_poc, ' ')) AS last_name
FROM accounts