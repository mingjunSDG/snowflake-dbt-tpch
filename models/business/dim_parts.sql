{{ config(materialized='table') }}

select * from {{ ref('stg_tpch_parts') }}