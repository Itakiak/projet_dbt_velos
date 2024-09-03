select
    osm_id,
    amenagement,
    cote_amenagement,
    sens,
    arrondissement,
    voie_a_sens_unique,
    date_export,
    st_length_shape,
    geo_shape_type,
    geo_shape_geometry_coordinates,
    geo_shape_geometry_type,
    geo_point_2d_lon,
    geo_point_2d_lat
from {{ ref("stg__paris_pistes_cyclables")}}
