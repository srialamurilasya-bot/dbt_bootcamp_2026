{{
    config(
        materialized='table'
    )
}}

SELECT *
FROM {{ ref('ephemeral_orders') }}