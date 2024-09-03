SELECT
        id,
        commune,
        amenagement,
        senscirculation,
        CAST(CAST(anneelivraison AS INT64) AS STRING) AS anneelivraison_year,
        longueur,
        gid,
        geometry
  FROM
    {{ ref('stg__lyon_pistes_cyclables')}}