with

    source as (select * from {{ ref("stg__compteurs_paris") }}),

    compteurs_annee as (

        select
            PARSE_DATE('%Y-%m-%d', CONCAT(format_date('%Y', compt_date_ym), '-01-01')) AS compt_year,
            cast(
                round(sum(velos_count) / count(distinct id_compteur)) as int64
            ) as avg_compt

        from source
        group by compt_year
        order by compt_year

    )

select *
from compteurs_annee
