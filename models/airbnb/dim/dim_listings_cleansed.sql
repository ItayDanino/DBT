{{ config(
    materialized='view'
) }}

with src_listings as (
    select *
    from {{ ref('src_listings') }}

)

select
    listing_id,
    listing_name,
    room_type,
    -- business rule: minimum_nights cannot be 0
    case when minimum_nights = 0 then 1 else minimum_nights 
    end as minimum_nights,
    -- price cleanup: remove $ and cast to numeric
    cast(replace(price_str, '$', '') as numeric(10,2)) as price,
    host_id,
    created_at
from src_listings 