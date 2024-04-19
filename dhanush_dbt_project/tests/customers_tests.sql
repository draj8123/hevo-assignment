-- Test for uniqueness of customer_id
select customer_id
from {{ ref('customers') }}
group by customer_id
having count(*) > 1

-- Test for null values in first_name column
select first_name
from {{ ref('customers') }}
where first_name is null
