{{ config(materialized='table') }}

with order_details as (
    select * from {{ ref('int_order_details') }}
)

select
    order_key,
    customer_key,
    order_date,
    count(part_key) as total_items,
    sum(quantity) as total_quantity,
    sum(extended_price) as gross_revenue,
    sum(net_item_price) as net_revenue
from order_details
group by 1, 2, 3