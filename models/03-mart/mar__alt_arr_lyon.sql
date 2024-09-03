WITH source_alt AS (
    SELECT * FROM {{ ref('stg_raw_data__altitude_arr_lyon') }}
),

source_compteurs AS (
    SELECT * FROM {{ ref('stg__compteurs_lyon') }}
),

joined_data AS (
    SELECT
        compt_date_YM,
        arr_id,
        alt_moy,
        alt_class,
        alt_cat,
        count(distinct id_compteur),
        sum(velos_count),
        round(sum(velos_count) / count(distinct id_compteur)) as int64) as avg_compt


    FROM source_alt a
    JOIN source_compteurs c ON c.arr = a.arr_id
)

SELECT *
FROM joined_data
GROUP BY compt_date_YM, arr_id, alt_moy, alt_class, alt_cat
ORDER BY compt_date_YM, arr_id
