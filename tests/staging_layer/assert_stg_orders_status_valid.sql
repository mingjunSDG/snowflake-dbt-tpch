-- Singular Test for Staging Layer
-- Logic: Verify that order_status contains only known, valid codes.
-- If this returns rows, we have "garbage" data (unknown status codes).

select 
    order_key,
    status_code
from {{ ref('stg_tpch_orders') }}
where status_code not in ('O', 'F','P')