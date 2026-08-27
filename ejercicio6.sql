-- Mostrar para  todos los  rubros  de artículos  código, detalle,  cantidad  de artículos  de  ese 
-- rubro y stock total de ese rubro de artículos. Solo tener en cuenta aquellos artículos que 
-- tengan un stock mayor al del artículo ‘00000000’ en el depósito ‘00’.

select
    r.rubr_id codigo,
    r.rubr_detalle detalle,
    count(distinct p.prod_codigo) articulos,
    isnull(sum(s.stoc_cantidad),0) [stock total]
from
    Rubro r left join Producto p on p.prod_rubro = r.rubr_id
            left join  STOCK s on s.stoc_producto = p.prod_codigo
                               and 
                                   p.prod_codigo in (
                                       select stoc_producto
                                       from stock
                                       group by stoc_producto
                                       having sum(stoc_cantidad) > (select stoc_cantidad from stock where stoc_producto = '00000000' and stoc_deposito = '00') 
                                   )
group by
    r.rubr_id,
    r.rubr_detalle

