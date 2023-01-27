
      
  
    create table
    analytics_dev.model_snapshot
  with (
    table_type='hive',
    is_external=true,
    external_location='s3://dbt-athena/analytics_dev/model_snapshot/856809d7-fcfb-46f0-be56-80ee154bcd0c',
    format='parquet'
  )
  as
    
    SELECT *
      , id AS dbt_unique_key
      , refresh_timestamp AS dbt_valid_from
      , to_hex(md5(to_utf8(coalesce(cast(id as varchar ), '')
         || '|' || coalesce(cast(refresh_timestamp as varchar ), '')
        ))) AS dbt_scd_id
      , 'insert' AS dbt_change_type
      , CAST('9999-01-01' as timestamp) AS dbt_valid_to
      , True AS is_current_record
      , -- pyathena converts time zoned timestamps to strings so lets avoid them
    -- now()
    cast(now() as timestamp) AS dbt_snapshot_at
    FROM (


SELECT * from analytics_dev.model
) source;


  
  