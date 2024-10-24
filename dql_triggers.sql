-- Trigger 1: Actualizar stock despues de una venta
CREATE TRIGGER actualizar_stock_despues_venta
AFTER INSERT ON facturas
FOR EACH ROW
BEGIN
    UPDATE productos
    SET stock = stock - NEW.cantidad
    WHERE id_producto = NEW.id_producto;
END;

-- Trigger 2: Validación de Stock antes de Facturar
CREATE TRIGGER validar_stock_antes_factura
BEFORE INSERT ON facturas
FOR EACH ROW
BEGIN
    DECLARE cantidad_disponible INT;
    SELECT stock INTO cantidad_disponible FROM productos WHERE id_producto = NEW.id_producto;
    IF cantidad_disponible < NEW.cantidad THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Stock insuficiente para realizar la venta';
    END IF;
END;

-- Trigger 3: Registrar el total de ventas por producto
CREATE TRIGGER actualizar_totales_ventas
AFTER INSERT ON facturas
FOR EACH ROW
BEGIN
    IF EXISTS (SELECT * FROM totales_ventas WHERE id_producto = NEW.id_producto) THEN
        UPDATE totales_ventas
        SET cantidad_vendida = cantidad_vendida + NEW.cantidad
        WHERE id_producto = NEW.id_producto;
    ELSE
        INSERT INTO totales_ventas (id_producto, cantidad_vendida)
        VALUES (NEW.id_producto, NEW.cantidad);
    END IF;
END;

-- Trigger 4: Registrar cambios en el salario de un empleado

CREATE TRIGGER actualizar_salario
AFTER UPDATE ON empleados
FOR EACH ROW
BEGIN
    IF OLD.salario != NEW.salario THEN
        INSERT INTO historial_salarios (id_empleado, salario_anterior, salario_nuevo, fecha_cambio)
        VALUES (NEW.id_empleado, OLD.salario, NEW.salario, CURDATE());
    END IF;
END;

-- Trigger 5: Registrar el historial de cambios en productos

CREATE TRIGGER actualizar_producto
AFTER UPDATE ON productos
FOR EACH ROW
BEGIN
    INSERT INTO historial_productos (id_producto, nombre_anterior, nombre_nuevo, precio_anterior, precio_nuevo, stock_anterior, stock_nuevo, fecha_cambio)
    VALUES (NEW.id_producto, OLD.nombre, NEW.nombre, OLD.precio, NEW.precio, OLD.stock, NEW.stock, CURDATE());
END;
-- Trigger 6: Registro de Ventas y Cálculo de Ingresos

CREATE TRIGGER registro_calculo
AFTER INSERT ON facturas
FOR EACH ROW
BEGIN
    DECLARE total DECIMAL;

    SET total = NEW.total;

    INSERT INTO ingresos (id_venta, total_ingreso, fecha_ingreso)
    VALUES (NEW.id_venta, total, CURDATE());
END;

-- Trigger 7: Registrar Historial de Ventas

CREATE TRIGGER historial_ventas
AFTER INSERT ON facturas
FOR EACH ROW
BEGIN
    INSERT INTO historial_ventas (id_factura, id_producto, cantidad)
    VALUES (NEW.id_factura, NEW.id_producto, NEW.cantidad);
END;

-- Trigger 8: Notificar cuando el stock de un producto es bajo
CREATE TRIGGER notificar_stock_bajo
AFTER UPDATE ON productos
FOR EACH ROW
BEGIN
    IF NEW.stock < 10 AND OLD.stock >= 10 THEN
        INSERT INTO notificaciones (mensaje, fecha)
        VALUES (CONCAT('El stock del producto ', NEW.nombre, ' es bajo: ', NEW.stock), CURDATE());
    END IF;
END;


-- Trigger 9: Registrar cambios en la tabla de proveedores
DELIMITER //
CREATE TRIGGER registrar_cambios_proveedor
AFTER UPDATE ON proveedores
FOR EACH ROW
BEGIN
    INSERT INTO historial_proveedores (id_proveedor, nombre_anterior, nombre_nuevo, correo_anterior, correo_nuevo, fecha_cambio)
    VALUES (NEW.id_proveedor, OLD.nombre, NEW.nombre, OLD.correo, NEW.correo, CURDATE());
END;
//
DELIMITER ;
-- Trigger 10: Registrar el historial de pedidos de proveedor
DELIMITER //

CREATE TRIGGER registrar_historial_pedido
AFTER UPDATE ON pedidos_prov
FOR EACH ROW
BEGIN
    INSERT INTO historial_pedidos_prov (
        id_pedido_prov, 
        id_proveedor, 
        cantidad_anterior, 
        cantidad_nueva, 
        estado_anterior, 
        estado_nuevo, 
        fecha_cambio
    )
    VALUES (
        NEW.id_pedido_prov, 
        NEW.id_proveedor, 
        OLD.cantidad, 
        NEW.cantidad, 
        OLD.estado, 
        NEW.estado, 
        NOW()
    );
END //

DELIMITER ;


-- Trigger 11: Registrar cambios en zonas

