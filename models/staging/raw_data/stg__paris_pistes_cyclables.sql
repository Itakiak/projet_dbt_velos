with 

source as (

    select * from {{ source('raw_data', 'paris_pistes_cyclables') }}

),

renamed as (

    select
        osm_id,
        amenagement,
        cote_amenagement,
        sens,
        arrondissement,
        amenagement_temporaire,
        infrastructure_bidirection,
        voie_a_sens_unique,
        position_amenagement,
        vitesse_maximale_autorisee,
        date_export,
        source,
        st_length_shape,
        geo_shape_type,
        geo_shape_geometry_coordinates,
        geo_shape_geometry_type,
        geo_point_2d_lon,
        geo_point_2d_lat

    from source

)

select * from renamed
