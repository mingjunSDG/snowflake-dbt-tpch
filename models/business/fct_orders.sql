{{ config(materialized='table') }}

with order_details as (
    select * from {{ ref('int_order_details') }}
)

select
    -- Primary Key
    {{ dbt_utils.generate_surrogate_key(['order_key', 'part_key', 'line_number']) }} as fact_order_id,
    
    -- Foreign Keys for the Star Schema
    order_key,
    customer_key,
    part_key,
    supplier_key,
    
    -- Descriptive Attributes
    order_date,
    
    -- Metrics (Facts)
    quantity,
    extended_price as gross_revenue,
    net_item_price as net_revenue,
    tax,
    discount
from order_details