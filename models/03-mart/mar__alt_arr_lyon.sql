WITH source_alt AS (
    SELECT * FROM {{ ref('stg__altitude_arr_lyon') }}

),

source_compteurs AS (
    SELECT * FROM {{ ref('int__compteurs_annee_mois_lyon') }}
),

joined_data AS (
    SELECT
        PARSE_DATE('%Y-%m', compt_date_ym) AS compt_date_ym,
        a.arr_id,
        alt_moy,
        alt_class,
        alt_cat,
        c.avg_compt


    FROM source_alt a
    INNER JOIN source_compteurs c ON c.arr = a.arr_id
)

SELECT *
FROM joined_data
ORDER BY compt_date_YM, arr_id
