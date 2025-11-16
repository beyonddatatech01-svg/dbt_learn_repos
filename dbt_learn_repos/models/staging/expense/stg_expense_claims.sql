{{ config(
    materialized='view'
) }}

select
    claim_id,
    employee_id,
    claim_date,
    amount,
    status,
    description,
    loaded_at
from {{ source('raw_expense', 'expense_claims') }}
