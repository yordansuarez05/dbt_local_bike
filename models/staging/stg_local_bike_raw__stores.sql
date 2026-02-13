select
    store_id as store_id, -- primary key
    trim(store_name) as store_name,
    trim(phone) as phone,
    trim(email) as email,
    trim(street) as street,
    trim(city) as city,
    trim(state) as state,
    zip_code
from {{ source("local_bike_raw", "stores") }}