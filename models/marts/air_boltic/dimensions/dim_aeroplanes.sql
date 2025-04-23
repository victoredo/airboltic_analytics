/*
    Tables
*/

SELECT
    -- PK
    airplane_id,

    --FK
    model_id,

    --Details
    manufacturer
FROM {{ ref('stg_air_boltic_aeroplanes') }}
