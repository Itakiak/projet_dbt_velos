WITH source_meteo AS (
    SELECT * FROM {{ ref("int__data_meteo_lyon") }}
),

source_compteurs AS (
    SELECT * FROM {{ ref('stg__compteurs_lyon') }}
),

joined_data AS (
    SELECT
        c.compt_date_YM,
        c.id_compteur,
        c.nom_compteur,
        c.arr,
        c.lat_long,
        c.velos_count,
        m.meteo_date_YM,
        m.avg_windspd_kmh,
        m.avg_precip_mm,
        m.avg_heatindex,
        m.avg_snow_mm,
        m.avg_temp,
        m.avg_windchill
    FROM source_compteurs c
    JOIN source_meteo m ON c.compt_date_YM = m.meteo_date_YM
)

SELECT *
FROM joined_data
ORDER BY meteo_date_YM, id_compteur