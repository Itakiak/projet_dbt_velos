with

    source as (select * from {{ ref("stg__compteurs_lyon") }}),

    compteurs_annee_mois as (

        select
            compt_date_ym,
            arr,
            cast(
                round(sum(velos_count) / count(distinct id_compteur)) as int64
            ) as avg_compt

        from source
        group by arr, compt_date_ym

    )

select *
from compteurs_annee_mois
