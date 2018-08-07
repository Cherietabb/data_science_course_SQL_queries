/*
Which account (by name) placed the earliest order? Your solution should have the account name and the date of the order.
*/

select
  a.name,
  o.occurred_at
from orders o
  join accounts a
    on o.account_id = a.id
ORDER BY occurred_at
limit 1