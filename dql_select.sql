USE JincaDB;

-- 1. Contar el número total de productos en la base de datos.
SELECT COUNT(*) AS Cantidad_productos 
FROM productos;

-- 2. Listar todos los proveedores.
SELECT * 
FROM proveedores;

-- 3. Obtener el producto más caro.
SELECT * 
FROM productos 
ORDER BY precio DESC LIMIT 1;

-- 4. Contar el total de clientes.
SELECT COUNT(*) AS Cantidad_CLientes
FROM clientes;

-- 5. Listar todos los cultivos.
SELECT * 
FROM cultivos;

-- 6. Obtener el total de ventas realizadas
SELECT SUM(total) 
FROM facturas;

-- 7. Contar el número de empleados.
SELECT COUNT(*) AS cantidad_empleados
FROM empleados;

-- 8. Listar todas las zonas.
SELECT * FROM zonas;

-- 9. Obtener la lista de tipos de productos.
SELECT * FROM tipos_prod;

-- 10. Contar las facturas emitidas.
SELECT COUNT(*) 
FROM facturas;

-- 11. Listar las máquinas disponibles.
SELECT * FROM maquinas;

-- 13. Listar todas las ventas realizadas en el último mes.
SELECT *
FROM ventas
WHERE fecha >= CURDATE() - INTERVAL 1 MONTH;

-- 14. Contar el número de tipos de cultivos.
SELECT COUNT(*) 
FROM tipos_prod;

-- 15. Listar los empleados que trabajan en un tipo específico.
SELECT * 
FROM empleados 
WHERE id_tipo_empleado = 1;

-- 16. Obtener la suma de ventas por cada cliente.
SELECT cl.nombre, SUM(total) 
FROM facturas fc
JOIN ventas vn ON fc.id_venta = vn.id_venta
JOIN clientes cl ON vn.id_cliente = cl.id_cliente 
GROUP BY cl.nombre;

-- 18. Contar el número de procesos.
SELECT COUNT(*) FROM procesos;

-- 19. Obtener el promedio de ventas por mes.
SELECT AVG(total)
FROM facturas fc
JOIN ventas vn ON vn.id_venta = fc.id_venta
WHERE vn.fecha >= CURDATE() - INTERVAL 1 YEAR;

-- 20. Listar los productos con menos de 5 unidades en inventario.
SELECT *
FROM productos
WHERE id_producto IN (
        SELECT id_producto
        FROM inventarios
        WHERE
            stock < 5
    );

-- 21. Listar todas las facturas de un cliente específico.
SELECT * FROM ventas WHERE id_cliente = 1;

-- 23. Contar los cultivos por zona.
SELECT id_zona, COUNT(*) FROM cultivos GROUP BY id_zona;

-- 24. Obtener el total de ventas por tipo de producto.
SELECT tpr.nombre, SUM(total)
FROM facturas fc 
JOIN productos pr ON fc.id_producto = pr.id_producto
JOIN tipos_prod tpr ON pr.id_tipo_prod = tpr.id_tipo_prod  
GROUP BY tpr.id_tipo_prod;

-- 25. Listar los empleados que no han realizado ventas.
SELECT *
FROM empleados
WHERE id_empleado NOT IN(
    SELECT DISTINCT id_empleado
    FROM ventas
    );

-- 26. Obtener los tipos de productos que tienen al menos un proveedor.
SELECT *
FROM tipos_prod
WHERE id_tipo_prod IN (
    SELECT DISTINCT id_tipo_prod
    FROM prod_prov
    );

-- 27. Contar el número de productos por tipo.
SELECT id_tipo_prod, COUNT(*) FROM productos GROUP BY id_tipo_prod;

-- 28. Listar los productos que han sido vendidos.
SELECT *
FROM productos
WHERE
    id_producto IN (
        SELECT DISTINCT
            id_producto
        FROM ventas
    );

-- 29. Obtener la suma de ingresos por cliente.
SELECT cl.nombre, SUM(total) 
FROM ventas vn
JOIN facturas fc ON vn.id_venta = fc.id_venta
JOIN clientes cl ON cl.id_cliente = vn.id_cliente
GROUP BY cl.nombre;

-- 30. Listar las máquinas que han sido utilizadas en un proceso específico.
SELECT *
FROM maquinas
WHERE id_maquina IN (
    SELECT id_maquina
    FROM procesos_maquina
    WHERE id_proceso = 1
);

