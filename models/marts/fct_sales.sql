-- fct_sales.sql
-- Fact table for sales analysis

select

    order_id,
    order_date,

    store_id,
    customer_id,
    staff_id,
    product_id,
    quantity,
    list_price,
    discount_rate,
    discount_percentage,
    revenue
from {{ ref('int_sales_enriched') }}
