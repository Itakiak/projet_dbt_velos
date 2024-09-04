with

    pistes_cyclables as (

        select
            id,
            commune,
            amenagement,
            senscirculation,
            livraison_date as livraison_year,
            longueur,
            gid,
            geometry
        from {{ ref("stg__lyon_pistes_cyclables") }}

    ),

    compteurs as (select * from {{ ref("int__compteurs_annee_lyon") }}),

    pistes_compteurs_joined as (

        select
            pc.id,
            pc.commune,
            pc.amenagement,
            pc.senscirculation,
            pc.livraison_year,
            pc.longueur,
            pc.gid,
            pc.geometry,
            c.avg_compt
        from pistes_cyclables as pc
        join compteurs as c on pc.livraison_year = c.compt_year
    )

select *
from pistes_compteurs_joined
