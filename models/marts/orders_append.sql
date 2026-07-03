{{
    config(
        materialized='incremental',
        incremental_strategy= 'append'
    )
}}
with cte AS(
    select*from {{ source('raw', 'orders') }}

)
select
   order_id,
   customer_id,
   product_id,
   quantity,
   order_date
from cte   
{%if is_incremental() %}
 where order_date > (select max(order_date)from {{this}})
{% endif %} 