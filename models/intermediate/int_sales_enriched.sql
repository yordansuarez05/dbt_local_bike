-- int_sales_enriched.sql
-- This model prepares sales analysis data with revenue calculation

with orders as (

    select *
    from {{ ref('stg_local_bike_raw__orders') }}),

order_items as (

    select *
    from {{ ref('stg_local_bike_raw__order_items') }}),

products as (

    select *
    from {{ ref('stg_local_bike_raw__products') }}),

categories as (

    select *
    from {{ ref('stg_local_bike_raw__categories') }}),

brands as (

    select *
    from {{ ref('stg_local_bike_raw__brands') }}),

customers as (

    select *
    from {{ ref('stg_local_bike_raw__customers') }}),

staffs as (

    select *
    from {{ ref('stg_local_bike_raw__staffs') }}),

stores as (

    select *
    from {{ ref('stg_local_bike_raw__stores') }})

select

    -- Order info
    o.order_id,
    o.order_date,
    o.store_id,
    o.customer_id,
    o.staff_id,

    -- Product info
    oi.product_id,
    oi.quantity,

    round(oi.list_price, 2) as list_price,
    round(oi.discount, 4) as discount_rate,
    round(oi.discount * 100, 2) as discount_percentage,

    -- Revenue calculation
    round(
        oi.quantity * oi.list_price * (1 - oi.discount),
        2
    ) as revenue,

    -- Descriptive fields
    p.product_name,
    c.category_name,
    b.brand_name,

    s.store_name,

    cu.first_name as customer_first_name,
    cu.last_name as customer_last_name,

    st.first_name as staff_first_name,
    st.last_name as staff_last_name

from orders o
left join order_items oi on o.order_id = oi.order_id
left join products p on oi.product_id = p.product_id
left join categories c on p.category_id = c.category_id
left join brands b on p.brand_id = b.brand_id
left join customers cu on o.customer_id = cu.customer_id
left join staffs st on o.staff_id = st.staff_id
left join stores s on o.store_id = s.store_id
