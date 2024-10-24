-- Procedimiento 1: Procesar Venta y Actualizar Inventario
DELIMITER //
CREATE PROCEDURE ProcesarVenta (
    IN p_id_cliente INT,
    IN p_id_producto INT,
    IN p_cantidad DECIMAL
)
BEGIN
    DECLARE v_precio DECIMAL;
    DECLARE v_stock INT;

    SELECT precio, stock INTO v_precio, v_stock FROM productos WHERE id_producto = p_id_producto;

    IF v_stock >= p_cantidad THEN
        INSERT INTO ventas (id_cliente, fecha) VALUES (p_id_cliente, CURDATE());
        SET @id_venta = LAST_INSERT_ID();
        INSERT INTO facturas (id_venta, id_producto, cantidad, total) VALUES (@id_venta, p_id_producto, p_cantidad, v_precio * p_cantidad);
        UPDATE productos SET stock = stock - p_cantidad WHERE id_producto = p_id_producto;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Stock insuficiente';
    END IF;
END //
DELIMITER ;

-- Procedimiento 2: Registrar Nuevo Proveedor
DELIMITER //
CREATE PROCEDURE RegistrarProveedor (
    IN p_nombre VARCHAR(255),
    IN p_correo VARCHAR(255)
)
BEGIN
    INSERT INTO proveedores (nombre, correo) VALUES (p_nombre, p_correo);
END //
DELIMITER ;

-- Procedimiento 3: Actualizar Estado de Maquinaria
DELIMITER //
CREATE PROCEDURE ActualizarEstadoMaquinaria (
    IN p_id_maquina INT,
    IN p_estado VARCHAR(255)
)
BEGIN
    UPDATE maquinas SET estado = p_estado WHERE id_maquina = p_id_maquina;
END //
DELIMITER ;

-- Procedimiento 4: Registrar Empleado
DELIMITER //
CREATE PROCEDURE RegistrarEmpleado (
    IN p_id_tipo_empleado INT,
    IN p_nombre VARCHAR(255),
    IN p_correo VARCHAR(255),
    IN p_salario DECIMAL
)
BEGIN
    INSERT INTO empleados (id_tipo_empleado, nombre, correo, salario) VALUES (p_id_tipo_empleado, p_nombre, p_correo, p_salario);
END //
DELIMITER ;

-- Procedimiento 5: Actualizar Salario de Empleado
DELIMITER //
CREATE PROCEDURE ActualizarSalarioEmpleado (
    IN p_id_empleado INT,
    IN p_nuevo_salario DECIMAL
)
BEGIN
    DECLARE v_salario_anterior DECIMAL;

    SELECT salario INTO v_salario_anterior FROM empleados WHERE id_empleado = p_id_empleado;

    UPDATE empleados SET salario = p_nuevo_salario WHERE id_empleado = p_id_empleado;
    INSERT INTO historial_salarios (id_empleado, salario_anterior, salario_nuevo, fecha_cambio) VALUES (p_id_empleado, v_salario_anterior, p_nuevo_salario, CURDATE());
END //
DELIMITER ;

-- Procedimiento 6: Registrar Mantenimiento de Maquinaria
DELIMITER //
CREATE PROCEDURE RegistrarMantenimiento (
    IN p_id_maquina INT,
    IN p_id_empleado INT,
    IN p_fecha DATE
)
BEGIN
    INSERT INTO procesos_maquina (id_proceso, id_maquina, id_empleado, fecha) VALUES (1, p_id_maquina, p_id_empleado, p_fecha);
END //
DELIMITER ;

-- Procedimiento 7: Registrar Nuevo Producto
DELIMITER //
CREATE PROCEDURE RegistrarProducto (
    IN p_id_tipo_prod INT,
    IN p_id_unidad_medida INT,
    IN p_nombre VARCHAR(100),
    IN p_precio DECIMAL,
    IN p_stock INT
)
BEGIN
    INSERT INTO productos (id_tipo_prod, id_unidad_medida, nombre, precio, stock) VALUES (p_id_tipo_prod, p_id_unidad_medida, p_nombre, p_precio, p_stock);
END //
DELIMITER ;

-- Procedimiento 8: Actualizar Inventario
DELIMITER //
CREATE PROCEDURE ActualizarInventario (
    IN p_id_inventario INT,
    IN p_nombre VARCHAR(255)
)
BEGIN
    UPDATE inventarios SET nombre = p_nombre WHERE id_inventario = p_id_inventario;
END //
DELIMITER ;

-- Procedimiento 9: Archivar Venta
DELIMITER //
CREATE PROCEDURE ArchivarVenta (
    IN p_id_venta INT
)
BEGIN
    DECLARE v_id_cliente INT;
    DECLARE v_fecha DATE;

    SELECT id_cliente, fecha INTO v_id_cliente, v_fecha FROM ventas WHERE id_venta = p_id_venta;
    INSERT INTO ventas_archivadas (id_venta, id_cliente, fecha) VALUES (p_id_venta, v_id_cliente, v_fecha);
    DELETE FROM ventas WHERE id_venta = p_id_venta;
END //
DELIMITER ;

