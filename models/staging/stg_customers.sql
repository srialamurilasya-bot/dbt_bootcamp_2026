{{
    config(
        materialized='table'
    )
}}
with cte as(
    select *from {{ source('raw', 'customers') }}
)
select
   customer_id,
   customer_name AS cust_name,
   city
from cte