
{{
    config(
        event_time='start_timestamp'
    )
}}
/*
    Tables
*/

WITH raw_data AS (

    SELECT * FROM {{ source('air_boltic', 'trip') }}

),

formatted AS (

    SELECT
        -- PK
        CAST(trip_id AS STRING) AS trip_id,

        -- FK
        CAST(airplane_id AS STRING) AS airplane_id,

        -- Details
        CAST(origin_city AS string) AS origin_city,
        CAST(destination_city AS string) AS destination_city,

        -- Timestamps
        CAST(start_timestamp AS TIMESTAMP) AS start_timestamp, 
        CAST(end_timestamp AS TIMESTAMP) AS end_timestamp
    from raw_data

)

SELECT * FROM formatted