
/*
    Tables
*/

WITH raw_data AS (

    SELECT * FROM {{ source('air_boltic', 'order') }}

),

/*
    Formatted
*/

formatted AS (

    SELECT 
        -- PK
        CAST(order_id AS STRING) AS order_id,

        -- FK
        CAST(customer_id AS STRING) AS customer_id,
        CAST(trip_id AS STRING) AS trip_id,

        -- Details
        CAST(seat_no AS STRING ) AS seat_no, 
        CAST(status AS STRING) AS order_status
        
        -- Price Information
        CAST(Price_EUR  AS FLOAT) AS price_eur
    from raw_data
     
)

SELECT * FROM formatted