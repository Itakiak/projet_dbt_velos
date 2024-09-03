with 

source as (

    select * from {{ source('raw_data', 'lyon_pistes_cyclables') }}

),

renamed as (

    select
        id,
        commune1 AS commune,
        typeamenagement AS amenagement,
        senscirculation,
        parse_date('%Y', CAST(cast(anneelivraison as int64) AS STRING)) AS livraison_date,
        longueur,
        gid,
        geometry

    from source

)

select * from renamed
