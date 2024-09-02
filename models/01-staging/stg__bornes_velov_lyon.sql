with 

source as (

    select * from {{ source('raw_data', 'bornes_velov_lyon') }}

),

renamed as (

    select
        id as station_id,
        coordinates

    from source

)

select * from renamed
