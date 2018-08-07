/*
Determine the number of times a particular channel was used in the web_events table for each region. Your final table should have three columns - the region name, the channel, and the number of occurrences. Order your table with the highest number of occurrences first.
*/

select
  we.channel,
  r.name,
  count(we.occurred_at) num_occurrances
from region r
  join sales_reps sr
    on r.id = sr.region_id
  join accounts a
    on sr.id = a.sales_rep_id
  join web_events we
    on a.id = we.account_id
group by we.channel, r.name
order by num_occurrances desc