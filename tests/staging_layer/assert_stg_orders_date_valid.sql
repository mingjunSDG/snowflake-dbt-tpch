-- Singular Test: Check if order dates are valid (e.g., between 1990 and today)
-- Logic: Fail if the date is too old or in the future.

select
    order_key,
    order_date
from {{ ref('stg_tpch_orders') }}
where order_date < '1990-01-01'
   or order_date > current_date()