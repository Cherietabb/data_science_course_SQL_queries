/*
Find the total number of times each type of channel from the web_events was used. Your final table should have two columns - the channel and the number of times the channel was used.
*/

select
  channel,
  count(account_id) sum_of_channel
from web_events
group by channel
order by channel
