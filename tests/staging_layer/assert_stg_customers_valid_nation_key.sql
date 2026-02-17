-- Singular Test: Referential Integrity Check
-- Logic: Find any customer whose 'nation_key' does NOT exist in the nations table.

select 
    c.customer_key,
    c.nation_key
from {{ ref('stg_tpch_customer') }} as c
left join {{ ref('stg_tpch_nations') }} as n
    on c.nation_key = n.nation_key
-- If the join fails (n.nation_key is null), the customer has an invalid nation
where n.nation_key is null