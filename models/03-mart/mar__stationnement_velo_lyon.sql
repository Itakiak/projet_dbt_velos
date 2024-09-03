WITH source_station AS (
    SELECT * FROM {{ ref('stg__stationnement_velo_lyon') }}
),

source_compteurs AS (
    SELECT * FROM {{ ref('stg__compteurs_lyon') }}
),


source_joined as (

    select
        station_id,
        station_ville,
        station_type,
        station_loc,
        station_capacite,
        station_annee_rea,
        concat(lat,',',lon) as station_latlong

    FROM source_station s
    INNER JOIN source_compteurs c ON c.compt_date_YM = s.meteo_date_YM

    where STARTS_WITH(station_ville, "Lyon")

)

select * from sources_joined
