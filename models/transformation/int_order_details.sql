with orders as (
    select * from {{ ref('stg_tpch_orders') }}
),

lineitem as (
    select * from {{ ref('stg_tpch_lineitem') }}
)

select
    l.order_key,
    l.part_key,
    l.supplier_key,
    l.line_number,
    o.customer_key,
    o.order_date,
    l.quantity,
    l.extended_price,
    l.tax,
    l.discount,
    -- Calculate the net price here to keep fct_orders clean
    (l.extended_price * (1 - l.discount) * (1 + l.tax)) as net_item_price
from lineitem l
join orders o on l.order_key = o.order_key