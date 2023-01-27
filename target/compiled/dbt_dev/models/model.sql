


SELECT 
    ROW_NUMBER() OVER () AS id
    , *
    , '2023-01-27 22:03:30' AS refresh_timestamp
FROM analytics_dev.employment_indicators_november_2022_csv_tables