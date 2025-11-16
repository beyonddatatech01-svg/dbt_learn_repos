version: 2

models:
  - name: fct_expense_claims
    columns:
      - name: claim_id
        tests:
          - not_null
          - unique

      - name: employee_id
        tests:
          - not_null
          - relationships:
              to: ref('dim_employee')
              field: employee_id

      - name: amount
        tests:
          - not_null
          - accepted_range:
              min_value: 1
