with 

source as (

    select * from {{ source('raw_data', 'paris_pistes_cyclables') }}

),

renamed as (

    select
        osm_id,
        amenagement,
        arrondissement,
        longueur,
        geometry,
        geo_point_2d

    from source

)

select * from renamed
