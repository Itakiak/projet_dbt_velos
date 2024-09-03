with 

source as (

    select * from {{ ref('stg__bornes_velib_paris') }}

),

stations as (

    select
        station_id,
        coordinates

    from source

)

select * from stations
