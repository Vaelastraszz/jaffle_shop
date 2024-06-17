select 
    order_id,
    sum(total_amount) as total_amount
from {{ ref("int_payment_type_amount_per_order") }}
group by order_id
having total_amount < 0