with
    source_station as (select * from {{ ref("int__stationnement_velo_lyon") }}),

    stationnement as (

        select
            station_id,
            station_ville,
            station_type,
            station_loc,
            station_capacite,
            station_annee_rea,
            station_latlong

        from source_station

    )

select *
from stationnement
