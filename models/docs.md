{% docs table_fct_orders %}
**Final Sales Fact Table**

This table serves as the central source of truth for all sales transactions. It is built by joining **Orders** (headers) with **Line Items** (details).

**Key Details:**
* **Grain:** One row per unique line item (Order Key + Line Number).
* **Source Tables:** `stg_tpch_orders`, `stg_tpch_lineitem`.
* **Transformation Logic:**
    * Inner join between Orders and Line Items.
    * Renaming of source columns to user-friendly business terms.
    * Calculation of net pricing including tax and discounts.

**Usage:**
Use this table for calculating total revenue, average order value, and analyzing sales performance by customer or supplier.
{% enddocs %}

{% docs col_net_item_price %}
**Net Item Price**

The final calculated price of the line item after all adjustments. This represents the actual revenue realized from this specific item.

**Formula:**
$$
\text{Extended Price} \times (1 - \text{Discount}) \times (1 + \text{Tax})
$$

* **Extended Price:** The raw price (Quantity * Unit Price).
* **Discount:** The percentage deducted (e.g., 0.05 for 5%).
* **Tax:** The percentage added (e.g., 0.08 for 8%).
{% enddocs %}

{% docs col_extended_price %}
**Extended Price (Gross Revenue)**

The raw sales amount for the line item *before* any discounts or taxes are applied.
Derived directly from the source line item data.
{% enddocs %}

{% docs col_order_status_code %}
**Order Status Code**

A single character representing the current state of the order.
* **O:** Open (Active, not fully shipped)
* **F:** Filled (Completed)
* **P:** Partial (Some items shipped)
{% enddocs %}