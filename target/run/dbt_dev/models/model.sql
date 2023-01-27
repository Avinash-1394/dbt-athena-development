
  
    create table
    analytics_dev.model
  with (
    table_type='hive',
    is_external=true,
    external_location='s3://dbt-athena/analytics_dev/model/25ba09ce-e6b4-4152-b804-545e504ac2d6',
    format='parquet'
  )
  as
    


SELECT 
    ROW_NUMBER() OVER () AS id
    , *
    , '2023-01-27 22:03:30' AS refresh_timestamp
FROM analytics_dev.employment_indicators_november_2022_csv_tables

  