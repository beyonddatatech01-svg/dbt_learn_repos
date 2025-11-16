{{ config(materialized='table') }}

select
    claim_id,
    employee_id,
    claim_date,
    amount,
    status,
    description
from {{ ref('stg_expense_claims') }}
