/*Encontrando la cantidad de productos vendidos por cada empleado mostrando el nombre
del empleado junto con la cantidad de productos vendidos*/

select e.nombre, e.apellido, sum(v.cantidad) as cantidad_productos_vendidos
from ventas v join empleados e on v.id = e.id
group by e.nombre, e.apellido;

/*Calcular el monto total de ventas por cada cliente mostrando el nombre del cliente
junto con el monto total de sus compras*/

select c.nombre as nombre_cliente, sum(v.monto_total) as monto_total_compras
from ventas v join clientes c on v.id = c.id
group by c.nombre;

/*Encontrar el producto mas caro vendido mostrando el nombre y el precio*/

SELECT p.nombre, p.precio
FROM productos p
JOIN ventas v ON v.id = p.id
ORDER BY p.precio DESC
LIMIT 1;


/*calcular el salario promedio de los empleados en cada departamento mostrando el
nombre del departamento junto con el salario promedio*/

select d.nombre as nombre_departamento, avg(e.salario) as salario_promedio
from empleados e join departamentos d on e.id = d.id group by d.nombre;

/*Encontrar la cantidad total de ventas realizadas por cada empleado mostrando el nombre y apellido
del empleado junto con la cantidad total de ventas*/

select e.nombre, e.apellido, count(v.id) as cantidad_total_ventas
from ventas v join empleados e on v.id = e.id group by e.nombre, e.apellido;

/*Encontrar la cantidad de ventas realizadas por cada empleado mostrando el nombre y apellido
del empleado junto con la cantidad total de ventas limitando los resultados a empleados
con mas de 5 ventas y ordenalos en orden descendente*/

select e.nombre, e.apellido, count(v.id) as cantidad_total_ventas
from ventas v
join empleados e on v.id = e.id
group by e.nombre, e.apellido
having count(v.id) > 5
order by cantidad_total_ventas desc;

/*Calcular el monto total vendido por cada empleado mostrando el nombre del empleado
junto con el monto total usando HAVING para filtrar empleados que hayan vendido mas de 10
productos*/

select e.nombre, e.apellido, sum(v.monto_total) as monto_total_vendido
from ventas v join empleados e on v.id = e.id
group by e.nombre, e.apellido
having sum(v.cantidad) > 10
order by monto_total_vendido desc;

/*Encuentra el monto total vendido a cada cliente mostrando el nombre del cliente junto con
el monto total usando HAVING para filtrar clientes con un promedio de compras superior a S/1500*/

select c.nombre as nombre_cliente, sum(v.monto_total) as monto_total_compras,avg(v.monto_total)
as promedio_compras from ventas v join clientes c on v.id = c.id
group by c.nombre having avg(v.monto_total) > 1500 order by monto_total_compras desc;

/*Calculando la cantidad total de ventas realizadas a cada cliente mostrando el nombre del
cliente junto con la cantidad total de ventas limitando a clientes con mas de 3 ventas orde
nandolos en orden descendente*/

select c.nombre as nombre_cliente, count(v.id) as cantidad_total_ventas
from ventas v join clientes v on v.id = c.id group by c.nombre having count(v.id) >3
order by cantidad_total_ventas desc;

/*Encontrar los productos mas caros vendidos (precio mayor a 1000) mostrando su nombre y precio
ordenandolo de forma descendiente*/

select p.nombre, p.precio
from productos p
where p.precio > 1000
order by p.precio desc;