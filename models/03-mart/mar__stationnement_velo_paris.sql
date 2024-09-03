with 

source as (

    select * from {{ ref('int__stationnement_velo_paris') }}

),

renamed as (

    select
        station_id,
        station_ville,
        station_type,
        station_capacite,
        station_latlong


    from source


)

select * from renamed
