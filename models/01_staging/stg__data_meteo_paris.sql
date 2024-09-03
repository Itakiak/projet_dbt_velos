with

    source as (select * from {{ source("raw_data", "data_meteo_paris") }}),

    renamed as (

        select
            format_date('%Y-%m',date) AS meteo_date_YM,
            windspeed_max_kmh,
            precip_total_day_mm,
            heatindex_max_c,
            total_snow_mm,
            avg_temp_day,
            windchill


        from source

    )

select *
from renamed
