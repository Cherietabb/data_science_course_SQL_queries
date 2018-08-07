-- Use DISTINCT to test if there are any accounts associated with more than one region.

select distinct
  a.name account,
  r.name region
from accounts a
  join sales_reps sr
    on a.sales_rep_id = sr.id
  join region r
    on sr.region_id = r.id
group by a.name, r.name
order by r.name;

-- Have any sales reps worked on more than one account?

select distinct
  sr.id    sales_id,
  sr.name  sales_rep,
  count(*) accounts
from sales_reps sr
  join accounts a
    on sr.id = a.sales_rep_id
group by
  sales_id, sales_rep
order by sales_id