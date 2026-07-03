{{
    config(
        materialized='table',
        post_hook=[
            "insert into KT.RAW_SCHEMA.MODEL_LOGS(model_name, status, run_at)
             values ('posthook_orders', 'COMPLETED', current_timestamp())"
        ]
    )
}}

SELECT *
FROM {{ source('raw', 'orders') }}