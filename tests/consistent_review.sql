WITH listing AS (
    SELECT * FROM {{ ref('dim_listing_cleansed')}}
),
review AS (
    SELECT * FROM {{ ref('fct_reviews')}}
)

SELECT
    r.*,
    l.created_at AS listing_created
FROM
    review r
LEFT JOIN
    listing l
ON (r.listing_id = l.listing_id)
WHERE r.review_date < l.created_at