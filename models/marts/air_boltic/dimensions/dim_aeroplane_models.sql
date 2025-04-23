/*
    Tables
*/

 SELECT
    -- PK
    model_id,

    -- Details
    manufacturer,
    engine_type,

    -- Measures
    max_seats,
    max_weight,
    max_distance
FROM {{ ref('int_air_boltic_aeroplane_models') }}