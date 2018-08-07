/*
Via what channel did the most recent (latest) web_event occur, which account was associated with this web_event? Your query should return only three values - the date, channel, and account name.
*/

select
  a.name,
  we.occurred_at,
  we.channel
from accounts a
  join web_events we
    on a.id = we.account_id
order by we.occurred_at desc
limit 1
