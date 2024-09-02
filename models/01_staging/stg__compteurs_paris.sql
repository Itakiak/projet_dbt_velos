with 

source as (

    select * from {{ source('raw_data', 'compteurs_paris') }}

),

renamed as (

    select
        date as annee_mois,
        cast(id_compteur as INT64) as id_compteur,
        nom_compteur,
        lat_long,
        comptage as velos_count

    from source

)

select * from renamed
