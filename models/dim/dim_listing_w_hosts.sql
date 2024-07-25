{{
    config(
        materialized = 'table',
        on_scema_change= 'fail'
    )
}}

WITH
l as (
    SELECT * FROM {{ ref('dim_listing_cleansed')}}
),
h as (
    SELECT * FROM {{ ref('dim_hosts_cleansed') }}
)

SELECT
    l.listing_id,
    l.listing_name,
    l.room_type,
    l.minimum_nights,
    l.price,
    l.host_id,
    h.host_name,
    h.is_superhost AS host_is_superhost,
    l.created_at,
    GREATEST(l.updated_at, h.updated_at) as updated_at
FROM l
LEFT JOIN h on (l.host_id = h.host_id)