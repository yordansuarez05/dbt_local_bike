select
    product_id as product_id, -- primary key
    trim(product_name) as product_name,
    brand_id, -- foreign key
    category_id, -- foreign key
    model_year,
    list_price
from {{ source("local_bike_raw", "products") }}