USE JincaDB;

-- 1. Archivar ventas mensuales
CREATE EVENT archivar_ventas_mensuales ON SCHEDULE EVERY 1 MONTH STARTS '2024-11-01 00:00:00' DO
INSERT INTO ventas_archivadas
SELECT *
FROM ventas
WHERE fecha < NOW() - INTERVAL 1 MONTH;

-- 2. Archivar facturas mensuales
CREATE EVENT archivar_facturas_mensuales ON SCHEDULE EVERY 1 MONTH DO
INSERT INTO facturas_archivadas
SELECT *
FROM facturas
WHERE fecha < CURDATE() - INTERVAL 1 MONTH;

-- 3. Generar reporte de ventas mensuales
CREATE EVENT generar_reporte_ventas ON SCHEDULE EVERY 1 MONTH DO
INSERT INTO reporte_ventas_mensual
SELECT *
FROM ventas
WHERE fecha BETWEEN CURDATE() - INTERVAL 1 MONTH AND CURDATE();

-- 4. Generar reporte de facturas mensuales
CREATE EVENT generar_reporte_facturas ON SCHEDULE EVERY 1 MONTH DO
INSERT INTO reporte_facturas_mensual
SELECT *
FROM facturas
WHERE fecha BETWEEN CURDATE() - INTERVAL 1 MONTH AND CURDATE();

-- 5. Archivar empleados que no han trabajado en 6 meses
CREATE EVENT archivar_empleados_inactivos ON SCHEDULE EVERY 1 MONTH DO
INSERT INTO empleados_archivados
SELECT *
FROM empleados
WHERE fecha < CURDATE() - INTERVAL 6 MONTH;

-- 6. Generar reporte de empleados mensuales
CREATE EVENT generar_reporte_empleados ON SCHEDULE EVERY 1 MONTH DO
INSERT INTO reporte_empleados_mensual
SELECT *
FROM empleados
WHERE fecha BETWEEN CURDATE() - INTERVAL 1 MONTH AND CURDATE();

-- 7. Archivar proveedores que no han realizado pedidos en 3 meses
CREATE EVENT archivar_proveedores_inactivos ON SCHEDULE EVERY 1 MONTH DO
INSERT INTO proveedores_archivados
SELECT *
FROM proveedores
WHERE id_proveedor NOT IN(
        SELECT DISTINCT id_proveedor
        FROM pedidos_prov
        WHERE fecha >= CURDATE() - INTERVAL 3 MONTH
    );

-- 8. Generar reporte de proveedores mensuales
CREATE EVENT generar_reporte_proveedores ON SCHEDULE EVERY 1 MONTH DO
INSERT INTO reporte_proveedores_mensual
SELECT *
FROM proveedores
WHERE fecha BETWEEN CURDATE() - INTERVAL 1 MONTH AND CURDATE();

-- 9. Archivar inventarios que no han sido utilizados en 6 meses
CREATE EVENT archivar_inventarios_inactivos ON SCHEDULE EVERY 1 MONTH DO
INSERT INTO inventarios_archivados
SELECT *
FROM inventarios
WHERE id_inventario NOT IN(
    SELECT DISTINCT id_inventario
    FROM inv_prod_prov
    WHERE fecha >= CURDATE() - INTERVAL 6 MONTH
    );

-- 10. Generar reporte de inventarios mensuales
CREATE EVENT generar_reporte_inventarios ON SCHEDULE EVERY 1 MONTH DO
INSERT INTO reporte_inventarios_mensual
SELECT *
FROM inventarios
WHERE fecha BETWEEN CURDATE() - INTERVAL 1 MONTH AND CURDATE();

-- 11. Archivar productos que no se han vendido en 6 meses
CREATE EVENT archivar_productos_inactivos ON SCHEDULE EVERY 1 MONTH DO
INSERT INTO productos_archivados
SELECT *
FROM productos
WHERE id_producto NOT IN(
    SELECT DISTINCT id_producto
    FROM facturas
    WHERE fecha >= CURDATE() - INTERVAL 6 MONTH
    );

-- 12. Generar reporte de productos mensuales
CREATE EVENT generar_reporte_productos ON SCHEDULE EVERY 1 MONTH DO
INSERT INTO reporte_productos_mensual
SELECT *
FROM productos
WHERE fecha BETWEEN CURDATE() - INTERVAL 1 MONTH AND CURDATE();

-- 13. Archivar cultivos que no han sido sembrados en 6 meses
CREATE EVENT archivar_cultivos_inactivos ON SCHEDULE EVERY 1 MONTH DO
INSERT INTO cultivos_archivados
SELECT *
FROM cultivos
WHERE id_cultivo NOT IN(
    SELECT DISTINCT id_cultivo
    FROM procesos_cultivo
    WHERE fecha >= CURDATE() - INTERVAL 6 MONTH
    );

-- 14. Generar reporte de cultivos mensuales
CREATE EVENT generar_reporte_cultivos ON SCHEDULE EVERY 1 MONTH DO
INSERT INTO reporte_cultivos_mensual
SELECT *
FROM cultivos
WHERE fecha BETWEEN CURDATE() - INTERVAL 1 MONTH AND CURDATE();

-- 15. Archivar animales que no han sido utilizados en 6 meses
CREATE EVENT archivar_animales_inactivos ON SCHEDULE EVERY 1 MONTH DO
INSERT INTO animales_archivados
SELECT *
FROM animales
WHERE id_animal NOT IN(
    SELECT DISTINCT id_animal
    FROM procesos_animales
    WHERE fecha >= CURDATE() - INTERVAL 6 MONTH
    );

-- 16. Generar reporte de animales mensuales
CREATE EVENT generar_reporte_animales ON SCHEDULE EVERY 1 MONTH DO
INSERT INTO reporte_animales_mensual
SELECT *
FROM animales
WHERE fecha BETWEEN CURDATE() - INTERVAL 1 MONTH AND CURDATE();

-- 17. Archivar procesos que no se han ejecutado en 6 meses
CREATE EVENT archivar_procesos_inactivos ON SCHEDULE EVERY 1 MONTH DO
INSERT INTO procesos_archivados
SELECT *
FROM procesos
WHERE id_proceso NOT IN(
    SELECT DISTINCT id_proceso
    FROM procesos_empleado
    WHERE fecha >= CURDATE() - INTERVAL 6 MONTH
    );

-- 18. Generar reporte de procesos mensuales
CREATE EVENT generar_reporte_procesos ON SCHEDULE EVERY 1 MONTH DO
INSERT INTO reporte_procesos_mensual
SELECT *
FROM procesos
WHERE fecha BETWEEN CURDATE() - INTERVAL 1 MONTH AND CURDATE();

-- 19. Archivar zonas que no han sido utilizadas en 6 meses
CREATE EVENT archivar_zonas_inactivas ON SCHEDULE EVERY 1 MONTH DO
INSERT INTO zonas_archivadas
SELECT *
FROM zonas
WHERE id_zona NOT IN(
    SELECT DISTINCT id_zona
    FROM procesos_zona
    WHERE fecha >= CURDATE() - INTERVAL 6 MONTH
    );

-- 20. Generar reporte de zonas mensuales
CREATE EVENT generar_reporte_zonas ON SCHEDULE EVERY 1 MONTH DO
INSERT INTO reporte_zonas_mensual
SELECT *
FROM zonas
WHERE fecha BETWEEN CURDATE() - INTERVAL 1 MONTH AND CURDATE();