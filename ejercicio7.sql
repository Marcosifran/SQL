-- Generar  una  consulta  que  muestre  para  cada  artículo  código,  detalle,  mayor  precio 
-- menor precio  y  %  de la  diferencia  de precios (respecto  del  menor Ej.:  menor precio = 
-- 10,  mayor  precio  =12  =>  mostrar  20  %).  Mostrar  solo  aquellos  artículos  que  posean 
-- stock.

select
    p.prod_codigo codigo,
    p.prod_detalle detalle,
    min(i.item_precio) [precio mínimo],
    max(i.item_precio) [precio máximo],
    cast(((max(i.item_precio) - min(i.item_precio)) * 100.0) / nullif(min(i.item_precio),0) AS DECIMAL(10,2)) [porcentaje de diferencia]
from
    producto p join stock s on s.stoc_producto = p.prod_codigo
               join item_factura i on i.item_producto = p.prod_codigo
where
    s.stoc_cantidad > 0
group by
    p.prod_codigo,
    p.prod_detalle