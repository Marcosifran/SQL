-- Mostrar los 10 productos más vendidos en la historia y también los 10 productos menos 
-- vendidos  en  la  historia.  Además  mostrar  de  esos  productos,  quien  fue  el  cliente  que 
-- mayor compra realizo. 

select * from (
select top 10
    p.prod_detalle [máx vendidos],
    'Más vendido' categoría,
    (
        select top 1 c.clie_razon_social
        from Factura f2 join item_factura i2 on f2.fact_tipo = i2.item_tipo
                                             and f2.fact_sucursal = i2.item_sucursal
                                             and f2.fact_numero = i2.item_numero
                        join Cliente c on f2.fact_cliente = c.clie_codigo
        where i2.item_producto = p.prod_codigo
        group by 
            c.clie_razon_social, 
            c.clie_codigo
        order by sum(i2.item_cantidad) desc
    ) as cliente_mayor_comprador
from
    Factura f join item_factura i on i.item_tipo = f.fact_tipo
                                  and i.item_sucursal = f.fact_sucursal
                                  and i.item_numero = f.fact_numero
              join Producto p on p.prod_codigo = i.item_producto
group by
    p.prod_codigo,
    p.prod_detalle
order by 
    sum(i.item_cantidad) desc
) as producto_mas_vendido
union
select * from (
select top 10
    p.prod_detalle [menos vendidos],
    'Menos vendido' categoria,
    (
        select top 1 c.clie_razon_social
        from Factura f2 join item_factura i2 on f2.fact_tipo = i2.item_tipo
                                             and f2.fact_sucursal = i2.item_sucursal
                                             and f2.fact_numero = i2.item_numero
                        join Cliente c on f2.fact_cliente = c.clie_codigo
        where i2.item_producto = p.prod_codigo
        group by 
            c.clie_razon_social, 
            c.clie_codigo
        order by sum(i2.item_cantidad) desc
    ) as cliente_mayor_comprador
from
    Factura f left join item_factura i on i.item_tipo = f.fact_tipo
                                  and i.item_sucursal = f.fact_sucursal
                                  and i.item_numero = f.fact_numero
              left join Producto p on p.prod_codigo = i.item_producto
group by 
    p.prod_codigo,
    p.prod_detalle
order by 
    sum(i.item_cantidad) asc
) as producto_menos_vendido