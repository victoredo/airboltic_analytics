
{{
    config(
        incremental_strategy='microbatch',
        event_time='start_timestampe',
        begin='2024-08-01' if target.name == 'prod' else modules.datetime.datetime.now().isoformat(),
        lookback=1,
        batch_size='month',
        partition_by=['start_timestamp']
    )
}}
/*
    Tables
*/

SELECT
    -- PK
    trip_id,

    -- FK
    airplane_id,

    -- Details
    origin_city,
    destination_city,

    -- Timestamps
    start_timestamp, 
    end_timestamp
FROM {{ ref('stg_air_boltic_trips') }}