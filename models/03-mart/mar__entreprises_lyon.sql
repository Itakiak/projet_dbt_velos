select 
        siren,
        codepostaletablissement,
        arrondissement,
        datecreationetablissement,
        {{ get_lat_lon(arrondissement) }} as coordinates
        
from {{ ref('stg__entreprises_lyon') }}
