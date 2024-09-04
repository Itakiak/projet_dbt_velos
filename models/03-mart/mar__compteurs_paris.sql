with

    source as (select * from {{ ref("stg__compteurs_paris") }}),

    renamed as (

        select format_date('%Y-%m', compt_date_ym) as compt_date_ym, id_compteur, nom_compteur, lat_long, velos_count

        from source
        order by compt_date_ym, id_compteur

    )

select *
from renamed
