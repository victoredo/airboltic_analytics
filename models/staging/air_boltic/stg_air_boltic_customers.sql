{{
    config(
        partition_by=["customer_group_id"]
    )
}}

/*
    Tables
*/

WITH raw_data AS (

    SELECT * FROM {{ source('air_boltic', 'customer') }}

),

/*
    Formatted
*/

formatted AS (

    SELECT
        -- PK
        CAST(customer_id AS STRING) AS customer_id,

        -- FK
        CAST(customer_group_id AS STRING) AS customer_group_id,

        -- Details
        CAST(name AS STRING) AS customer_name,
        CAST(email AS STRING) AS email
    from raw_data 
       
)

SELECT * FROM formatted
