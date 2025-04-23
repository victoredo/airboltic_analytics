/*
    Tables
*/

 SELECT
    -- PK
    customer_id,

    -- FK
    customer_group_id,

    -- Details
    customer_name,
    email
FROM {{ ref('stg_air_boltic_customers') }}