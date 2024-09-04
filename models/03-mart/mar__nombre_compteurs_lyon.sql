with 

source as (

    select * from {{ ref('stg__compteurs_lyon') }}


),

renamed as (

    select
        compt_date_YM,
        COUNT(distinct id_compteur) AS nb_compteur
    
    from source
    where velos_count is not null
    GROUP BY compt_date_ym
    ORDER BY compt_date_ym

)

select * from renamed
