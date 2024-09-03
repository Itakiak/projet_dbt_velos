with 

source as (

    select * from {{ source('raw_data', 'altitude_arr_lyon') }}

),

renamed as (

    select
        arr_id,
        alt_moy,
        alt_class,
        alt_cat

    from source

)

select * from renamed
