-- Funcion 1: Función para obtener el inventario de un producto proveedor
DELIMITER //
CREATE FUNCTION obtener_inventario_prod_prov(id_prod INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE inventario INT;
    SELECT stock INTO inventario 
    FROM prod_prov 
    WHERE id_prod_prov = id_prod;
    RETURN inventario;
END //
DELIMITER ;

-- Funcion 2: Función para realizar un pedido a un proveedor y retornar el ID del pedido
DELIMITER //
CREATE FUNCTION realizar_pedido_prov(id_prod INT, id_prov INT, cantidad DECIMAL(10,2), estado_pedido VARCHAR(255))
RETURNS INT
DETERMINISTIC
BEGIN
    INSERT INTO pedidos_prov (id_prod_prov, id_proveedor, cantidad, estado) 
    VALUES (id_prod, id_prov, cantidad, estado_pedido);
    RETURN LAST_INSERT_ID();
END //
DELIMITER ;

-- Funcion 3: Función para actualizar el precio de un producto proveedor y retornar el número de filas afectadas
DELIMITER //
CREATE FUNCTION actualizar_precio_prod_prov(id_prod INT, nuevo_precio DECIMAL(10,2))
RETURNS INT
DETERMINISTIC
BEGIN
    UPDATE prod_prov 
    SET precio = nuevo_precio 
    WHERE id_prod_prov = id_prod;
    RETURN ROW_COUNT();
END //
DELIMITER ;

-- Funcion 4: Función para insertar un nuevo producto proveedor y retornar el ID del producto
DELIMITER //
CREATE FUNCTION insertar_prod_prov(tipo INT, nombre_prod VARCHAR(100), precio DECIMAL(10,2), stock INT)
RETURNS INT
DETERMINISTIC
BEGIN
    INSERT INTO prod_prov (id_tipo_prod_prov, nombre, precio, stock) 
    VALUES (tipo, nombre_prod, precio, stock);
    RETURN LAST_INSERT_ID();
END //
DELIMITER ;

-- Funcion 5: Función para insertar un nuevo proveedor y retornar su ID
DELIMITER //
CREATE FUNCTION insertar_proveedor(nombre_prov VARCHAR(255), correo_prov VARCHAR(255))
RETURNS INT
DETERMINISTIC
BEGIN
    INSERT INTO proveedores (nombre, correo) 
    VALUES (nombre_prov, correo_prov);
    RETURN LAST_INSERT_ID();
END //
DELIMITER ;

-- Funcion 6: Función para realizar un pedido a un proveedor y retornar el ID del pedido
DELIMITER //
CREATE FUNCTION realizar_pedido(id_prod INT, id_prov INT, cantidad DECIMAL(10,2), estado_pedido VARCHAR(255))
RETURNS INT
DETERMINISTIC
BEGIN
    INSERT INTO pedidos_prov (id_prod_prov, id_proveedor, cantidad, estado) 
    VALUES (id_prod, id_prov, cantidad, estado_pedido);
    RETURN LAST_INSERT_ID();
END //
DELIMITER ;

-- Funcion 7: Función para actualizar el estado de un pedido y retornar el número de filas afectadas
DELIMITER //
CREATE FUNCTION actualizar_estado_pedido(id_pedido INT, nuevo_estado VARCHAR(255))
RETURNS INT
DETERMINISTIC
BEGIN
    UPDATE pedidos_prov 
    SET estado = nuevo_estado 
    WHERE id_pedido_prov = id_pedido;
    RETURN ROW_COUNT();
END //
DELIMITER ;

-- Funcion 8: Función para obtener la información de un proveedor
DELIMITER //
CREATE FUNCTION obtener_info_proveedor(id_prov INT)
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    DECLARE info_prov VARCHAR(255);
    SELECT CONCAT(nombre, ' - ', correo) INTO info_prov 
    FROM proveedores 
    WHERE id_proveedor = id_prov;
    RETURN info_prov;
END //
DELIMITER ;

-- Funcion 9: Función para contar el número de productos de un proveedor
DELIMITER //
CREATE FUNCTION contar_productos_prov(id_prov INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE num_productos INT;
    SELECT COUNT(*) INTO num_productos 
    FROM prod_prov 
    WHERE id_proveedor = id_prov;
    RETURN num_productos;
END //
DELIMITER ;

-- Funcion 10: Función para archivar un pedido y retornar el ID del pedido archivado
DELIMITER //
CREATE FUNCTION archivar_pedido(id_pedido INT)
RETURNS INT
DETERMINISTIC
BEGIN
    INSERT INTO pedidos_archivados (id_prod_prov, id_proveedor, cantidad, estado) 
    SELECT id_prod_prov, id_proveedor, cantidad, estado 
    FROM pedidos_prov 
    WHERE id_pedido_prov = id_pedido;
    RETURN LAST_INSERT_ID();
END //
DELIMITER ;

-- Funcion 11: Función para obtener la cantidad total de productos en stock
DELIMITER //
CREATE FUNCTION total_stock()
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total INT;
    SELECT SUM(stock) INTO total FROM prod_prov;
    RETURN total;
END //
DELIMITER ;

-- Funcion 12: Función para obtener los productos con bajo stock
DELIMITER //
CREATE PROCEDURE obtener_productos_bajo_stock(IN threshold INT)
BEGIN
    SELECT * FROM prod_prov WHERE stock < threshold;
END //
DELIMITER ;


-- Funcion 13: Función para obtener el estado de un pedido
DELIMITER //
CREATE FUNCTION obtener_estado_pedido(id_pedido INT)
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    DECLARE estado VARCHAR(255);
    SELECT estado INTO estado 
    FROM pedidos_prov 
    WHERE id_pedido_prov = id_pedido;
    RETURN estado;
END //
DELIMITER ;

-- Funcion 14: Función para contar el número de proveedores
DELIMITER //
CREATE FUNCTION contar_proveedores()
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE num_prov INT;
    SELECT COUNT(*) INTO num_prov FROM proveedores;
    RETURN num_prov;
END //
DELIMITER ;

-- Funcion 15: Función para obtener la información de un producto proveedor
DELIMITER //
CREATE FUNCTION obtener_info_producto(id_prod INT)
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    DECLARE info_producto VARCHAR(255);
    SELECT CONCAT(nombre, ' - Precio: ', precio, ' - Stock: ', stock) INTO info_producto 
    FROM prod_prov 
    WHERE id_prod_prov = id_prod;
    RETURN info_producto;
END //
DELIMITER ;

-- Funcion 16: Función para calcular el total de un pedido
DELIMITER //
CREATE FUNCTION calcular_total_pedido(id_pedido INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);
    SELECT SUM(precio * cantidad) INTO total 
    FROM pedidos_prov 
    JOIN prod_prov ON pedidos_prov.id_prod_prov = prod_prov.id_prod_prov 
    WHERE id_pedido_prov = id_pedido;
    RETURN total;
END //
DELIMITER ;

-- Funcion 17: Función para eliminar un proveedor y retornar el número de filas afectadas
DELIMITER //
CREATE FUNCTION eliminar_proveedor(id_prov INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DELETE FROM proveedores 
    WHERE id_proveedor = id_prov;
    RETURN ROW_COUNT();
END //
DELIMITER ;

-- Funcion 18: Función para eliminar un producto proveedor y retornar el número de filas afectadas
DELIMITER //
CREATE FUNCTION eliminar_producto_prov(id_prod INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DELETE FROM prod_prov 
    WHERE id_prod_prov = id_prod;
    RETURN ROW_COUNT();
END //
DELIMITER ;

-- Funcion 19: Función para archivar un cultivo y retornar el ID del cultivo archivado
DELIMITER //
CREATE FUNCTION archivar_cultivo(id_cultivo INT)
RETURNS INT
DETERMINISTIC
BEGIN
    INSERT INTO cultivos_archivados (id_cultivo, nombre, tipo, fecha_plantacion)
    SELECT id_cultivo, nombre, tipo, fecha_plantacion 
    FROM cultivos 
    WHERE id_cultivo = id_cultivo;
    RETURN LAST_INSERT_ID();
END //
DELIMITER ;

-- Funcion 20: Función para obtener el total de cultivos
DELIMITER //
CREATE FUNCTION total_cultivos()
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total INT;
    SELECT COUNT(*) INTO total FROM cultivos;
    RETURN total;
END //
DELIMITER ;
