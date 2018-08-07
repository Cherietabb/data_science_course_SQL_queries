-- Who was the primary contact associated with the earliest web_event?
select
  a.primary_poc
from accounts a
  join web_events we
    on a.id = we.account_id
order by we.occurred_at
limit 1
