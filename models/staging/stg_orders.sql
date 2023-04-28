select 
-- COMMENT:  from raw orders
ord.orderid,
ord.orderdate,
ord.shipdate,
ord.shipmode,
ord.productid,
ord.ordercostprice2ordersellingprice,
ord.ordercostprice,
ord.ordercostprice2ordersellingprice - ord.ordercostprice as orderprofit,
-- COMMENT:  from raw customer
cu.customerid,
cu.customername,
cu.segment,
cu.country,
-- COMMENT:  from raw product
pr.category,
pr.productname,
pr.subcategory
from {{ ref('raw_orders') }} as ord
left join {{ ref('raw_customer') }} as cu
on ord.customerid = cu.customerid
left join {{ ref('raw_product') }} as pr 
on ord.productid = pr.productid