{{ config(
    materialized='incremental',
    on_schema_change='fail'
) }}

with src_reviews as (
    select *
    from {{ ref('src_reviews') }}
)

select
    listing_id,
    review_date,
    review_text,
    reviewer_id,
    sentiment
from src_reviews
where review_text is not null

{% if is_incremental() %}
  -- Bring only new records
  and review_date > (select max(review_date) from {{ this }})
{% endif %}

-- General notes:
-- 'this' refers to the current model
-- is_incremental() is a built-in dbt function
-- 'on_schema_change=fail' ensures pipeline stops if upstream schema changes
-- First run: loads all reviews with text
-- Next runs: only loads rows where review_date > max(review_date) in fact_reviews
-- Use 'dbt run --full-refresh' to rebuild entire table if needed
