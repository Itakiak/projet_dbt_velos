with 

source as (

    select * from {{ source('raw_data', 'compteurs_lyon') }}

),

renamed as (

    select
        FORMAT_DATE('%Y-%m', annee_mois) AS annee_mois,
        id_compteur,
        nom_compteur,
        arr,
        concat(lat,',',long) as lat_long,      
        cast(comptage as int64) as velos_count
    
    from source
    Where STARTS_WITH(arr, "Lyon")

)

select * from renamed
