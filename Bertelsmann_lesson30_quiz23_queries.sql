select
  sr.id    sales_id,
  sr.name  sales_rep,
  count(*) accounts
from sales_reps sr
  join accounts a
    on sr.id = a.sales_rep_id
group by
  sales_id, sales_rep
having count(*) > 5
order by sales_id


select
  a.name   account,
  count(*) num_orders
from accounts a
  join orders o
    on a.id = o.account_id
group by a.name
having count(*) > 20
order by num_orders


select
  a.name   account,
  count(*) num_orders
from accounts a
  join orders o
    on a.id = o.account_id
group by a.name
having count(*) > 20
order by num_orders desc


select
  a.name               account,
  sum(o.total_amt_usd) total_spent
from accounts a
  join orders o
    on a.id = o.account_id
group by a.name
having sum(o.total) > 30000
order by total_spent desc


select
  a.name               account,
  sum(o.total_amt_usd) total_spent
from accounts a
  join orders o
    on a.id = o.account_id
group by a.name
having sum(o.total) < 1000
order by total_spent desc


select
  a.name               account,
  sum(o.total_amt_usd) total_spent
from accounts a
  join orders o
    on a.id = o.account_id
group by a.name
order by total_spent desc
limit 1


select
  a.name                account,
  we.channel,
  count(we.occurred_at) contacted
from accounts a
  join web_events we
    on a.id = we.account_id
where we.channel = 'facebook'
group by a.name, we.channel
having count(we.occurred_at) > 6
order by contacted desc


select
  a.name                account,
  we.channel,
  count(we.occurred_at) contacted
from accounts a
  join web_events we
    on a.id = we.account_id
where we.channel = 'facebook'
group by a.name, we.channel
order by contacted desc
limit 1


select
  a.name                account,
  we.channel,
  count(we.occurred_at) contacted
from accounts a
  join web_events we
    on a.id = we.account_id
group by a.name, we.channel
order by contacted desc
limit 20
