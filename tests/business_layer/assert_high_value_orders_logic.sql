-- Checks for "High Value" anomalies.
-- Rule: Flag any order where we lost significant money (Net Revenue < -100)
-- OR where the Discount is suspiciously high (> 50%)

select 
    order_key,
    net_revenue,
    discount
from {{ ref('fct_orders') }}
where net_revenue < -100
   or discount > 0.5