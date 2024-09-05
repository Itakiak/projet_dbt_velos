with

    source as (select * from {{ ref('int__compteurs_annee_mois_paris') }}),

    frequentation as (

        select
            compt_date_ym,
            avg_compt

        from source

    )

select *
from frequentation
