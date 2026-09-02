-- Mostrar nombre de producto, cantidad de clientes distintos que lo compraron importe
-- promedio pagado por el producto, cantidad de depósitos en los cuales hay stock del
-- producto y stock actual del producto en todos los depósitos. Se deberán mostrar
-- aquellos productos que hayan tenido operaciones en el año 2012 y los datos deberán
-- ordenarse de mayor a menor por monto vendido del producto.
use [GD2015C1]
select
    p.prod_detalle producto,
    count(distinct f.fact_cliente) [cantidad de clientes que compraron],
    avg(i.item_precio) [promedio pagado del producto],
    (
        select count(s1.stoc_deposito)
        from stock s1
        where s1.stoc_producto = p.prod_codigo 
        and s1.stoc_cantidad > 0
    ) as [depositos con stock],
    isnull((
        select sum(s2.stoc_cantidad)
        from stock s2
        where s2.stoc_producto = p.prod_codigo
    ), 0) as [stock en todos los depositos]
from
    Factura f join item_factura i on i.item_tipo = f.fact_tipo
                                  and i.item_sucursal = f.fact_sucursal
                                  and i.item_numero = f.fact_numero
              join Producto p on p.prod_codigo = i.item_producto
where
    year(f.fact_fecha) = 2012
group by
    p.prod_codigo,
    p.prod_detalle
order by
    sum(i.item_cantidad * i.item_precio) desc