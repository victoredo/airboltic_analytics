{{
    config(
        partition_by=["type"]
    )
}}
/*
    Tables
*/

WITH raw_data AS (

    SELECT * FROM {{ source('air_boltic', 'customer_group') }}

),

/*
    Formatted
*/

formatted AS (

   SELECT
        -- PK
        CAST(id AS STRING) AS customer_group_id,

        --Details
        CAST(type AS STRING) AS type,
        CAST(name as string) AS name,
        CAST(registry_number AS STRING) AS registry_number
    from raw_data
       
)

SELECT * FROM formatted
