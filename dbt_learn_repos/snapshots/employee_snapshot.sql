{% snapshot employee_snapshot %}

{{
    config(
        target_schema='NM',
        unique_key='EMPLOYEE_ID',
        strategy='timestamp',
        updated_at='LOADED_AT'
    )
}}

select
    EMPLOYEE_ID,
    LOADED_AT
from {{ source('raw_expense', 'expense_claims') }}

{% endsnapshot %}
