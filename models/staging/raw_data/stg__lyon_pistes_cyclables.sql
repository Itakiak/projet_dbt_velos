with 

source as (

    select * from {{ source('raw_data', 'lyon_pistes_cyclables') }}

),

renamed as (

    select
        name,
        arrondissement,
        idpdc,
        longitude,
        latitude,
        attribute,
        value

    from source

)

select * from renamed
