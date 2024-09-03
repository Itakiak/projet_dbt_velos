select
    id,
    commune,
    amenagement,
    senscirculation,
    livraison_date,
    longueur,
    gid,
    geometry,
    avg_compt
from {{ ref("stg__lyon_pistes_cyclables") }} as t1
join {{ ref("int__compteurs_annee_lyon") }} as t2 on t1.livraison_date = t2.compt_year
