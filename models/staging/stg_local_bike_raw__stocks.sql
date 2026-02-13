select
    store_id, -- composite key (part 1)
    product_id, -- composite key (part 2)
    quantity
from {{ source("local_bike_raw", "stocks") }}