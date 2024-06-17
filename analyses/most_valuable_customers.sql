with fct_orders as (
    select * from {{ ref("fct_orders") }}
),

dim_customers as (
    select * from {{ ref("dim_customers") }}
),

customer_range_per_paid_amount as (
    select * from {{ ref("seed_customer_range_per_paid")}}
),

total_amount_paid_by_customer as (
select
    cust.customer_id,
    cust.first_name,
    sum(total_amount) as global_paid_amount
from fct_orders as ord
left join dim_customers as cust using(customer_id)
where ord.is_order_completed = 1
group by customer_id, first_name
order by global_paid_amount desc
)

select
    tot.customer_id,
    tot.first_name,
    tot.global_paid_amount,
    cust_range.classification
from total_amount_paid_by_customer as tot
join customer_range_per_paid_amount as cust_range on tot.global_paid_amount between cust_range.min_range and cust_range.max_range
order by tot.global_paid_amount desc
limit 10


