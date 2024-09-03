with 

source as (

    select * from {{ source('raw_data', 'compteurs_paris') }}

),

renamed as (

    select
        parse_date('%Y-%m', date) as compt_date_YM,
        cast(id_compteur as INT64) as id_compteur,
        nom_compteur,
        lat_long,
        cast(comptage as int64) as velos_count

    from source
    ORDER BY compt_date_YM, id_compteur

)

select * from renamed
