-- Realizar  una  consulta que  muestre  código  de producto, nombre  de producto  y  el stock 
-- total,  sin  importar  en  que  deposito  se  encuentre,  los  datos  deben  ser  ordenados  por 
-- nombre del artículo de menor a mayor. 

select
    p.prod_codigo codigo,
    p.prod_detalle nombre,
    isnull(sum(s.stoc_cantidad),0) [stock total]
from
    Producto p left join stock s on s.stoc_producto = p.prod_codigo
group by 
    p.prod_codigo,
    p.prod_detalle
order by
    2