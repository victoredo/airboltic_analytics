/*
    Tables
*/

SELECT
    -- PK
    customer_group_id,

    --Details
    type,
    name,
    registry_number
FROM  {{ ref('stg_air_boltic_customer_groups') }}