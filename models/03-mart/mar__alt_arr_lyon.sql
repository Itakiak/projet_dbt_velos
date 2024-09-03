WITH source_alt AS (
    SELECT * FROM {{ ref('stg__altitude_arr_lyon') }}

),

source_compteurs AS (
    SELECT * FROM {{ ref('int__compteurs_annee_mois_lyon') }}
),

source_velov AS (
    SELECT count(station_id) as nb_station_velov, arrondissement FROM {{ ref('stg__bornes_velov_lyon') }} GROUP BY arrondissement
),

joined_data AS (
    SELECT
        compt_date_ym,
        a.arr_id,
        alt_moy,
        alt_class,
        alt_cat,
        c.avg_compt,
        nb_station_velov


    FROM source_alt a
    INNER JOIN source_compteurs c ON c.arr = a.arr_id
    INNER JOIN source_velov v ON c.arr = v.arrondissement
)

SELECT *
FROM joined_data
ORDER BY compt_date_YM, arr_id
