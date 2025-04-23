/*
    Tables
*/

WITH raw_data AS (

    SELECT * FROM {{ source('air_boltic', 'aeroplane_model_json') }}

),

/*
    Formatted
*/

formatted AS (

    SELECT    
        -- Details
        TRY_PARSE_JSON(json) AS json_data
    FROM
        raw_data

)

SELECT * FROM formatted