-- 31. Contar los empleados por tipo de empleado.
SELECT tem.nombre, COUNT(*)
FROM empleados em
JOIN tipos_empleado tem ON em.id_tipo_empleado = tem.id_tipo_empleado
GROUP BY tem.nombre;

-- 32. Obtener la cantidad de ventas por producto.
SELECT pr.nombre, COUNT(*) 
FROM ventas vn
JOIN facturas fc ON vn.id_venta = fc.id_factura
JOIN productos pr ON fc.id_producto = pr.id_producto
GROUP BY pr.nombre;

-- 34. Obtener el promedio de precios de todos los productos.
SELECT AVG(precio) FROM productos;

-- 35. Listar productos que tienen una cantidad en inventario menor que 10.
SELECT *
FROM productos
WHERE id_producto IN (
        SELECT id_producto
        FROM productos
        WHERE stock < 10
    );

-- 36. Contar las zonas que tienen cultivos específicos.
SELECT zn.nombre
FROM cultivos
JOIN zonas zn ON zn.id_zona = cultivos.id_zona
WHERE id_cultivo = 2


-- 37. Obtener los proveedores que no han realizado ventas en el último año.
SELECT *
FROM proveedores
WHERE
    id_proveedor NOT IN(
    SELECT DISTINCT id_proveedor
    FROM ventas
    WHERE fecha >= CURDATE() - INTERVAL 1 YEAR
    );

-- 38. Listar productos con precio superior al promedio de precios de todos los productos.
SELECT nombre, precio
FROM productos
WHERE precio > (
    SELECT AVG(precio)
    FROM productos
    );

-- 39. Obtener los tipos de cultivos que no han generado ventas.
SELECT *
FROM tipos_prod
WHERE id_tipo_prod NOT IN(
    SELECT DISTINCT id_tipo_prod
    FROM ventas
    );

-- 40. Contar los tipos de productos que no tienen inventario.
SELECT COUNT(*)
FROM tipos_prod
WHERE id_tipo_prod NOT IN(
    SELECT DISTINCT id_tipo_prod
    FROM inv_prod_prov
    );

-- 41. Contar las máquinas utilizadas en un proceso específico.
SELECT COUNT(*)
FROM maquinas
WHERE id_maquina IN (
    SELECT id_maquina
    FROM procesos_maquina
    WHERE id_proceso = 1
    );

-- 43. Obtener el número total de procesos en los que participa cada empleado.
SELECT em.nombre, COUNT(*)
FROM procesos_maquina pma 
JOIN empleados em ON pma.id_empleado = em.id_empleado
GROUP BY em.nombre;

-- 44. Contar las facturas de productos que no han sido vendidos.
SELECT COUNT(*)
FROM facturas
WHERE id_producto NOT IN(
    SELECT DISTINCT id_producto
    FROM ventas
    );

-- 45. Listar las máquinas que están asignadas a un proceso específico.
SELECT *
FROM maquinas
WHERE id_maquina IN (
    SELECT id_maquina
    FROM procesos_maquina
    WHERE id_proceso = 1
    );

-- 46. Obtener la suma total de ventas por cliente, excluyendo aquellos sin compras.
SELECT cl.nombre, SUM(total)
FROM facturas fc
JOIN ventas vn ON fc.id_venta = vn.id_venta
JOIN clientes cl ON vn.id_cliente = cl.id_cliente
GROUP BY cl.nombre
HAVING COUNT(*) > 0;

-- 48. Listar todos los productos que no han sido comprados por algún cliente.
SELECT *
FROM productos
WHERE id_producto NOT IN(
    SELECT DISTINCT id_producto
    FROM ventas
    );

-- 49. Obtener las ventas totales de un producto específico.
SELECT SUM(total) 
FROM facturas 
WHERE id_producto = 1;

-- 50. Listar productos que han tenido al menos una venta.
SELECT *
FROM productos
WHERE id_producto IN (
    SELECT DISTINCT id_producto
    FROM ventas
    );

-- 51. Listar empleados que han participado en un proceso específico.
SELECT *
FROM empleados
WHERE id_empleado IN (
    SELECT id_empleado
    FROM procesos_maquina
    WHERE id_proceso = 2
    );

