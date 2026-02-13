select
    category_id as category_id, -- primary key
    trim(category_name) as category_name -- clean text Standardizing category names
from {{ source("local_bike_raw", "categories") }}
