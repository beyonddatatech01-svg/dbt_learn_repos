{{ config(
    materialized='incremental',
    unique_key='CLAIM_ID'
) }}

with claims as (
    select *
    from {{ ref('stg_expense_claims') }}
),

employees as (
    select *
    from {{ ref('employee_master') }}
)

select
    c.claim_id,
    c.employee_id,
    e.employee_name,
    e.department,
    c.claim_date,
    c.amount,
    c.status,
    c.description
from claims c
left join employees e
   on c.employee_id = e.employee_id

{% if is_incremental() %}
    where c.loaded_at > (
        select max(loaded_at) from {{ this }}
    )
{% endif %}
