with
    source_meteo as (select * from {{ ref("int__data_meteo_paris") }}),

    source_compteurs as (select * from {{ ref("int__compteurs_annee_mois_paris") }}),

    joined_data as (
        select
            c.compt_date_ym,
            c.avg_compt,
            m.avg_windspd_kmh,
            m.avg_precip_mm,
            m.avg_heatindex,
            m.avg_snow_mm,
            m.avg_temp,
            m.avg_windchill
        from source_compteurs c
        inner join source_meteo m on c.compt_date_ym = m.meteo_date_ym
    )

select *
from joined_data
order by compt_date_ym
