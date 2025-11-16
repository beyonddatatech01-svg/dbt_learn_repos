{{ config(
    materialized='table'
) }}

select
    employee_id,
    employee_name,
    department,
    dbt_valid_from       as valid_from,
    dbt_valid_to         as valid_to,
    case
        when dbt_valid_to is null then 'Y'
        else 'N'
    end as is_current
from {{ ref('employee_snapshot') }}
order by employee_id, valid_from
