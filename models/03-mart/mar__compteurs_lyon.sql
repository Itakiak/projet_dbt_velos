with 

source as (

    select * from {{ ref('stg__compteurs_lyon') }}


),

renamed as (

    select
        compt_date_YM,
        id_compteur,
        nom_compteur,
        arr,
        lat_long,      
        velos_count
    
    from source
    Where STARTS_WITH(arr, "Lyon")
    ORDER BY compt_date_YM, id_compteur

)

select * from renamed
