WITH raw_listings as (
    select * from airbnb.raw.raw_listings
)

select
    id AS listing_id,
    name AS listing_name,
    listing_url,
    room_type,
    minimum_nights,
    host_id,
    price AS price_str,
    created_at,
    updated_at
from
    raw_listings