with

    source as (select * from {{ source("raw_data", "compteurs_paris") }}),

    renamed as (

        select
            parse_date('%Y-%m', date) as compt_date_ym,
            cast(id_compteur as int64) as id_compteur,
            nom_compteur,
            lat_long,
            cast(comptage as int64) as velos_count

        from source
        order by compt_date_ym, id_compteur

    )

select *
from renamed
