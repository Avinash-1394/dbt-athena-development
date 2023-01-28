{% snapshot model_snapshot_2 %}

{{ 
    config
    (
        target_database='awsdatacatalog',
        target_schema='analytics_dev',
        unique_key='id',
        strategy='check',
        check_cols=['series_reference','data_value'],
    ) 
}}
SELECT * from {{ ref('model') }}

{% endsnapshot %}