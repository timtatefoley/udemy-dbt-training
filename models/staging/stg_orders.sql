select 
-- COMMENT:  from raw orders
{{ dbt_utils.generate_surrogate_key(['ord.orderid', 'cu.customerid','pr.productid']) }} as sk_orders,
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
{{ markup('ordercostprice2ordersellingprice','ordercostprice') }} as markup,
de.delivery_team
from {{ ref('raw_orders') }} as ord
left join {{ ref('raw_customer') }} as cu
on ord.customerid = cu.customerid
left join {{ ref('raw_product') }} as pr 
on ord.productid = pr.productid
left join {{ ref('delivery_team') }} as de
on ord.shipmode = de.shipmode