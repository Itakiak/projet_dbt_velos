with

    source as (select * from {{ ref('stg__data_meteo_paris') }}),

    renamed as (

        select
            meteo_date_YM,
            round(avg(windspeed_max_kmh), 2) as avg_windspd_kmh,
            round(avg(precip_total_day_mm), 2) as avg_precip_mm,
            round(avg(heatindex_max_c), 2) as avg_heatindex,
            round(avg(total_snow_mm), 2) as avg_snow_mm,
            round(avg(avg_temp_day), 2) as avg_temp,
            round(avg(windchill), 2) as avg_windchill

        from source
        group by meteo_date_YM
        order by meteo_date_YM

    )

select *
from renamed
