{{ config(
    materialized='incremental',
    unique_key='employee_id'
) }}

with source_data as (
    select
        employee_id,
        employee_name,
        department,
        current_timestamp() as updated_at
    from {{ ref('employee_master') }}
),

scd as (

    {{ dbt_utils.scd_type_2(
        relation=this,
        natural_key='employee_id',
        updated_at='updated_at',
        columns=[
            'employee_name',
            'department'
        ]
    ) }}

)

select * from scd
