with 

source as (

    select * from {{ source('raw_data', 'operateurs_velo_paris_lyon') }}

),

renamed as (

    select
        ville,
        operateur_type,
        operateur_nom,
        velo_type,
        offre_type,
        offre_nom,
        engagement_duree,
        engagement_jours,
        deverouillage_tarif,
        minute_tarif,
        demie_heure_tarif,
        mensualite,
        tarifs_speciaux

    from source

)

select * from renamed
