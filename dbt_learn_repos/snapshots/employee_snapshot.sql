{% snapshot employee_snapshot %}
{{
    config(
        target_schema='NM',
        target_database='NAGAMANI',
        unique_key='EMPLOYEE_ID',
        strategy='timestamp',
        updated_at='loaded_at'
    )
}}

select
    employee_id,
    employee_name,
    department,
    loaded_at
from {{ source('raw_expense', 'expense_claims') }}

{% endsnapshot %}
