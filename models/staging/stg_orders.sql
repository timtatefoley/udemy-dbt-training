select 
-- COMMENT:  from raw orders
ord.orderid,
ord.orderdate,
ord.shipdate,
ord.shipmode,
ord.ordercostprice2ordersellingprice - ord.ordercostprice as orderprofit,
ord.ordercostprice,
ord.ordercostprice2ordersellingprice,
-- COMMENT:  from raw customer
cu.customerid,
cu.customername,
cu.segment,
cu.country,
-- COMMENT:  from raw product
pr.productid,
pr.category,
pr.productname,
pr.subcategory,
{{ markup('ordercostprice2ordersellingprice','ordercostprice') }} as markup
from {{ ref('raw_orders') }} as ord
left join {{ ref('raw_customer') }} as cu
on ord.customerid = cu.customerid
left join {{ ref('raw_product') }} as pr 
on ord.productid = pr.productid