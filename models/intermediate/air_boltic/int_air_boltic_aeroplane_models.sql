{{
    config(
        materialized='table'
    )
}}

/*
    Tables
*/

WITH raw_data AS (

    SELECT * FROM {{ ref('stg_air_boltic_aeroplane_models') }}

),

/*
    Transformation
*/

-- get manufacturers key and value from json input
manufacturers AS (

    SELECT
        json_manufacturer.key AS manufacturer,
        json_manufacturer.value AS models
    FROM raw_data
        LATERAL VIEW explode(from_json(json_data, 'map<string, map<string, struct<max_seats:int, max_weight:int, max_distance:int, engine_type:string>>>')) json_manufacturer

),

aeroplane_models AS (

    SELECT
        manufacturer,
        json_model.key AS model_id,
        json_model.value AS specs
    FROM manufacturers
    LATERAL VIEW explode(models) json_model

),

--extra details about aeroplane models
aeroplane_model_specifications AS (

    SELECT
        manufacturer,
        model_id,
        specs.max_seats AS max_seats,
        specs.max_weight AS max_weight,
        specs.max_distance AS max_distance,
        specs.engine_type AS engine_type
    FROM aeroplane_models 

),


/*
    Formatted
*/

formatted AS (

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
    FROM  aeroplane_model_specifications

)

SELECT * FROM formatted