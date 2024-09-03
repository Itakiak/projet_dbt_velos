with 

source as (

    select * from {{ ref('stg__bornes_velov_lyon') }}

),

stations as (

    select
        station_id,
        coordinates,
        arrondissement

    from source

)

select * from stations
