/*

select *, 
ordersellingprice - ordercostprice as orderprofit 
from RAW.GLOBALMART.ORDERS 
-- one line comment in dbt
from {{ ref('raw_orders') }}
*/

select 
-- from raw_orders
o.orderid,
o.orderdate,
o.shipdate,
o.shipmode,
o.ordersellingprice - o.ordercostprice as orderprofit,
-- from raw_customer
c.customerid,
c.customername,
c.segment,
c.country,

-- from raw_product
p.category,
p.productname,
p.subcategory,
p.productid
from {{ ref('raw_orders') }} as o 
left join {{ ref('raw_customer') }} as c 
on o.customerid = c.customerid
left join {{ ref('raw_product') }} as p 
on o.productid = p.productid
