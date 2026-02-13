select
    customer_id as customer_id, -- primary key
    trim(first_name) as first_name,
    trim(last_name) as last_name,
    trim(phone) as phone,
    lower(trim(email)) as email, -- standardize email
    trim(street) as street,
    trim(city) as city,
    trim(state) as state,
    zip_code
from {{ source("local_bike_raw", "customers") }}