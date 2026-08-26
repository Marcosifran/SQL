-- Mostrar el código, razón social de todos los clientes cuyo límite de crédito sea mayor o 
-- igual a $ 1000 ordenado por código de cliente. 


select
    c.clie_codigo codigo,
    c.clie_razon_social [razon social]
from
    Cliente c
where
    c.clie_limite_credito > 1000
group by 
    c.clie_codigo, c.clie_razon_social
order by 
    1