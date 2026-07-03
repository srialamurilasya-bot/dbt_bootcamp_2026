{{
    config(
        materialized='table'
    )
}}

WITH cte AS (

    SELECT *
    FROM {{ source('raw', 'orders') }}

)

SELECT
    order_id,
    customer_id,
    product_id,
    quantity,
    {{ cents_to_dollars('quantity') }} AS quantity_divided_by_100,
    order_date
FROM cte
