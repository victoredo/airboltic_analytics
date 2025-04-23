
/*
    Tables
*/

SELECT 
   -- PK
   order_id,

    -- FK
    customer_id,
    trip_id,

    -- Details
    seat_no, 
    order_status

    -- Price Information
     price_eur
FROM {{ ref('stg_air_boltic_orders') }}
