SELECT
        osm_id,
        amenagement,
        cote_amenagement,
        sens,
        arrondissement,
        voie_a_sens_unique,
        FORMAT_TIMESTAMP('%Y-%m', PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%S%Ez', date_export)) AS date_export,
        st_length_shape,
        geo_shape_type,
        geo_shape_geometry_coordinates,
        geo_shape_geometry_type,
        geo_point_2d_lon,
        geo_point_2d_lat
  FROM
    {{ ref('stg__paris_pistes_cyclables')}}