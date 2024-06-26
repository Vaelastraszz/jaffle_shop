WITH orders AS (
    SELECT * 
    FROM {{ ref('stg_jaffle_shop_orders') }}
),

payment_type_orders AS (
    SELECT * 
    FROM {{ ref('int_payment_type_amount_per_order') }}
)

SELECT
    ord.order_id,
    ord.customer_id,
    ord.order_date,
    pto.cash_amount,
    pto.credit_amount,
    pto.total_amount,
    CASE
        WHEN ord.status = 'completed' THEN 1
        ELSE 0
    END AS is_order_completed
FROM orders AS ord
LEFT JOIN payment_type_orders AS pto
USING(order_id)
{{ limit_dataset_if_not_deploy_env('order_date', 3) }}