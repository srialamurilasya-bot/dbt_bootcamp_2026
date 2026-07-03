{{config(materialized='view') }}
WITH source AS(
    select *from {{ ref('stg_orders') }}
)
select ord_id as order_id,cust_id as customer_id
from source