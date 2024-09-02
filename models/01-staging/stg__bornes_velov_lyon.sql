with 

source as (

    select * from {{ source('raw_data', 'bornes_velov_lyon') }}

),

renamed as (

    select
        id,
        arrondissement,
        bike_stands,
        coordinates

    from source

)

select * from renamed
