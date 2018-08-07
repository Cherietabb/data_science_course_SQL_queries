/*
Find the total sales in usd for each account. You should include two columns - the total sales for each company's orders in usd and the company name.
*/

select
  a.name,
  sum(o.total_amt_usd)
from accounts a
  join orders o
    on a.id = o.account_id
group by a.name
order by a.name
