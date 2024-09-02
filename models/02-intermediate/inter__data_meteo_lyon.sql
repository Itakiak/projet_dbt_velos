with

    source as (select * from {{ source("raw_data", "data_meteo_lyon") }}),

    renamed as (

        select
            format_date('%Y-%m', parse_date('%F', date)) as annee_mois,
            round(avg(windspeed_max_kmh), 2) as AVG_windspd_kmh,
            round(avg(precip_total_day_mm), 2) as AVG_precip_mm,
            round(avg(heatindex_max_c), 2) as AVG_heatindex,
            round(avg(total_snow_mm), 2) as AVG_snow_mm,
            round(avg(avg_temp_day), 2) as AVG_temp,
            round(avg(windchill), 2) as AVG_windchill


        from source
        group by annee_mois
        order by annee_mois

    )

select *
from renamed
