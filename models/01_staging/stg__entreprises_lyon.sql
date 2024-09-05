with 

source as (

    select * from {{ source('raw_data', 'entreprises_lyon') }}

),

renamed as (

    select
        siren,
        codepostaletablissement,
        arrondissement,
        datecreationetablissement

    from source

)

select * from renamed
