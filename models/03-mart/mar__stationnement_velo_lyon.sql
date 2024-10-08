with
    source as (select * from {{ ref("int__stationnement_velo_lyon") }}),
    renamed as (
        select
            station_id,
            station_ville,
            station_type,
            station_capacite,
            station_latlong,
            station_annee_rea
        from source
    )
select *
from renamed
