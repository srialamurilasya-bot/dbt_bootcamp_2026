{% snapshot orders_snapshot %}

{{
    config(
        target_schema='snapshots',
        unique_key='order_id',
        strategy='check',
        check_cols=['customer_id','product_id','quantity','order_date']
    )
}}

SELECT
    order_id,
    customer_id,
    product_id,
    quantity,
    order_date
FROM {{ source('raw', 'orders') }}

{% endsnapshot %}