with 

source as (

    select * from {{ ref('stg__operateurs_velo_paris_lyon') }}

),

operateurs as (

    select
        ville,
        operateur_type,
        operateur_nom,
        velo_type,
        offre_type,

    from source

)

select * from operateurs