-- 52. Obtener la suma de ingresos por cliente para aquellos que han realizado más de 3 compras.
SELECT id_cliente, SUM(total)
FROM facturas fc
JOIN ventas vn ON vn.id_venta = fc.id_venta
WHERE id_cliente IN (
    SELECT id_cliente
    FROM ventas
    GROUP BY id_cliente
    HAVING COUNT(*) > 3
    )
GROUP BY id_cliente;

-- 53. Contar el total de productos por categoría.
SELECT tpr.nombre, COUNT(*) 
FROM productos pr
JOIN tipos_prod tpr ON tpr.id_tipo_prod = pr.id_tipo_prod
GROUP BY tpr.nombre;

-- 54. Listar clientes que han hecho más de 10 compras.
SELECT *
FROM clientes
WHERE id_cliente IN (
    SELECT id_cliente
    FROM ventas
    GROUP BY id_cliente
    HAVING COUNT(*) > 10
    );

-- 55. Obtener todas las compras de un cliente específico.
SELECT * 
FROM ventas 
WHERE id_cliente = 1;

-- 56. Contar los cultivos en un área específica.
SELECT COUNT(*) 
FROM cultivos 
WHERE id_zona = 1;

-- 58. Obtener la información de un empleado específico.
SELECT * FROM empleados WHERE id_empleado = 1;

-- 59. Contar el total de facturas por cliente.
SELECT cl.nombre, COUNT(*) 
FROM ventas vn
JOIN clientes cl ON vn.id_cliente = cl.id_cliente
GROUP BY cl.nombre;

-- 60. Listar todos los tipos de cultivo disponibles.
SELECT * 
FROM tipos_prod;

-- 61. Contar los productos que están en inventario.
SELECT COUNT(*) 
FROM inventarios;

-- 62. Obtener información sobre el producto más caro.
SELECT nombre, precio
FROM productos 
ORDER BY precio DESC LIMIT 1;

-- 63. Listar productos que no han sido vendidos.
SELECT *
FROM productos
WHERE id_producto NOT IN(
    SELECT DISTINCT id_producto
    FROM ventas
    );

-- 64. Contar las facturas de productos que no han sido vendidos.
SELECT COUNT(*)
FROM facturas
WHERE id_producto NOT IN(
    SELECT DISTINCT id_producto
    FROM ventas
    );

-- 65. Listar los empleados que no están asignados a ningún proyecto.
SELECT *
FROM empleados
WHERE id_empleado NOT IN(
    SELECT DISTINCT id_empleado
    FROM procesos
    );

-- 67. Listar los productos cuyo precio es menor que el precio medio.
SELECT *
FROM productos
WHERE precio < (
    SELECT AVG(precio)
    FROM productos
    );

-- 68. Contar la cantidad de máquinas disponibles.
SELECT COUNT(*) FROM maquinas;

-- 69. Obtener la suma de productos vendidos por cada tipo de producto.
SELECT tpr.nombre, SUM(cantidad) 
FROM facturas fc 
JOIN ventas vn ON vn.id_venta = fc.id_venta
JOIN productos pr ON fc.id_producto = pr.id_producto
JOIN tipos_prod tpr ON tpr.id_tipo_prod = pr.id_tipo_prod
GROUP BY tpr.nombre;

-- 71. Contar la cantidad de productos en cada tipo de inventario.
SELECT tinv.nombre, COUNT(*)
FROM inventarios inv
JOIN tipos_inventario tinv ON inv.id_tipo_inventario = tinv.id_tipo_inventario
GROUP BY tinv.nombre;

-- 72. Obtener la lista de empleados que tienen un tipo específico.
SELECT * 
FROM empleados 
WHERE id_tipo_empleado = 1;

-- 73. Listar las facturas generadas en el último mes.
SELECT *
FROM ventas
WHERE fecha >= CURDATE() - INTERVAL 1 MONTH;

-- 74. Obtener la suma total de ventas por tipo de producto.
SELECT tpr.nombre, SUM(total)
FROM facturas fc
JOIN productos pr ON fc.id_producto = pr.id_producto
JOIN tipos_prod tpr ON tpr.id_tipo_prod = pr.id_tipo_prod
GROUP BY tpr.nombre;

-- 75. Contar las máquinas que están asignadas a procesos específicos.
SELECT COUNT(*)
FROM maquinas
WHERE id_maquina IN (
    SELECT id_maquina
    FROM procesos_maquina
    );

