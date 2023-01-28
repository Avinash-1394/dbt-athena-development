{% snapshot model_snapshot_3 %}

{{ 
    config
    (
        target_database='awsdatacatalog',
        target_schema='analytics_dev',
        unique_key='id',
        strategy='timestamp',
        updated_at='refresh_timestamp',
        invalidate_hard_deletes=True,
    ) 
}}
SELECT * from {{ ref('model') }}

{% endsnapshot %}