{{
    config(
        materialized='incremental',
        incremental_strategy='insert_overwrite',
        partition_by={
            "field": "order_date",
            "data_type": "date"
        }
    )
}}

WITH cte AS (

    SELECT *
    FROM {{ source('raw', 'orders') }}

)

SELECT
    order_id,
    customer_id,
    quantity,
    order_date,
    CURRENT_TIMESTAMP() AS load_time
FROM cte

{% if is_incremental() %}

WHERE order_date > (
    SELECT MAX(order_date)
    FROM {{ this }}
)

{% endif %}