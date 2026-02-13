select distinct
    customer_id,
    customer_first_name,
    customer_last_name

from {{ ref('int_sales_enriched') }}
