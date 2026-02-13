-- int_store_performance.sql
-- This model prepares performance analysis by store and staff

with orders as (

    select *
    from {{ ref('stg_local_bike_raw__orders') }}),

order_items as (

    select *
    from {{ ref('stg_local_bike_raw__order_items') }}),

stores as (

    select *
    from {{ ref('stg_local_bike_raw__stores') }}),

staffs as (

    select *
    from {{ ref('stg_local_bike_raw__staffs') }})

select

    o.order_id,
    o.order_date,

    o.store_id,
    s.store_name,

    o.staff_id,
    st.first_name as staff_first_name,
    st.last_name as staff_last_name,

    round(
        oi.quantity * oi.list_price * (1 - oi.discount),
        2 ) as revenue

from orders o
left join order_items oi on o.order_id = oi.order_id
left join stores s on o.store_id = s.store_id
left join staffs st on o.staff_id = st.staff_id
