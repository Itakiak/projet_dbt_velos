with 

source as (

    select * from {{ source('raw_data', 'lyon_pistes_cyclables') }}

),

renamed as (

    select
        id,
        nom,
        commune1,
        insee1,
        commune2,
        insee2,
        reseau,
        financementac,
        typeamenagement,
        typeamenagement2,
        positionnement,
        senscirculation,
        environnement,
        localisation,
        typologiepiste,
        revetementpiste,
        domanialite,
        reglementation,
        zonecirculationapaisee,
        anneelivraison,
        longueur,
        observation,
        gid,
        geometry

    from source

)

select * from renamed
