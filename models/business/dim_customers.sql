{{ config(materialized='table') }}

select
    customer_key,
    customer_name,
    address,
    phone_number,
    market_segment
from {{ ref('stg_tpch_customer') }}