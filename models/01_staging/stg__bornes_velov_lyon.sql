with 

source as (

    select * from {{ source('raw_data', 'bornes_velov_lyon') }}

),

renamed as (

    select
        id as station_id,
        concat('Lyon ', substr(arrondissement, 1, 1)) as arrondissement,
        coordinates

    from source

)

select * from renamed
