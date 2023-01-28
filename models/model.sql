{{ config(
    materialized="table"
) }}


SELECT 
    ROW_NUMBER() OVER () AS id
    , *
    , CAST(now() AS timestamp) AS refresh_timestamp
FROM {{ ref('employment_indicators_november_2022_csv_tables') }}