DELIMITER //
CREATE TRIGGER registrar_cambios_zona
AFTER UPDATE ON zonas
FOR EACH ROW
BEGIN
    INSERT INTO historial_zonas (id_zona, nombre_anterior, nombre_nuevo, fecha_cambio)
    VALUES (NEW.id_zona, OLD.nombre, NEW.nombre, NOW());
END;
//
DELIMITER ;

-- Trigger 12: Notificar cuando se añade un nuevo producto
DELIMITER //

CREATE TRIGGER notificar_nuevo_producto
AFTER INSERT ON productos
FOR EACH ROW
BEGIN
    INSERT INTO notificaciones (mensaje, fecha)
    VALUES (CONCAT('Nuevo producto añadido: ', NEW.nombre), CURDATE());
END //

DELIMITER ;


-- Trigger 13: Registro de cambios en clientes

DELIMITER //
CREATE TRIGGER cambios_clientes
AFTER UPDATE ON clientes
FOR EACH ROW
BEGIN
    IF OLD.nombre <> NEW.nombre THEN
        INSERT INTO historial_cambios_clientes (id_cliente, campo_modificado, valor_anterior, valor_nuevo)
        VALUES (OLD.id_cliente, 'nombre', OLD.nombre, NEW.nombre);
    END IF;
    IF OLD.correo <> NEW.correo THEN
        INSERT INTO historial_cambios_clientes (id_cliente, campo_modificado, valor_anterior, valor_nuevo)
        VALUES (OLD.id_cliente, 'correo', OLD.correo, NEW.correo);
    END IF;
END
//
DELIMITER ;

-- Trigger 14: Notificar al añadir un nuevo proveedor
DELIMITER //
CREATE TRIGGER notificar_proveedor
AFTER INSERT ON proveedores
FOR EACH ROW
BEGIN
    INSERT INTO notificaciones (mensaje, fecha) 
    VALUES (CONCAT('Nuevo proveedor añadido: ', NEW.nombre, ' (ID: ', NEW.id_proveedor, ')'), CURDATE());
END
//
DELIMITER ;

-- Trigger 15: Actualizar stock al recibir un pedido
DELIMITER //
CREATE TRIGGER actualizar_stock_pedidos
AFTER INSERT ON pedidos_prov
FOR EACH ROW
BEGIN
    IF NEW.estado = 'Entregado' OR NEW.estado = 'entregado' THEN
        UPDATE prod_prov
        SET stock = stock + NEW.cantidad
        WHERE id_prod_prov = NEW.id_prod_prov;
    END IF;
END
//
DELIMITER ;

-- Trigger 16: Notificar sobre pedidos pendientes
DELIMITER $$
CREATE TRIGGER notificar_pedido_pendiente
AFTER INSERT ON pedidos_prov
FOR EACH ROW
BEGIN
    IF NEW.estado = 'Pendiente' THEN
        INSERT INTO notificaciones (mensaje, fecha)
        VALUES (CONCAT('Nuevo pedido pendiente: ID ', NEW.id_pedido_prov), CURDATE());
    END IF;
END$$
DELIMITER ;

-- Trigger 17: Notificar cuando un cliente se registra
CREATE TRIGGER notificar_registro_cliente
AFTER INSERT ON clientes
FOR EACH ROW
BEGIN
    INSERT INTO notificaciones (mensaje, fecha)
    VALUES (CONCAT('Nuevo cliente registrado: ', NEW.nombre, ' (', NEW.correo, ')'), CURDATE());
END;

-- Trigger 18: Registrar la fecha de compra de los clientes
DELIMITER //
CREATE TRIGGER registrar_fecha_compra
AFTER INSERT ON ventas
FOR EACH ROW
BEGIN
    DECLARE cliente_nombre VARCHAR(255);
    
    SELECT nombre INTO cliente_nombre
    FROM clientes
    WHERE id_cliente = NEW.id_cliente;

    INSERT INTO notificaciones (mensaje, fecha)
    VALUES (CONCAT('El cliente ', cliente_nombre, ' realizó una compra el ', NEW.fecha), NEW.fecha);
END;
//
DELIMITER ;

-- Trigger 19: Notificación de Ventas de un Monto Específico
DELIMITER //

CREATE TRIGGER notificar_facturas_especificas
AFTER INSERT ON facturas
FOR EACH ROW
BEGIN
    -- Aquí se modifica el monto específico para notificar facturas
    IF NEW.total > 100000 THEN
        INSERT INTO notificaciones (mensaje, fecha)
        VALUES (CONCAT('Se ha generado una gran factura de ', NEW.total, ' para la venta ID ', NEW.id_venta), CURDATE());
    END IF;
END //

DELIMITER ;


-- Trigger 20: Notificar cada factura
DELIMITER //
CREATE TRIGGER notificar_facturas
AFTER INSERT ON facturas
FOR EACH ROW
BEGIN
    IF NEW.total > 0 THEN
        INSERT INTO notificaciones (mensaje, fecha)
        VALUES (CONCAT('Se ha generado una factura de ', NEW.total, ' para la venta ID ', NEW.id_venta), CURDATE());
    END IF;
END;
//
DELIMITER ;