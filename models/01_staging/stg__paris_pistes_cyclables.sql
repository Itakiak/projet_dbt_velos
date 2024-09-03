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
        voie_a_sens_unique,
        FORMAT_DATE('%Y-%m-%d', PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%S%Ez', date_export)) AS date_export,
        st_length_shape,
        geo_shape_type,
        geo_shape_geometry_coordinates,
        geo_shape_geometry_type,
        geo_point_2d_lon,
        geo_point_2d_lat

    from source

)

select * from renamed
