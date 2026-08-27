-- Mostrar  el  código  del  jefe,  código  del  empleado  que  lo  tiene  como  jefe,  nombre  del 
-- mismo y la cantidad de depósitos que ambos tienen asignados. 

select
    e.empl_jefe [codigo jefe],
    e.empl_codigo [codigo empleado],
    e.empl_nombre [nombre empleado],
    count(d.depo_codigo) [cantidad de depósitos]
from
    empleado e left join deposito d on d.depo_encargado = e.empl_jefe or d.depo_encargado = e.empl_codigo
where
    e.empl_jefe is not null and e.empl_jefe <> e.empl_codigo
group by
    e.empl_jefe,
    e.empl_codigo,
    e.empl_nombre


