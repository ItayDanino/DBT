with raw_reviews as(
    -- select * from ITAY_DANINO_DBT.RAW.raw_reviews
    select * from {{ source('dbt_project', 'reviews') }}

)

select
    listing_id,
    date as review_date,
    reviewer_name,
    comments as review_text,
    sentiment as review_sentiment
from raw_reviews