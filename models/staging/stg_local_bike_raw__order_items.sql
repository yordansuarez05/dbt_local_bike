select
    order_id, -- composite key (part 1)
    item_id, -- composite key (part 2)
    product_id, -- foreign key
    quantity,
    list_price,
    discount
from {{ source("local_bike_raw", "order_items") }}