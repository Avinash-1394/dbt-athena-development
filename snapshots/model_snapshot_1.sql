{% snapshot model_snapshot_1 %}

{{ 
    config
    (
        target_database='awsdatacatalog',
        target_schema='analytics_dev',
        unique_key='id',
        strategy='timestamp',
        updated_at='refresh_timestamp',
    ) 
}}
SELECT * from {{ ref('model') }}

{% endsnapshot %}