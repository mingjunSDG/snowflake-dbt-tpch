select
    l_orderkey as order_key,
    l_partkey as part_key,
    l_suppkey as supplier_key,
    l_linenumber as line_number,  -- Make sure this alias matches!
    l_quantity as quantity,
    l_extendedprice as extended_price,
    l_tax as tax,
    l_discount as discount,
    l_shipdate as ship_date
from {{ source('tpch', 'lineitem') }}