-- Mostrar  para  el  o  los  artículos  que  tengan  stock  en  todos  los  depósitos,  nombre  del 
-- artículo, stock del depósito que más stock tiene.

select
    p.prod_detalle nombre,
    max(s.stoc_cantidad) [stock maximo]
from
    producto p join stock s on s.stoc_producto = p.prod_codigo
group by 
    p.prod_detalle,
    p.prod_codigo
having
    count(distinct s.stoc_deposito) = (select count(*) from deposito)