with

    source as (select * from {{ source("raw_data", "data_meteo_lyon") }}),

    renamed as (

        select 
        parse_date('%F', date) as date_formated,
        FORMAT_DATETIME('%B', parse_date('%F', date)) AS annee_mois,
        # round(avg(windspeed_max_kmh),2),
        # round(avg(precip_total_day_mm),2),
        # round(avg(heatindex_max_c),2),
        # round(avg(total_snow_mm),2),
        # round(avg(avg_temp_day),2),
        # round(avg(windchill),2)

        GROUP BY annee_mois
        ORDER BY annee_mois
        
        from source

    )

select *
from renamed
