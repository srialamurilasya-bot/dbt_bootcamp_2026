WITH source AS (
select 
*from {{ source('raw', 'orders') }}
),
renamed AS (
    SELECT
        Order_ID    AS ord_id,
        Customer_ID AS cust_id,
        Product_ID  AS prod_id,
        Quantity    AS qty,
        Order_Date  AS ord_date
    FROM source
    WHERE Order_Date IS NOT NULL
)
SELECT *
FROM renamed