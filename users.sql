-- Acá creamos todos los usuarios
CREATE USER 'cliente' @'localhost' IDENTIFIED BY 'cliente123'; -- User Cliente
CREATE USER 'proveedor' @'localhost' IDENTIFIED BY 'proveedor123'; -- User proveedor
CREATE USER 'administrador' @'localhost' IDENTIFIED BY 'admin123'; -- User admin
CREATE USER 'empleado' @'localhost' IDENTIFIED BY 'empleado123'; -- User empleado
CREATE USER 'contador' @'localhost' IDENTIFIED BY 'contador123'; -- User contador


-- Acá asignamos permisos a cada User
GRANT SELECT ON JincaDB.* TO 'cliente' @'localhost'; -- El cliente solo puede hacer consultas
GRANT SELECT, INSERT , UPDATE ON JincaDB.prod_prov TO 'proveedor' @'localhost'; -- El proveedor puede COnsultar, agregar y actualizar en prod_prov
GRANT ALL PRIVILEGES ON JincaDB.* TO 'administrador' @'localhost'; -- El admin tiene todos los permisos 
GRANT SELECT, INSERT ON JincaDB.* TO 'empleado' @'localhost'; -- El empleado puede Consultar y agregar
GRANT SELECT ON JincaDB.* TO 'contador' @'localhost'; -- El contador puede consultar
-- Aplicar cambios
FLUSH PRIVILEGES; -- Acá actualizamos los permiso