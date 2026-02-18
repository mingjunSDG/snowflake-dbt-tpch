{% snapshot snp_parts %}

{{
    config(
      target_schema='snapshots',
      unique_key='part_key',
      strategy='check',
      check_cols=['retail_price', 'manufacturer'],
    )
}}

select * from {{ ref('stg_tpch_parts') }}

{% endsnapshot %}