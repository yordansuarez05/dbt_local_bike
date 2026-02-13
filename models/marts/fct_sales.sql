-- fct_sales
-- Fact table for sales analysis
-- This model is part of the Star Schema (Marts layer)
-- Used for BI reporting and performance analysis

select

    -- Primary identifiers
    order_id,
    order_date,
    customer_id,
    product_id,
    store_id,
    staff_id,

    -- Business metrics
    quantity,

    round(list_price, 2) as list_price,
    round(discount_rate, 4) as discount_rate,
    round(discount_percentage, 2) as discount_percentage,

    round(revenue, 2) as revenue

from {{ ref('int_sales_enriched') }}
