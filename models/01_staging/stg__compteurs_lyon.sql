with 

source as (

    select * from {{ source('raw_data', 'compteurs_lyon') }}

),

renamed as (

    select
        annee_mois AS compt_date_YM,
        id_compteur,
        nom_compteur,
        LEFT(arr, 6) as arr,
        concat(lat,',',long) as lat_long,      
        cast(comptage as int64) as velos_count
    
    from source
    Where STARTS_WITH(arr, "Lyon") and cast(comptage as int64) is not null
    ORDER BY compt_date_YM, id_compteur

)

select * from renamed
