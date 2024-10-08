with

    source as (select * from {{ ref("stg__compteurs_lyon") }}),

    compteurs_annee as (

        select
            DATE_TRUNC(compt_date_ym, YEAR) as compt_year,
            cast(
                round(sum(velos_count) / count(distinct id_compteur)) as int64
            ) as avg_compt

        from source
        group by compt_year
        order by compt_year

    )

select *
from compteurs_annee
