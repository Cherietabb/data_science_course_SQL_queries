/*
Find the number of sales reps in each region. Your final table should have two columns - the region and the number of sales_reps. Order from fewest reps to most reps.
*/

select
  r.name,
  count(*) num_sales_reps
from region r
  join sales_reps sr
    on r.id = sr.region_id
group by r.name
order by num_sales_reps