{{ config(materialized='table') }}

select 
    s.supplier_key,
    s.supplier_name,
    s.address,
    n.nation_name,
    r.region_name,
    s.phone_number,
    s.account_balance
from {{ ref('stg_tpch_suppliers') }} s
join {{ ref('stg_tpch_nations') }} n on s.nation_key = n.nation_key
join {{ ref('stg_tpch_regions') }} r on n.region_key = r.region_key