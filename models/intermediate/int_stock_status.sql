-- int_stock_status.sql
-- This model prepares inventory analysis per store and product

with stocks as (

    select *
    from {{ ref('stg_local_bike_raw__stocks') }}

),

products as (

    select *
    from {{ ref('stg_local_bike_raw__products') }}

),

stores as (

    select *
    from {{ ref('stg_local_bike_raw__stores') }}

)

select

    s.store_id,
    st.store_name,

    s.product_id,
    p.product_name,

    s.quantity as stock_quantity,

    p.category_id,
    p.brand_id

from stocks s
left join products p on s.product_id = p.product_id
left join stores st on s.store_id = st.store_id
