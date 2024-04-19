{{ config(materialized='table') }}

select
    c.id as customer_id,
    c.first_name,
    c.last_name,
    min(o.order_date) as first_order,
    max(o.order_date) as most_recent_order,
    count(distinct o.id) as number_of_orders,
    sum(p.amount) as customer_lifetime_value
from "RON"."DARK_ARTS"."CUSTOMER_TABLE_RAW_CUSTOMERS" c
left join "RON"."DARK_ARTS"."CUSTOMER_TABLE_RAW_ORDERS" o on c.id = o.user_id
left join "RON"."DARK_ARTS"."CUSTOMER_TABLE_RAW_PAYMENTS" p on o.id = p.order_id
group by c.id, c.first_name, c.last_name