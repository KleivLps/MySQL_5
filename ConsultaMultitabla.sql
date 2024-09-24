/*Union de empleados con departamentos*/

select e.nombre, e.apellido, e.salario, d.nombre AS nombre_departamento
from empleados e join departamentos d on e.departamento_id = d.id;

/*union de ventas con empleados mostrando todas las columnas de ventas excepto 'empleado_id'
reemplazando por nombres y apellidos*/

select v.*, e.nombre, e.apellido from ventas v
join empleados e on v.id = e.id;

/*Union de ventas con productos mostrando todas las columnas de ventas excepto 'producto_id'
reemplazando por nombre y apellido*/

select v.*, p.nombre as nombre_producto
from ventas v join productos p on v.id = p.id;

/*Union de ventas con clientes mostrando todas las columnas de ventas excepto 'cliente_id'
reemplazando por el nombre del cliente*/

select v.*, c.nombre as nombre_cliente
from ventas v
join clientes c on v.id = c.id;

/*Union de ventas con empleados y departamentos mostrando todas las columnas
de ventas excepto 'empleado_id' reemplazando por nombre, apellido y el nombre
del departamento*/

select v.*, e.nombre, e.apellido, d.nombre as nombre_departamento
from ventas v join empleados e on v.id = e.id
join departamentos d on e.id = d.id;

/*Union de ventas, empleados, productos y clientes mostrando las columnas de ventas reemp
lazando las foreign keys con las respectivas columnas de 'nombre'*/

select v.*, e.nombre as nombre_empleado, e.apellido as apellido_empleado, 
p.nombre as nombre_producto, c.nombre as nombre_cliente

from ventas v
join empleados e on v.id = e.id
join productos p on v.id = p.id
join clientes c on v.id = c.id;

/*Calculando el salario maximo de los empleados en cada departamento y mostrar
el nombre del departamento junto con el salario maximo*/

select d.nombre as nombre_departamento, max(e.salario) as salario_maximo
from empleados e join departamentos d on e.id = d.id
group by d.nombre;

/*Calculando el monto total de ventas por departamento mostrando el nombre del departamento
junto con el monto total de ventas*/

select d.nombre as nombre_departamento, sum(v.monto_total) as monto_total_ventas
from ventas v
join empleados e on v.id = e.id
join departamentos d on e.id = d.id
group by d.nombre;

/*Encontrando el empleado mas joven de cada departamento mostrando el nombre del departamento
junto con la edad del empleado mas joven*/

select d.nombre as nombre_departamento, min(e.edad) as edad_empleado_mas_joven
from empleados e join departamentos d on e.id = d.id
group by d.nombre;

/*Calcular el volumen de productos vendidos por cada producto mostrando la categoria de volumen
junto con la cantidad y el nombre del producto*/

select p.nombre as nombre_producto,
sum(v.cantidad) as cantidad_total, 
case
when sum(v.cantidad) < 5 then 'bajo'
when sum(v.cantidad) < 6 then 'medio'
else 'alto'
end as volumen_vbentas
from ventas v
join productos p on v.id = p.id
group by p.nombre;

/*Encontrando el cliente que ha realizado el mayor monto total de compras
y mostrar su nombre y el monto total*/

select c.nombre as nombre_cliente, sum(v.monto_total) as monto_total_compras
from ventas v
join clientes c on v.id = c.id
group by c.nombre
order by monto_total_compras desc limit 1;

/*calcular el precio promedio de los productos vendidos por cada empleado
y mostrar el nombre del empleado junto con el precio promedio de los productos que 
ha vendido*/

select e.nombre, e.apellido, avg(p.precio) as precio_promedio
from ventas v
join empleados e on v.id = e.id
join productos p on v.id = p.id
group by e.nombre, e.apellido;

/*Encontrar el departamento con el salrio minimo mas bajo entre los empleados mostrando el
nombre del departamento junto con el slario minimo mas bajo*/

select d.nombre as nombre_departamento, min(e.salario) as salario_minimo
from empleados e
join departamentos d on e.id = d.id
group by d.nombre order by salario_minimo asc
limit 1;

/*Encontrar el departamento con el salario promedio mas alto entre los empleados mayores de 30 
y mostrar el nombre del departamento junto con el salario promedio, limitando a los departamentos
con un salario promedio mayor a 3320*/

select d.nombre as nombre_departamento, avg(e.salario) as salario_promedio
from empleados e
join departamentos d on e.id = d.id
where e.edad > 30
group by d.nombre
having avg (e.salario) > 3320
order by salario_promedio desc;