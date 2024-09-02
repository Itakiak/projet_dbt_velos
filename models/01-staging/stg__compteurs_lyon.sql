with 

source as (

    select * from {{ source('raw_data', 'compteurs_lyon') }}

),

renamed as (

    select
        id_compteur,
        nom_compteur,
        arr,
        lat,
        long,
        annee_mois,
        comptage

    from source

)

select * from renamed