-- Procedimiento 10: Archivar Factura
DELIMITER //
CREATE PROCEDURE ArchivarFactura (
    IN p_id_factura INT
)
BEGIN
    DECLARE v_id_venta INT;
    DECLARE v_id_producto INT;
    DECLARE v_cantidad DECIMAL;
    DECLARE v_total DECIMAL;

    SELECT id_venta, id_producto, cantidad, total INTO v_id_venta, v_id_producto, v_cantidad, v_total FROM facturas WHERE id_factura = p_id_factura;
    INSERT INTO facturas_archivadas (id_factura, id_venta, id_producto, cantidad, total) VALUES (p_id_factura, v_id_venta, v_id_producto, v_cantidad, v_total);
    DELETE FROM facturas WHERE id_factura = p_id_factura;
END //
DELIMITER ;

-- Procedimiento 11: Registrar Proveedor Mensual
DELIMITER //
CREATE PROCEDURE RegistrarProveedorMensual (
    IN p_id_proveedor INT
)
BEGIN
    INSERT INTO reporte_proveedores_mensual (id_proveedor, nombre, correo)
    SELECT id_proveedor, nombre, correo FROM proveedores WHERE id_proveedor = p_id_proveedor;
END //
DELIMITER ;

-- Procedimiento 12: Generar Reporte de Ventas Mensual
DELIMITER //
CREATE PROCEDURE GenerarReporteVentasMensual ()
BEGIN
    INSERT INTO reporte_ventas_mensual (id_venta, id_cliente, fecha)
    SELECT id_venta, id_cliente, fecha FROM ventas WHERE MONTH(fecha) = MONTH(CURDATE());
END //
DELIMITER ;

-- Procedimiento 13: Generar Reporte de Facturas Mensual
DELIMITER //
CREATE PROCEDURE GenerarReporteFacturasMensual ()
BEGIN
    INSERT INTO reporte_facturas_mensual (id_factura, id_venta, id_producto, cantidad, total)
    SELECT id_factura, id_venta, id_producto, cantidad, total FROM facturas WHERE MONTH(fecha) = MONTH(CURDATE());
END //
DELIMITER ;

-- Procedimiento 14: Archivar Proveedor
DELIMITER //
CREATE PROCEDURE ArchivarProveedor (
    IN p_id_proveedor INT
)
BEGIN
    DECLARE v_nombre VARCHAR(255);
    DECLARE v_correo VARCHAR(255);

    SELECT nombre, correo INTO v_nombre, v_correo FROM proveedores WHERE id_proveedor = p_id_proveedor;
    INSERT INTO proveedores_archivados (id_proveedor, nombre, correo) VALUES (p_id_proveedor, v_nombre, v_correo);
    DELETE FROM proveedores WHERE id_proveedor = p_id_proveedor;
END //
DELIMITER ;

-- Procedimiento 15: Actualizar Stock de Producto
DELIMITER //
CREATE PROCEDURE ActualizarStockProducto (
    IN p_id_producto INT,
    IN p_nuevo_stock INT
)
BEGIN
    UPDATE productos SET stock = p_nuevo_stock WHERE id_producto = p_id_producto;
END //
DELIMITER ;

-- Procedimiento 16: Registrar Proceso de Cultivo
DELIMITER //
CREATE PROCEDURE RegistrarProcesoCultivo (
    IN p_id_cultivo INT,
    IN p_id_empleado INT,
    IN p_fecha DATE
)
BEGIN
    INSERT INTO procesos_cultivo (id_proceso, id_cultivo, fecha) VALUES (1, p_id_cultivo, p_fecha);
END //
DELIMITER ;

-- Procedimiento 17: Registrar Proceso de Animal
DELIMITER //
CREATE PROCEDURE RegistrarProcesoAnimal (
    IN p_id_animal INT,
    IN p_id_empleado INT,
    IN p_fecha DATE
)
BEGIN
    INSERT INTO procesos_animales (id_animal, id_proceso, fecha) VALUES (p_id_animal, 1, p_fecha);
END //
DELIMITER ;

-- Procedimiento 18: Actualizar Datos del Proveedor
DELIMITER //
CREATE PROCEDURE ActualizarDatosProveedor (
    IN p_id_proveedor INT,
    IN p_nuevo_nombre VARCHAR(255),
    IN p_nuevo_correo VARCHAR(255)
)
BEGIN
    UPDATE proveedores SET nombre = p_nuevo_nombre, correo = p_nuevo_correo WHERE id_proveedor = p_id_proveedor;
END //
DELIMITER ;

-- Procedimiento 19: Generar Reporte de Productos Mensual
DELIMITER //
CREATE PROCEDURE GenerarReporteProductosMensual ()
BEGIN
    INSERT INTO reporte_productos_mensual (id_producto, id_tipo_prod, id_unidad_medida, nombre, precio, stock)
    SELECT id_producto, id_tipo_prod, id_unidad_medida, nombre, precio, stock FROM productos WHERE MONTH(fecha) = MONTH(CURDATE());
END //
DELIMITER ;

-- Procedimiento 20: Registrar Nuevo Tipo de Cultivo
DELIMITER //
CREATE PROCEDURE RegistrarTipoCultivo (
    IN p_nombre VARCHAR(100)
)
BEGIN
    INSERT INTO tipos_cultivos (nombre) VALUES (p_nombre);
END //
DELIMITER ;
