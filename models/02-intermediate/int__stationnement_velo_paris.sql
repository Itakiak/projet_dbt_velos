with 

source as (

    select * from {{ ref('stg__stationnement_velo_idf') }}

),

renamed as (

    select
        station_id,
        station_ville,
        station_type,
        station_capacite,
        CONCAT(JSON_EXTRACT(station_coord, '$.coordinates[1]'),', ',JSON_EXTRACT(station_coord, '$.coordinates[0]')) AS station_latlong


    from source
    where station_ville LIKE '%Arrondissement%'
    order by station_ville

)

select * from renamed
