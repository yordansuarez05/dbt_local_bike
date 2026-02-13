select
    staff_id as staff_id, -- primary key
    trim(first_name) as first_name,
    trim(last_name) as last_name,
    trim(email) as email,
    trim(phone) as phone,
    active,
    store_id, -- foreign key
    manager_id -- self reference
from {{ source("local_bike_raw", "staffs") }}