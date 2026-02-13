select distinct
    product_id,
    product_name,
    category_name,
    brand_name,
    round(list_price, 2) as list_price

from {{ ref('int_sales_enriched') }}
