select
    order_id as order_id, -- primary key
    customer_id, -- foreign key
    order_status,
    order_date,
    required_date,
    shipped_date,
    store_id, -- foreign key
    staff_id -- foreign key
from {{ source("local_bike_raw", "orders") }}