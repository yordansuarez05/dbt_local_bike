select distinct
    staff_id,
    staff_first_name,
    staff_last_name

from {{ ref('int_sales_enriched') }}
