with 

source as (

    select * from {{ ref('stg__stationnement_velo_lyon') }}

),

renamed as (

    select
        station_id,
        station_ville,
        station_type,
        station_loc,
        station_capacite,
        station_annee,
        concat(lat,',',lon) as station_latlong
    from source
    where STARTS_WITH(station_ville, "Lyon")

)

select * from renamed
