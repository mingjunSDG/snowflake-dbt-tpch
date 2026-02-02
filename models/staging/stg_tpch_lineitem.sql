{{
    config(
        materialized='incremental',
        unique_key='order_key'
    )
}}

select
    l_orderkey as order_key,
    l_partkey as part_key,
    l_suppkey as supplier_key,
    l_linenumber as line_number,
    l_quantity as quantity,
    l_extendedprice as extended_price,
    l_discount as discount_percentage,
    l_tax as tax_rate,
    l_shipdate as ship_date
from {{ source('tpch', 'lineitem') }}

{% if is_incremental() %}
  -- We use the original source column name for the filter
  where l_shipdate > (select max(ship_date) from {{ this }})
{% endif %}