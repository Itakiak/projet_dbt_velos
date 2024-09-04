select osm_id, amenagement, arrondissement, longueur, geometry, geo_point_2d
from {{ ref("stg__paris_pistes_cyclables") }}
