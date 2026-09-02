use [GD2015C1]
-- Realizar una consulta que retorne el detalle de la familia, la cantidad diferentes de
-- productos vendidos y el monto de dichas ventas sin impuestos. Los datos se deberán
-- ordenar de mayor a menor, por la familia que más productos diferentes vendidos tenga,
-- solo se deberán mostrar las familias que tengan una venta superior a 20000 pesos para
-- el año 2012.

select
    fa.fami_detalle detalle,
    count(distinct p.prod_codigo) [productos distintos vendidos],
    sum(i.item_cantidad * i.item_precio) [total sin impuesto]
from
    Factura f join item_factura i on i.item_tipo = f.fact_tipo
                                  and i.item_sucursal = f.fact_sucursal
                                  and i.item_numero = f.fact_numero                                  
              join Producto p on p.prod_codigo = i.item_producto
              join Familia fa on fa.fami_id = p.prod_familia
where
    year(f.fact_fecha) = 2012
group by
    fa.fami_detalle
having
   sum(i.item_cantidad * i.item_precio) > 20000
order by
    2 desc