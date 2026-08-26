-- Mostrar el código, detalle de todos los artículos vendidos en el año 2012 ordenados por 
-- cantidad vendida.

select
    p.prod_codigo codigo,
    p.prod_detalle detalle
from
    Factura f join item_factura i on i.item_tipo = f.fact_tipo
                                  and i.item_sucursal = f.fact_sucursal
                                  and i.item_numero = f.fact_numero
                                  and year(f.fact_fecha) = 2012
              join Producto p on p.prod_codigo = i.item_producto
group by 
    p.prod_codigo, 
    p.prod_detalle
order by
    sum(i.item_cantidad)