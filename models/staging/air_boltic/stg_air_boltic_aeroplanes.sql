
{{
    config(
        partition_by=["manufacturer"]
    )
}}
/*
    Tables
*/

WITH raw_data AS (

    SELECT * FROM {{ source('air_boltic', 'aeroplane') }}

),

/*
    Formatted
*/

formatted as (
    
    SELECT
        -- PK
        CAST(airplane_id AS STRING) as airplane_id,

        --FK
        CAST(airplane_model AS STRING) as model_id,

        --Details
        CAST(manufacturer AS STRING) as manufacturer
    from  raw_data
       
)

SELECT * FROM formatted
