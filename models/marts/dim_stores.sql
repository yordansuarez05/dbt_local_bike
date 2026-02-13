select distinct
    store_id,
    store_name

from {{ ref('int_sales_enriched') }}
