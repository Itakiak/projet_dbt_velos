with 

source as (

    select * from {{ source('raw_data', 'stationnement_velo_lyon') }}

),

renamed as (

    select
        nom,
        adresse,
        commune,
        codeinsee,
        avancement,
        gestionnaire,
        mobiliervelo,
        localisation,
        abrite,
        duree,
        nbarceaux,
        capacite,
        anneerealisation,
        arceauxprojetes,
        pole,
        validite,
        gid,
        lon,
        lat

    from source

)

select * from renamed
