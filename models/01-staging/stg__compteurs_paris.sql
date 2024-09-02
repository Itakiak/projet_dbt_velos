with 

source as (

    select * from {{ source('raw_data', 'compteurs_paris') }}

),

renamed as (

    select
        id_compteur,
        nom_compteur,
        date,
        lat_long,
        comptage

    from source

)

select * from renamed
