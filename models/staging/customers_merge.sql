{{
    config(
        materialized='incremental',
        unique_key='customer_id',
        incremental_strategy='merge'
    )
}}

WITH cte AS (

    SELECT *
    FROM {{ source('raw', 'customers') }}

)

SELECT
    customer_id,
    customer_name,
    city
FROM cte