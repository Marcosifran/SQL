-- Realizar una consulta que retorne para cada producto que posea composición nombre
-- del producto, precio del producto, precio de la sumatoria de los precios por la cantidad 
-- de los productos que lo componen. Solo se deberán mostrar los productos que estén
-- compuestos por más de 2 productos y deben ser ordenados de mayor a menor por
-- cantidad de productos que lo componen.

select 
	p1.prod_detalle nombre,
	p1.prod_precio precio,
	sum(c.comp_cantidad  * p2.prod_precio) [precio total componentes]
from
	Producto p1 join Composicion c on c.comp_producto = p1.prod_codigo 
				join Producto p2 on p2.prod_codigo = c.comp_componente  
group by 	
	p1.prod_codigo,
	p1.prod_detalle,
	p1.prod_precio
having
	count(p2.prod_codigo) > 2
order by 
	count(p2.prod_codigo) desc
	

