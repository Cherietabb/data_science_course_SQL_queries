/*
For each account, determine the average amount of each type of paper they purchased across their orders. Your result should have four columns - one for the account name and one for the average spent on each of the paper types.
*/

select
  a.name,
  avg(o.standard_qty) standard,
  avg(o.poster_qty)   poster,
  avg(o.gloss_qty)    gloss
from accounts a
  join orders o
    on a.id = o.account_id
group by a.name;
