with 

source as (

    select * from {{ source('raw_data', 'stationnement_velo_idf') }}

),

renamed as (

    select
        geo_point,
        geo_shape,
        osm_id,
        couvert,
        capacite,
        nom,
        acces,
        payant,
        surveille,
        type,
        insee_com,
        nom_com,
        date_modif,
        notes

    from source

)

select * from renamed
