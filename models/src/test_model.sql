with source_reviews as(
    select * from {{ref("src_reviews")}}
)


-- dbt Power User Python


with source_reviews as(
    select * from {{ref()}}
)
