with 

source as (

    select * from {{ source('raw_data', 'tourisme') }}

),

renamed as (

    select
        theme,
        nom,
        id,
        date_creation,
        lat_long,
        arr

    from source

)

select * from renamed
