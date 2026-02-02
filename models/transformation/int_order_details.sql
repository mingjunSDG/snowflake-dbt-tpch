{{
    config(
        materialized='view'
    )
}}

with orders as (
    select * from {{ ref('stg_tpch_orders') }}
),

lineitem as (
    select * from {{ ref('stg_tpch_lineitem') }}
)

select
    l.order_key,
    o.customer_key,
    o.order_date,
    l.part_key,
    l.quantity,
    l.extended_price,
    -- Simple business logic: calculating net price
    (l.extended_price * (1 - l.discount_percentage)) as net_item_price
from lineitem l
join orders o on l.order_key = o.order_key