with
    source_meteo as (
        select
            date_trunc(meteo_date, month) as meteo_date_ym,
            case when precip_total_day_mm >= 0.3 then 1 else 0 end as rain_day
        from {{ ref("stg__data_meteo_lyon") }}

    ),

    grouped_rain as (
        select meteo_date_ym, sum(rain_day) as nb_rainy_day
        from source_meteo
        group by meteo_date_ym
    ),

    source_compteurs as (
        select compt_date_ym, sum(avg_compt) as avg_compt
        from {{ ref("int__compteurs_annee_mois_lyon") }}
        group by compt_date_ym
    ),

    joined_data as (
        select gp.meteo_date_ym, gp.nb_rainy_day, c.avg_compt as bikes_avg_count,
        from source_compteurs c
        join grouped_rain gp on c.compt_date_ym = gp.meteo_date_ym
    )

select *
from joined_data
order by meteo_date_ym
