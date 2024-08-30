with 

source as (

    select * from {{ source('raw_data', 'bornes_velib_paris') }}

),

renamed as (

    select
        station_id,
        coordinates

    from source

)

select * from renamed
