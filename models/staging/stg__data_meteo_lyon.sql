with 

source as (

    select * from {{ source('raw_data', 'data_meteo_lyon') }}

),

renamed as (

    select
        date,
        windspeed_max_kmh,
        precip_total_day_mm,
        heatindex_max_c,
        total_snow_mm,
        avg_temp_day,
        windchill

    from source

)

select * from renamed
