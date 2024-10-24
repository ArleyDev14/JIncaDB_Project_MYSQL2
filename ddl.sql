CREATE DATABASE JincaDB;

USE JincaDB;

CREATE TABLE tipos_prod_prov(
    id_tipo_prod_prov INT PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE prod_prov(
    id_prod_prov INT PRIMARY KEY,
    id_tipo_prod_prov INT,
    nombre VARCHAR(100),
    precio DECIMAL,
    stock INT,
    Foreign Key (id_tipo_prod_prov) REFERENCES tipos_prod_prov(id_tipo_prod_prov)
);

CREATE TABLE proveedores(
    id_proveedor INT PRIMARY KEY,
    nombre VARCHAR(255),
    correo VARCHAR(255)
);

CREATE TABLE pedidos_prov( 
    id_pedido_prov INT PRIMARY KEY,
    id_prod_prov INT,
    id_proveedor INT,
    cantidad DECIMAL,
    estado VARCHAR(255),
    Foreign Key (id_prod_prov) REFERENCES prod_prov(id_prod_prov),
    Foreign Key (id_proveedor) REFERENCES proveedores(id_proveedor)
);

CREATE TABLE tipos_inventario(
    id_tipo_inventario INT PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE inventarios(
    id_inventario INT PRIMARY KEY,
    id_tipo_inventario INT,
    nombre VARCHAR(255)
);

CREATE TABLE inv_prod_prov(
    id_inv_prod_prov INT PRIMARY KEY,
    id_inventario INT,
    id_pedido_prov INT,
    Foreign Key (id_inventario) REFERENCES inventarios(id_inventario),
    Foreign Key (id_pedido_prov) REFERENCES pedidos_prov(id_pedido_prov)
);

CREATE TABLE tipos_prod(
    id_tipo_prod INT PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE unidades_medidas(
    id_unidad_medida INT PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE productos(
    id_producto INT PRIMARY KEY,
    id_tipo_prod INT,
    id_unidad_medida INT,
    nombre VARCHAR(100),
    precio DECIMAL,
    stock int,
    Foreign Key (id_tipo_prod) REFERENCES tipos_prod(id_tipo_prod),
    Foreign Key (id_unidad_medida) REFERENCES unidades_medidas(id_unidad_medida)
);

CREATE TABLE clientes(
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(255),
    correo VARCHAR(255)
);

CREATE TABLE ventas(
    id_venta INT PRIMARY KEY,
    id_cliente INT,
    fecha DATE,
    Foreign Key (id_cliente) REFERENCES clientes(id_cliente)
);

CREATE TABLE facturas(
    id_factura INT PRIMARY KEY,
    id_venta INT,
    id_producto INT,
    cantidad DECIMAL,
    total DECIMAL,
    Foreign Key (id_venta) REFERENCES ventas(id_venta),
    Foreign Key (id_producto) REFERENCES productos(id_producto)
);

CREATE TABLE tipos_empleado(
    id_tipo_empleado INT PRIMARY KEY,
    nombre VARCHAR(255)
);

CREATE TABLE empleados(
    id_empleado INT PRIMARY KEY,
    id_tipo_empleado INT,
    nombre VARCHAR(255),
    correo VARCHAR(255),
    salario DECIMAL,
    Foreign Key (id_tipo_empleado) REFERENCES tipos_empleado(id_tipo_empleado)
);

CREATE TABLE procesos(
    id_proceso INT PRIMARY KEY,
    nombre VARCHAR(255)
);

CREATE TABLE maquinas(
    id_maquina INT PRIMARY KEY,
    nombre VARCHAR(255),
    modelo VARCHAR(255)
);

CREATE TABLE procesos_empleado(
    id_proceso_empleado INT PRIMARY KEY,
    id_proceso INT,
    id_empleado INT,
    fecha DATE,
    Foreign Key (id_proceso) REFERENCES procesos(id_proceso),
    Foreign Key (id_empleado) REFERENCES empleados(id_empleado)
);

CREATE TABLE procesos_maquina (
    id_proceso_maquina INT PRIMARY KEY,
    id_proceso INT,
    id_maquina INT,
    id_empleado INT,
    fecha DATE,
    Foreign Key (id_proceso) REFERENCES procesos (id_proceso),
    Foreign Key (id_maquina) REFERENCES maquinas (id_maquina),
    Foreign Key (id_empleado) REFERENCES empleados (id_empleado)
);

CREATE TABLE tipos_zona(
    id_tipo_zona INT PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE zonas(
    id_zona INT PRIMARY KEY,
    id_tipo_zona INT,
    nombre VARCHAR(255),
    Foreign Key (id_tipo_zona) REFERENCES tipos_zona(id_tipo_zona)
);

CREATE TABLE procesos_zona(
    id_proceso_zona INT PRIMARY KEY,
    id_proceso INT,
    id_zona INT,
    fecha DATE,
    Foreign Key (id_proceso) REFERENCES procesos(id_proceso),
    Foreign Key (id_zona) REFERENCES zonas(id_zona)
);

CREATE TABLE cultivos(
    id_cultivo INT PRIMARY KEY,
    id_zona INT,
    nombre VARCHAR(255),
    Foreign Key (id_zona) REFERENCES zonas(id_zona)
);

CREATE TABLE procesos_cultivo(
    id_proceso_cultivo INT PRIMARY KEY,
    id_proceso INT,
    id_cultivo INT,
    fecha DATE,
    Foreign Key (id_proceso) REFERENCES procesos(id_proceso),
    Foreign Key (id_cultivo) REFERENCES cultivos(id_cultivo) 
);

CREATE TABLE animales(
    id_animal INT PRIMARY KEY,
    id_zona INT,
    nombre VARCHAR(255),
    Foreign Key (id_zona) REFERENCES zonas(id_zona)
);

CREATE TABLE procesos_animales(
    id_proceso_animal INT PRIMARY KEY,
    id_animal INT,
    id_proceso INT,
    fecha DATE,
    Foreign Key (id_animal) REFERENCES animales(id_animal),
    Foreign Key (id_proceso) REFERENCES procesos(id_proceso)
);

-- ########################################## TABLAS EVENTOS ########################################
-- Tabla para almacenar ventas archivadas
CREATE TABLE ventas_archivadas (
    id_venta INT PRIMARY KEY,
    id_cliente INT,
    fecha DATE,
    FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente)
);

-- Tabla para almacenar facturas archivadas
CREATE TABLE facturas_archivadas (
    id_factura INT PRIMARY KEY,
    id_venta INT,
    id_producto INT,
    cantidad DECIMAL,
    total DECIMAL,
    FOREIGN KEY (id_venta) REFERENCES ventas (id_venta),
    FOREIGN KEY (id_producto) REFERENCES productos (id_producto)
);

-- Tabla para almacenar reportes de ventas mensuales
CREATE TABLE reporte_ventas_mensual (
    id_venta INT PRIMARY KEY,
    id_cliente INT,
    fecha DATE,
    FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente)
);

-- Tabla para almacenar reportes de facturas mensuales
CREATE TABLE reporte_facturas_mensual (
    id_factura INT PRIMARY KEY,
    id_venta INT,
    id_producto INT,
    cantidad DECIMAL,
    total DECIMAL,
    FOREIGN KEY (id_venta) REFERENCES ventas (id_venta),
    FOREIGN KEY (id_producto) REFERENCES productos (id_producto)
);

-- Tabla para almacenar empleados archivados
CREATE TABLE empleados_archivados (
    id_empleado INT PRIMARY KEY,
    id_tipo_empleado INT,
    nombre VARCHAR(255),
    correo VARCHAR(255),
    salario DECIMAL,
    FOREIGN KEY (id_tipo_empleado) REFERENCES tipos_empleado (id_tipo_empleado)
);

-- Tabla para almacenar reportes de empleados mensuales
CREATE TABLE reporte_empleados_mensual (
    id_empleado INT PRIMARY KEY,
    id_tipo_empleado INT,
    nombre VARCHAR(255),
    correo VARCHAR(255),
    salario DECIMAL,
    FOREIGN KEY (id_tipo_empleado) REFERENCES tipos_empleado (id_tipo_empleado)
);

-- Tabla para almacenar proveedores archivados
CREATE TABLE proveedores_archivados (
    id_proveedor INT PRIMARY KEY,
    nombre VARCHAR(255),
    correo VARCHAR(255)
);

-- Tabla para almacenar reportes de proveedores mensuales
CREATE TABLE reporte_proveedores_mensual (
    id_proveedor INT PRIMARY KEY,
    nombre VARCHAR(255),
    correo VARCHAR(255)
);

-- Tabla para almacenar inventarios archivados
CREATE TABLE inventarios_archivados (
    id_inventario INT PRIMARY KEY,
    id_tipo_inventario INT,
    nombre VARCHAR(255)
);

-- Tabla para almacenar reportes de inventarios mensuales
CREATE TABLE reporte_inventarios_mensual (
    id_inventario INT PRIMARY KEY,
    id_tipo_inventario INT,
    nombre VARCHAR(255)
);

-- Tabla para almacenar productos archivados
CREATE TABLE productos_archivados (
    id_producto INT PRIMARY KEY,
    id_tipo_prod INT,
    id_unidad_medida INT,
    nombre VARCHAR(100),
    precio DECIMAL,
    stock INT,
    FOREIGN KEY (id_tipo_prod) REFERENCES tipos_prod (id_tipo_prod),
    FOREIGN KEY (id_unidad_medida) REFERENCES unidades_medidas (id_unidad_medida)
);

-- Tabla para almacenar reportes de productos mensuales
CREATE TABLE reporte_productos_mensual (
    id_producto INT PRIMARY KEY,
    id_tipo_prod INT,
    id_unidad_medida INT,
    nombre VARCHAR(255),
    precio DECIMAL,
    stock INT,
    Foreign Key (id_tipo_prod) REFERENCES tipos_prod (id_tipo_prod),
    Foreign Key (id_unidad_medida) REFERENCES unidades_medidas (id_unidad_medida)
);

-- ########################################## TABLAS TRIGGERS ########################################
CREATE TABLE totales_ventas (
    id_producto INT,
    cantidad_vendida INT DEFAULT 0,
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

CREATE TABLE historial_salarios (
    id_historial INT PRIMARY KEY AUTO_INCREMENT,
    id_empleado INT,
    salario_anterior DECIMAL,
    salario_nuevo DECIMAL,
    fecha_cambio DATE,
    FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado)
);

CREATE TABLE historial_productos (
    id_historial INT PRIMARY KEY AUTO_INCREMENT,
    id_producto INT,
    nombre_anterior VARCHAR(100),
    nombre_nuevo VARCHAR(100),
    precio_anterior DECIMAL,
    precio_nuevo DECIMAL,
    stock_anterior INT,
    stock_nuevo INT,
    fecha_cambio DATE,
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

CREATE TABLE ingresos (
    id_ingreso INT PRIMARY KEY AUTO_INCREMENT,
    id_venta INT,
    total_ingreso DECIMAL,
    fecha_ingreso DATE,
    FOREIGN KEY (id_venta) REFERENCES ventas(id_venta)
);

CREATE TABLE historial_ventas (
    id_historial INT PRIMARY KEY AUTO_INCREMENT,
    id_factura INT,
    id_producto INT,
    cantidad DECIMAL,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_factura) REFERENCES facturas(id_factura),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

CREATE TABLE notificaciones (
    id_notificacion INT AUTO_INCREMENT PRIMARY KEY,
    mensaje VARCHAR(255) NOT NULL,
    fecha DATE NOT NULL
);

CREATE TABLE historial_proveedores (
    id_historial INT PRIMARY KEY AUTO_INCREMENT,
    id_proveedor INT,
    nombre_anterior VARCHAR(255),
    nombre_nuevo VARCHAR(255),
    correo_anterior VARCHAR(255),
    correo_nuevo VARCHAR(255),
    fecha_cambio DATE,
    FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor)
);

CREATE TABLE historial_pedidos_prov (
    id_historial INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido_prov INT,
    id_proveedor INT,
    cantidad_anterior DECIMAL,
    cantidad_nueva DECIMAL,
    estado_anterior VARCHAR(255),
    estado_nuevo VARCHAR(255),
    fecha_cambio DATETIME,
    FOREIGN KEY (id_pedido_prov) REFERENCES pedidos_prov(id_pedido_prov),
    FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor)
);

CREATE TABLE historial_zonas (
    id_historial INT PRIMARY KEY AUTO_INCREMENT,
    id_zona INT,
    nombre_anterior VARCHAR(255),
    nombre_nuevo VARCHAR(255),
    fecha_cambio DATETIME,
    FOREIGN KEY (id_zona) REFERENCES zonas(id_zona)
);

CREATE TABLE historial_cambios_clientes (
    id_historial INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    campo_modificado VARCHAR(50),
    valor_anterior VARCHAR(255),
    valor_nuevo VARCHAR(255),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

