{% snapshot snp_customers %}

{{
    config(
      target_schema='snapshots',

      unique_key='customer_key',
      strategy='check',
      check_cols=['address', 'phone_number'],
    )
}}

-- Select the clean data from your staging layer
select * from {{ ref('stg_tpch_customer') }}

{% endsnapshot %}