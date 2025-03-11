DELIMITER //
-- 1
CREATE FUNCTION TotalIngresosCliente(ClienteID INT, Año INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);
    SELECT SUM(p.costo_renta) INTO total
    FROM alquiler a
    JOIN inventario i ON a.inventario_id = i.inventario_id
    JOIN pelicula p ON i.pelicula_id = p.pelicula_id
    WHERE a.cliente_id = ClienteID AND YEAR(a.fecha_alquiler) = Año;
    RETURN IFNULL(total, 0);
END;
//

-- 2
CREATE FUNCTION PromedioDuracionAlquiler(PeliculaID INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE promedio DECIMAL(10,2);
    SELECT AVG(DATEDIFF(fecha_devolucion, fecha_alquiler)) INTO promedio
    FROM alquiler a
    JOIN inventario i ON a.inventario_id = i.inventario_id
    WHERE i.pelicula_id = PeliculaID;
    RETURN IFNULL(promedio, 0);
END;
//

-- 3
CREATE FUNCTION IngresosPorCategoria(CategoriaID INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);
    SELECT SUM(p.costo_renta) INTO total
    FROM alquiler a
    JOIN inventario i ON a.inventario_id = i.inventario_id
    JOIN pelicula p ON i.pelicula_id = p.pelicula_id
    JOIN pelicula_categoria pc ON p.pelicula_id = pc.pelicula_id
    WHERE pc.categoria_id = CategoriaID;
    RETURN IFNULL(total, 0);
END;
//