SELECT order_id
FROM {{ ref('fact_orders') }}
WHERE order_id IS NULL