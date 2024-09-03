with 

source as (

    select * from {{ ref('stg__compteurs_paris') }}

),

renamed as (

    select
        compt_date_YM,
        id_compteur,
        nom_compteur,
        lat_long,
        velos_count

    from source
    ORDER BY compt_date_YM, id_compteur

)

select * from renamed
