-- consultas
use sakilacampus;

SELECT a.fecha_alquiler from alquiler a ;
-- consulta 1, 
SELECT  c.nombre, count(a.id_alquiler) as "cantidad alquiler"
FROM cliente c
join alquiler a on a.id_cliente = c.id_cliente 
GROUP by c.nombre
order by "cantidad alquiler" DESC 
LIMIT 1;

-- 2
SELECT  p.titulo , count(a.id_alquiler) as cantidadAlquiler
FROM pelicula p
join inventario i on i.id_pelicula = p.id_pelicula 
JOIN alquiler a on i.id_inventario = a.id_inventario 
GROUP by p.titulo
order by cantidadAlquiler DESC 
LIMIT 1;

-- 3
SELECT c.nombre, count(a.id_alquiler) as cantAlquiler
FROM pelicula p 
join pelicula_categoria pc on p.id_pelicula = pc.id_pelicula 
join categoria c on pc.id_categoria = c.id_categoria 
join inventario i on i.id_pelicula = p.id_pelicula 
join alquiler a on a.id_inventario = i.id_inventario 
GROUP by c.nombre
order by cantAlquiler desc;

-- 4
select i.nombre, count(a.id_alquiler) as cantAlquiler 
FROM idioma i  
left join pelicula p on i.id_idioma = p.id_idioma 
left join inventario inv on inv.id_pelicula = p.id_pelicula 
left join alquiler a on a.id_inventario = inv.id_inventario
GROUP by i.nombre 
order by cantAlquiler desc;

-- 5

SELECT count(c.id_categoria) as dato, c.nombre 
from categoria c 
join pelicula_categoria pc ON pc.id_categoria = c.id_categoria 
join pelicula p on p.id_pelicula = pc.id_pelicula 
group by c.nombre
order by dato  DESC;



-- 6 
SELECT c2.nombre, count(c.id_cliente) as cantClientes
FROM cliente c 
join direccion d on c.id_direccion = d.id_direccion 
join ciudad c2 on c2.id_ciudad = d.id_ciudad 
where c.activo = 1
GROUP by nombre
ORDER by cantClientes desc;

-- 7 

SELECT c.nombre, count(i.id_inventario) as menorCantidad
FROM categoria c 
join pelicula_categoria pc on pc.id_categoria = c.id_categoria 
join pelicula p on p.id_pelicula = pc.id_pelicula 
join inventario i on i.id_pelicula = p.id_pelicula 
join alquiler a on a.id_inventario  = i.id_inventario 
GROUP by c.nombre
order by menorCantidad asc
limit 5;


-- 8 



-- 9
SELECT e.nombre, count(a.id_alquiler) as cantidadT
FROM empleado e 
join alquiler a on a.id_empleado = e.id_empleado 
join inventario i on i.id_inventario = a.id_inventario  
join pelicula p on p.id_pelicula = i.id_pelicula 
JOIN pelicula_categoria pc on pc.id_pelicula = p.id_pelicula 
join categoria c on c.id_categoria = pc.id_categoria 
where c.nombre = 'Action'
GROUP by e.nombre
order by cantidadT desc
limit 1;

-- 10
SELECT c.nombre, count(a.id_alquiler) as cantAlquiler
FROM cliente c 
join alquiler a on a.id_cliente = c.id_cliente 
GROUP by c.nombre;


-- 11 
select avg(replacement_cost) as costoPromedio from pelicula p 

-- 12
SELECT p.titulo , a.fecha_alquiler, a.fecha_devolucion 
FROM alquiler a 
join inventario i on i.id_inventario = a.id_inventario 
join pelicula p on p.id_pelicula = i.id_pelicula;


-- 13
SELECT c2.nombre , count(a.id_alquiler) as cantidad
FROM pelicula p 
join pelicula_categoria pc on p.id_pelicula =pc.id_pelicula 
join categoria c on c.id_categoria = pc.id_categoria 
join inventario i on i.id_pelicula  = p.id_pelicula 
join alquiler a on a.id_inventario = i.id_inventario 
join cliente c2 ON c2.id_cliente = a.id_cliente 
where c.nombre = 'Comedy'
GROUP by c2.nombre
order by cantidad desc
limit 5; 

-- 14


-- 15

-- 16
select a.id_almacen, SUM(p.total) 
FROM almacen a 
join cliente c on a.id_almacen = c.id_almacen 
join pago p on p.id_cliente = c.id_cliente 
GROUP by a.id_almacen; 

-- 17
SELECT c.nombre, p.total  
FROM cliente c  
join pago p on p.id_cliente = c.id_cliente
ORDER by p.total DESC
limit 1;

-- 18

SELECT c.nombre, p2.total
FROM categoria c 
join pelicula_categoria pc on c.id_categoria
join pelicula p on p.id_pelicula = pc.id_pelicula 
join inventario i on i.id_pelicula = p.id_pelicula  
join alquiler a on i.id_inventario = a.id_inventario 
join pago p2 on p2.id_alquiler = a.id_alquiler 
GROUP by c.nombre
order by p2.total desc;

















