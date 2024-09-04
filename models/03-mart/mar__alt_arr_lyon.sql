with
    source_alt as (select * from {{ ref("stg__altitude_arr_lyon") }}),

    source_compteurs as (select * from {{ ref("int__compteurs_annee_mois_lyon") }}),

    source_velov as (
        select count(station_id) as nb_station_velov, arrondissement
        from {{ ref("stg__bornes_velov_lyon") }}
        group by arrondissement
    ),

    joined_data as (
        select
            c.compt_date_ym,
            a.arr_id,
            alt_moy,
            alt_class,
            alt_cat,
            c.avg_compt as bikes_avg_count,
            nb_station_velov

        from source_alt a
        inner join source_compteurs c on c.arr = a.arr_id
        inner join source_velov v on c.arr = v.arrondissement
    )

select *
from joined_data
order by compt_date_ym, arr_id
