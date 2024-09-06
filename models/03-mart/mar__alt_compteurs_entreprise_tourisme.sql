with
    source_alt as (
     select 
        arr_id as arr,
        avg(alt_moy) as alt_moy,
        sum(bikes_avg_count) as bikes_avg_count
     from {{ ref("mar__alt_arr_lyon") }}
     group by arr
     ),

     source_entreprises as (
        select 
            arrondissement as arr,
            count(*) as nb_entreprise
        from {{ ref('stg__entreprises_lyon') }}
        group by arrondissement
     ),
    
    source_tourisme as (select 
        arr,
        count(id) as nb_lieux_tourisme
     from {{ ref("stg__tourisme") }}
     group by arr),

    

    joined_data as (
        select
            a.arr,
            a.alt_moy,
            a.bikes_avg_count,
            e.nb_entreprise,
            t.nb_lieux_tourisme
        from source_alt a
        inner join source_entreprises e
        using(arr)

        inner join source_tourisme t
        using(arr)
    )

select *
from joined_data
