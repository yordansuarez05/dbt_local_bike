select
    brand_id as brand_id, -- primary key
    trim(brand_name) as brand_name -- remove extra spaces
from {{ source("local_bike_raw", "brands") }}