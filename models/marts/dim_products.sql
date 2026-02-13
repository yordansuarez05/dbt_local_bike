-- dim_products
-- Product dimension for BI analysis
-- Contains product attributes used for slicing sales

select distinct

    -- Primary key
    product_id,

    -- Descriptive attributes
    product_name,
    category_name,
    brand_name,

    -- Pricing
    round(list_price, 2) as list_price

from {{ ref('int_sales_enriched') }}
