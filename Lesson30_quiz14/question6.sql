/*
What was the smallest order placed by each account in terms of total usd. Provide only two columns - the account name and the total usd. Order from smallest dollar amounts to largest.
*/

select
  a.name,
  min(o.total_amt_usd) total_usd
from accounts a
  join orders o
    on a.id = o.account_id
group by
  a.name
order by total_usd
