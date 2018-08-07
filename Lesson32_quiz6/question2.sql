/*
Now see if you can do the same thing for every rep name in the sales_reps table. Again provide first and last name columns.
*/

SELECT
  left(name, position(' ' IN name) - 1) AS first_name,
  right(name, LENGTH(name) - STRPOS(name, ' ')) AS last_name
FROM sales_reps