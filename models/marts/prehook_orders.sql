{{
    config(
        materialized='table',
        pre_hook=["create or replace temporary table KT.DEMO.TEMP_ORDERS as select * from KT.RAW_SCHEMA.ORDERS"]
    )
}}

WITH cte AS (

    SELECT *
    FROM KT.DEMO.TEMP_ORDERS

)

SELECT *
FROM cte