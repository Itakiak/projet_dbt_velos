{% macro get_lat_lon(arrondissement) %}
CASE WHEN arrondissement like "Lyon 1" THEN "45.7679, 4.8345"
WHEN arrondissement like "Lyon 2" THEN "45.7540, 4.8289"
WHEN arrondissement like "Lyon 3" THEN "45.7594, 4.8500"
WHEN arrondissement like "Lyon 4" THEN "45.7797, 4.8291"
WHEN arrondissement like "Lyon 5" THEN "45.7570, 4.8136"
WHEN arrondissement like "Lyon 6" THEN "45.7719, 4.8497"
WHEN arrondissement like "Lyon 7" THEN "45.7466, 4.8467"
WHEN arrondissement like "Lyon 8" THEN "45.7357, 4.8787"
WHEN arrondissement like "Lyon 9" THEN "45.7769, 4.8050"
ELSE NULL
END
{% endmacro %}