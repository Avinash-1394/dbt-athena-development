{{ config(
    materialized="table"
) }}


SELECT 
    ROW_NUMBER() OVER () AS id
    , *
    , '{{ run_started_at.strftime("%Y-%m-%d %H:%M:%S") }}' AS refresh_timestamp
FROM {{ ref('employment_indicators_november_2022_csv_tables') }}