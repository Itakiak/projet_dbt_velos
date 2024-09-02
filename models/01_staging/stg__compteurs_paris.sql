with 

source as (

    select * from {{ source('raw_data', 'compteurs_paris') }}

),

renamed as (

    select
        date as compt_date_YM,
        cast(id_compteur as INT64) as id_compteur,
        nom_compteur,
        lat_long,
        comptage as velos_count

    from source
    ORDER BY compt_date_YM, id_compteur

)

select * from renamed
