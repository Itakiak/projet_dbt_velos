with
    source_meteo as (select * from {{ ref("int__data_meteo_lyon") }}),

    source_compteurs as (
        select compt_date_ym, SUM(avg_compt) as avg_compt
        from {{ ref("int__compteurs_annee_mois_lyon") }}
        group by compt_date_ym
    ),

    joined_data as (
        select
            m.meteo_date_ym,
            m.avg_windspd_kmh,
            m.avg_precip_mm,
            m.avg_heatindex,
            m.avg_snow_mm,
            m.avg_temp,
            m.avg_windchill,
            c.avg_compt as bikes_avg_count,
        from source_compteurs c
        join source_meteo m on c.compt_date_ym = m.meteo_date_ym
    )

select *
from joined_data
order by meteo_date_ym
