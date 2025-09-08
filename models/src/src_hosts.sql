with raw_hosts as(
    -- select * from ITAY_DANINO_DBT.RAW.raw_hosts
    select * from {{ source('dbt_project', 'hosts')}}
)
select * from raw_hosts