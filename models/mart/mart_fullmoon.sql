{{
    config(
        materialized = 'table',
    )
}}

WITH fct_reviews as (
    select * from {{ ref('fct_reviews')}}
),
fullmoon as (
    select * from {{ ref('seed_full_moon_dates')}}
)

SELECT
    r.*,
    CASE 
        WHEN fm.full_moon_date IS NULL THEN 'No'  
        ELSE 'Yes' 
    END AS is_full_moon
FROM
    fct_reviews r
LEFT JOIN
    fullmoon fm
    on (r.review_date = fm.full_moon_date)