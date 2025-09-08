with raw_hosts as(
    -- select * from ITAY_DANINO_DBT.RAW.raw_hosts
    {{ source('airbnb', 'hosts')}}
)
select * from raw_hosts