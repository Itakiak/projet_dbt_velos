with 

source as (

    select * from {{ source('raw_data', 'stationnement_velo_lyon') }}

),

renamed as (

    select
        nom as station_id,
        adresse,
        commune as station_ville,
        codeinsee,
        avancement,
        gestionnaire,
        mobiliervelo as station_type,
        localisation as station_loc,
        abrite,
        duree,
        nbarceaux,
        cast(capacite as int64) as station_capacite,
        parse_date('%Y', cast(cast(anneerealisation as int64) as STRING)) as station_annee_rea,
        arceauxprojetes,
        pole,
        validite,
        gid,
        lon,
        lat

    from source

)

select * from renamed
