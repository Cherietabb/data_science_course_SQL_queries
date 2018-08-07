/*
Find the sales in terms of total dollars for all orders in each year, ordered from greatest to least. Do you notice any trends in the yearly sales totals?
*/

select
  date_part('YEAR', occurred_at) yearly_sales,
  SUM(total_amt_usd)             total_spent
from orders
group by 1
order by 2 desc;

/*
Which month did Parch & Posey have the greatest sales in terms of total dollars? Are all months evenly represented by the dataset?
*/

select
  date_part('month', occurred_at) yearly_sales,
  SUM(total_amt_usd)              total_spent
from orders
group by 1
order by 2 desc;


/*
Which year did Parch & Posey have the greatest sales in terms of total number of orders? Are all years evenly represented by the dataset?
*/

select
  date_part('Year', occurred_at) yearly_orders,
  count(total)                   total_orders
from orders
group by 1
order by 2 desc;


/*
Which month did Parch & Posey have the greatest sales in terms of total number of orders? Are all months evenly represented by the dataset?
*/
select
  date_part('month', occurred_at) yearly_orders,
  count(total)                    total_orders
from orders
group by 1
order by 2 desc;


-- In which month of which year did Walmart spend the most on gloss paper in terms of dollars?

select
  DATE_TRUNC('month', o.occurred_at) date_ordered,
  SUM(o.gloss_amt_usd)               tot_spent
from orders o
  join accounts a
    on o.account_id = a.id
       and a.name = 'Walmart'
group by 1
order by 2 desc
limit 1;
 