select
  r.name  "Region",
  sr.name "Sales Rep",
  a.name  "Account"
from sales_reps sr
  join region r
    on r.id = sr.region_id
       and r.name = 'Midwest'
       and sr.name like 'S%'
  join accounts a
    on sr.id = a.sales_rep_id
order by a.name


select
  r.name  "Region",
  sr.name "Sales Rep",
  a.name  "Account"
from region r
  left join sales_reps sr
    on r.id = sr.region_id
       and r.name = 'Midwest'
       and sr.name like '%_K%'
  left join accounts a
    on sr.id = a.sales_rep_id
order by a.name

select
  r.name                             "Region",
  a.name                             "Account",
  (o.total_amt_usd / o.total + 0.01) "unit price"
from region r
  join sales_reps sr
    on r.id = sr.region_id
  join accounts a
    on sr.id = a.sales_rep_id
  join orders o
    on o.account_id = a.id
       and standard_qty > 100
order by a.name


select
  r.name                             "Region",
  a.name                             "Account",
  (o.total_amt_usd / o.total + 0.01) "unit price"
from region r
  join sales_reps sr
    on r.id = sr.region_id
  join accounts a
    on sr.id = a.sales_rep_id
  join orders o
    on o.account_id = a.id
       and standard_qty > 100
       and poster_qty > 50
order by "unit price" desc


select distinct
  a.name,
  we.channel
from web_events we
  join accounts a
    on we.account_id = a.id
where a.id = 1001   