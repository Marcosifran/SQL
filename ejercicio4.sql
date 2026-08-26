-- Realizar una consulta que muestre para todos los artículos código, detalle y cantidad de 
-- artículos  que  lo  componen.  Mostrar  solo  aquellos  artículos  para  los  cuales  el  stock 
-- promedio por depósito sea mayor a 100. 

select
    p.prod_codigo codigo,
    p.prod_detalle nombre, 
    count(distinct c.comp_componente) [cantidad de artículos]
from
    Producto p join composicion c on c.comp_producto = p.prod_codigo
               join stock s on s.stoc_producto = p.prod_codigo
group by 
    p.prod_codigo,
    p.prod_detalle
having
    avg(s.stoc_cantidad) > 100
    