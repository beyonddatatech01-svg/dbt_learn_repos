{{ config(materialized='view') }}

select
    CLAIM_ID,
    EMPLOYEE_ID,
    CLAIM_DATE,
    AMOUNT,
    STATUS,
    DESCRIPTION,
    LOADED_AT
from {{ source('raw_expense', 'expense_claims') }}