-- 76. Listar los clientes que han realizado más de 5 compras.
SELECT *
FROM clientes
WHERE id_cliente IN (
    SELECT id_cliente
    FROM ventas
    GROUP BY id_cliente
    HAVING COUNT(*) > 5
    );

-- 77. Obtener información sobre los tipos de productos que tienen al menos un proveedor.
SELECT *
FROM tipos_prod
WHERE id_tipo_prod IN (
    SELECT DISTINCT id_tipo_prod
    FROM prod_prov
    );

-- 78. Contar el número de procesos realizados por un empleado específico.
SELECT COUNT(*) 
FROM procesos_empleado
WHERE id_empleado = 1;

-- 79. Listar todos los pedidos realizados por un proveedor específico.
SELECT * 
FROM pedidos_prov 
WHERE id_proveedor = 1;

-- 81. Contar los productos que han sido comprados en el último mes.
SELECT COUNT(*)
FROM productos
WHERE id_producto IN (
    SELECT id_producto
    FROM ventas
    WHERE fecha >= CURDATE() - INTERVAL 1 MONTH
    );

-- 83. Obtener la información de la máquina
SELECT * 
FROM maquinas

-- 84. Listar todos los tipos de cultivos que han generado ventas.
SELECT *
FROM tipos_prod
WHERE id_tipo_prod IN (
    SELECT DISTINCT id_tipo_prod
    FROM ventas
    );

-- 85. Contar el total de ventas por mes.
SELECT MONTH(fecha) AS mes, SUM(total)
FROM ventas vn
JOIN facturas fc ON vn.id_venta = vn.id_venta
GROUP BY MONTH(fecha);

-- 86. Obtener la cantidad de productos que están por debajo del stock mínimo.
SELECT *
FROM productos
WHERE id_producto IN (
    SELECT id_producto
    FROM inventarios
    WHERE stock < 10
    );

-- 87. Listar las máquinas que no están asignadas a ningún proceso.
SELECT *
FROM maquinas
WHERE id_maquina NOT IN(
    SELECT DISTINCT id_maquina
    FROM procesos_maquina
    );

-- 88. Obtener la suma total de ventas de un producto específico.
SELECT SUM(total) 
FROM facturas 
WHERE id_producto = 1;

-- 89. Listar todos los productos en inventario con precio superior a 100.
SELECT *
FROM productos
WHERE id_producto IN (
    SELECT id_producto
    FROM inventarios
    WHERE precio > 100
    );

-- 90. Contar el número de productos en cada tipo de inventario.
SELECT tinv.nombre, COUNT(*)
FROM inventarios inv
JOIN tipos_inventario tinv ON inv.id_tipo_inventario = tinv.id_tipo_inventario
GROUP BY tinv.nombre;

-- 91. Listar clientes que no han realizado compras en el último año.
SELECT *
FROM clientes
WHERE id_cliente NOT IN(
    SELECT id_cliente
    FROM ventas
    WHERE fecha >= CURDATE() - INTERVAL 1 YEAR
    );

-- 92. Obtener la cantidad de cultivos por zona.
SELECT id_zona, COUNT(*) 
FROM cultivos 
GROUP BY id_zona;

-- 93. Listar las facturas de ventas realizadas en el último mes.
SELECT *
FROM ventas
WHERE fecha >= CURDATE() - INTERVAL 1 MONTH;

-- 94. Obtener los productos que no tienen inventario.
SELECT *
FROM productos
WHERE
    id_producto NOT IN(
        SELECT id_producto
        FROM inventarios
    );

-- 95. Contar las máquinas utilizadas en un proceso específico.
SELECT COUNT(*)
FROM maquinas
WHERE id_maquina IN (
    SELECT id_maquina
    FROM procesos_maquina
    WHERE id_proceso = 1
    );

-- 96. Obtener la cantidad total de productos en inventario.
SELECT SUM(cantidad) FROM pedidos_prov;

-- 97. Listar los empleados que han generado ventas en el último mes.
SELECT *
FROM empleados
WHERE id_empleado IN (
    SELECT DISTINCT id_empleado
    FROM ventas
    WHERE fecha >= CURDATE() - INTERVAL 1 MONTH
    );

-- 98. Listar todos los productos que no han sido comprados por algún cliente.
SELECT *
FROM productos
WHERE
    id_producto NOT IN(
        SELECT DISTINCT
            id_producto
        FROM ventas
    );