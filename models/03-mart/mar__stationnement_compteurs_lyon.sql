with
    stationnements as (select * from {{ ref("int__stationnement_velo_lyon") }}),
    compteurs as (select * from {{ ref('int__compteurs_annee_lyon') }}),

    stationnements_compteurs_joined as (
        select
            s.station_id,
            s.station_ville,
            s.station_type,
            s.station_capacite,
            s.station_latlong,
            s.station_annee_rea,
            c.avg_compt as bikes_avg_count
        from stationnements as s
        inner join compteurs as c
        on c.compt_year = s.station_annee_rea
    )
select *
from stationnements_compteurs_joined
