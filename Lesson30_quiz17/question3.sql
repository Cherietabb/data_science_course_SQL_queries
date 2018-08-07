/*
Determine the number of times a particular channel was used in the web_events table for each sales rep. Your final table should have three columns - the name of the sales rep, the channel, and the number of occurrences. Order your table with the highest number of occurrences first.
*/

select
  we.channel,
  sr.name,
  count(we.occurred_at) num_occurrances
from sales_reps sr
  join accounts a
    on sr.id = a.sales_rep_id
  join web_events we
    on a.id = we.account_id
group by we.channel, sr.name
order by num_occurrances desc;
