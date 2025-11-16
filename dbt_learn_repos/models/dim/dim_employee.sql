{{ config(materialized='table') }}

select *
from {{ ref('employee_master') }}
