with 

source as (

    select * from {{ source('raw_data', 'compteurs_lyon') }}

),

renamed as (

    select
        FORMAT_DATE('%Y-%m', annee_mois) AS compt_date_YM,
        id_compteur,
        nom_compteur,
        LEFT(arr, 6) as arr,
        concat(lat,',',long) as lat_long,      
        cast(comptage as int64) as velos_count
    
    from source
    Where STARTS_WITH(arr, "Lyon")
    ORDER BY compt_date_YM, id_compteur

)

select * from renamed
