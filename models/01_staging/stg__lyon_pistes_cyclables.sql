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
        anneelivraison,
        longueur,
        gid,
        geometry

    from source

)

select * from renamed
