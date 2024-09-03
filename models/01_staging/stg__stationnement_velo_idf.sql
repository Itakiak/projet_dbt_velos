with 

source as (

    select * from {{ source('raw_data', 'stationnement_velo_idf') }}

),

renamed as (

    select
        geo_point,
        geo_shape as station_coord,
        osm_id as station_id,
        couvert,
        capacite as station_capacite,
        nom,
        acces,
        payant,
        surveille,
        type as station_type,
        insee_com,
        nom_com as station_ville,
        date_modif,
        notes

    from source

)

select * from renamed
