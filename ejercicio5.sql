-- Realizar  una  consulta que  muestre  código  de artículo, detalle  y  cantidad  de  egresos  de 
-- stock  que  se  realizaron  para  ese  artículo  en  el  año  2012  (egresan  los  productos  que 
-- fueron vendidos). Mostrar solo aquellos que hayan tenido más egresos que en el 2011. 

select
    p.prod_codigo codigo,
    p.prod_detalle detalle,
    sum(i.item_cantidad) egresos
from
    Factura f join item_factura i on i.item_tipo = f.fact_tipo
                                  and i.item_sucursal = f.fact_sucursal
                                  and i.item_numero = f.fact_numero
                                  and year(f.fact_fecha) = 2012
              join producto p on p.prod_codigo = i.item_producto
group by
    p.prod_codigo,
    p.prod_detalle
having 
    sum(i.item_cantidad) > (
    select
        isnull(sum(i2.item_cantidad), 0)
    from
        item_factura i2 join Factura f2 on i2.item_tipo = f2.fact_tipo
                                        and i2.item_sucursal = f2.fact_sucursal
                                        and i2.item_numero = f2.fact_numero
    where
        i2.item_producto = p.prod_codigo
        and year(f2.fact_fecha) = 2011)