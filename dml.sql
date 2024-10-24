USE JincaDB;


INSERT INTO tipos_prod_prov(id_tipo_prod_prov, nombre) VALUES
(1, "Abonos"),
(2, "Herramientas"),
(3, "Semillas"),
(4, "Fertilizantes"),
(5, "Plaguicidas"),
(6, "Herbicidas"),
(7, "Insecticidas"),
(8, "Fungicidas"),
(9, "Alimentos para animales"),
(10, "Medicamentos veterinarios"),
(11, "Equipos de protección"),
(12, "Pulverizadores");
--| ID | nombre |


INSERT INTO prod_prov(id_prod_prov, id_tipo_prod_prov, nombre, precio, stock) VALUES
(1, 2, "Tijeras", 20.50, 100),
(2, 2, "Pala", 50.00, 100),
(3, 1, "Abono orgánico", 35.00, 100),
(4, 1, "Abono químico", 45.00, 100),
(5, 3, "Semillas de maíz", 10.00, 100),
(6, 3, "Semillas de tomate", 8.50, 100),
(7, 4, "Fertilizante nitrogenado", 25.75, 100),
(8, 4, "Fertilizante fosfórico", 30.00, 100),
(9, 5, "Plaguicida natural", 18.90, 100),
(10, 5, "Plaguicida sintético", 22.50, 100),
(11, 6, "Herbicida de contacto", 12.00, 100),
(12, 6, "Herbicida sistémico", 14.00, 100),
(13, 7, "Insecticida para moscas", 20.00, 100),
(14, 7, "Insecticida para pulgones", 22.75, 100),
(15, 8, "Fungicida de azufre", 15.00, 100),
(16, 8, "Fungicida cúprico", 19.50, 100),
(17, 9, "Alimento balanceado para cerdos", 50.00, 100),
(18, 9, "Alimento para pollos", 35.00, 100),
(19, 10, "Antibióticos para ganado", 70.00, 100),
(20, 10, "Vitaminas para caballos", 40.00, 100),
(21, 11, "Casco de seguridad", 12.00, 100),
(22, 11, "Guantes de protección", 7.50, 100),
(23, 11, "Gafas de seguridad", 10.00, 100),
(24, 11, "Botas de seguridad", 25.00, 100),
(25, 12, "Pulverizador manual", 55.00, 100),
(26, 12, "Pulverizador a motor", 120.00, 100),
(27, 1, "Abono compost", 28.00, 100),
(28, 2, "Machete", 35.00, 100),
(29, 2, "Rastrillo", 15.50, 100),
(30, 2, "Carretilla", 75.00, 100),
(31, 3, "Semillas de lechuga", 9.00, 100),
(32, 4, "Fertilizante potásico", 32.00, 100),
(33, 5, "Plaguicida para ácaros", 24.00, 100),
(34, 6, "Herbicida selectivo", 18.00, 100),
(35, 7, "Insecticida para hormigas", 25.00, 100),
(36, 8, "Fungicida multisitio", 17.00, 100),
(37, 9, "Alimento para ovejas", 45.00, 100),
(38, 9, "Alimento para vacas", 60.00, 100),
(39, 10, "Desparasitante para caballos", 30.00, 100),
(40, 11, "Chaleco reflectante", 15.00, 100),
(41, 12, "Pulverizador de mochila", 85.00, 100),
(42, 2, "Hacha", 40.00, 100),
(43, 3, "Semillas de zanahoria", 10.50, 100),
(44, 4, "Fertilizante orgánico", 27.50, 100),
(45, 5, "Plaguicida ecológico", 26.00, 100),
(46, 6, "Herbicida no selectivo", 16.50, 100),
(47, 7, "Insecticida biológico", 23.50, 100),
(48, 8, "Fungicida orgánico", 20.00, 100),
(49, 9, "Alimento para conejos", 38.00, 100),
(50, 10, "Sueros vitamínicos", 55.00, 100);

--| ID | Id_tipo | nombre | precio


INSERT INTO proveedores(id_proveedor,nombre,correo)VALUES
(1,"Proveedor1","proveedor1@gmail.com"),
(2,"Proveedor2","proveedor2@gmail.com"),
(3,"Proveedor3","proveedor3@gmail.com"),
(4,"Proveedor4","proveedor4@gmail.com"),
(5,"Proveedor5","proveedor5@gmail.com");
-- | ID | nombre | correo |


INSERT INTO pedidos_prov(id_pedido_prov, id_prod_prov, id_proveedor, cantidad, estado) VALUES
(1, 1, 2, 5, 'en proceso'),
(2, 1, 1, 2, 'entregado'),
(3, 2, 3, 4, 'cancelado'),
(4, 3, 4, 10, 'en proceso'),
(5, 4, 5, 7, 'entregado'),
(6, 5, 1, 15, 'cancelado'),
(7, 6, 2, 20, 'en proceso'),
(8, 7, 3, 12, 'entregado'),
(9, 8, 4, 8, 'cancelado'),
(10, 9, 5, 6, 'en proceso'),
(11, 10, 1, 9, 'entregado'),
(12, 11, 2, 5, 'cancelado'),
(13, 12, 3, 14, 'en proceso'),
(14, 13, 4, 18, 'entregado'),
(15, 14, 5, 3, 'cancelado'),
(16, 15, 1, 25, 'en proceso'),
(17, 16, 2, 7, 'entregado'),
(18, 17, 3, 4, 'cancelado'),
(19, 18, 4, 10, 'en proceso'),
(20, 19, 5, 11, 'entregado'),
(21, 20, 1, 6, 'cancelado'),
(22, 21, 2, 8, 'en proceso'),
(23, 22, 3, 16, 'entregado'),
(24, 23, 4, 9, 'cancelado'),
(25, 24, 5, 12, 'en proceso'),
(26, 25, 1, 5, 'entregado'),
(27, 26, 2, 10, 'cancelado'),
(28, 27, 3, 14, 'en proceso'),
(29, 28, 4, 18, 'entregado'),
(30, 29, 5, 9, 'cancelado'),
(31, 30, 1, 6, 'en proceso'),
(32, 31, 2, 7, 'entregado'),
(33, 32, 3, 20, 'cancelado'),
(34, 33, 4, 11, 'en proceso'),
(35, 34, 5, 5, 'entregado'),
(36, 35, 1, 9, 'cancelado'),
(37, 36, 2, 13, 'en proceso'),
(38, 37, 3, 15, 'entregado'),
(39, 38, 4, 8, 'cancelado'),
(40, 39, 5, 6, 'en proceso'),
(41, 40, 1, 11, 'entregado'),
(42, 41, 2, 14, 'cancelado'),
(43, 42, 3, 17, 'en proceso'),
(44, 43, 4, 12, 'entregado'),
(45, 44, 5, 9, 'cancelado'),
(46, 45, 1, 16, 'en proceso'),
(47, 46, 2, 10, 'entregado'),
(48, 47, 3, 8, 'cancelado'),
(49, 48, 4, 12, 'en proceso'),
(50, 49, 5, 7, 'entregado');

-- | ID | id_producto | id_proveedor | cantidad |


INSERT INTO tipos_inventario(id_tipo_inventario,nombre)VALUES
(1,"Inventario de Cultivos"),
(2,"Inventario de Productos animales"),
(3,"Inventario de Maquinas"),
(4,"Inventario de Otros")
-- | ID | Nombre |


INSERT INTO inventarios(id_inventario,id_tipo_inventario,nombre)VALUES
(1,1,"InventC"),
(2,2,"InventA"),
(3,3,"InventM"),
(4,4,"InventO");
-- | ID | Id_tipo | nombre |


INSERT INTO inv_prod_prov(id_inv_prod_prov, id_inventario, id_pedido_prov) VALUES
(1, 3, 1),
(2, 3, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 1, 8),
(9, 1, 9),
(10, 1, 10),
(11, 1, 11),
(12, 1, 12),
(13, 1, 13),
(14, 1, 14),
(15, 1, 15),
(16, 1, 16),
(17, 2, 17),
(18, 2, 18),
(19, 2, 19),
(20, 2, 20),
(21, 3, 21),
(22, 3, 22),
(23, 3, 23),
(24, 3, 24),
(25, 3, 25),
(26, 3, 26),
(27, 1, 27),
(28, 3, 28),
(29, 3, 29),
(30, 3, 30),
(31, 1, 31),
(32, 1, 32),
(33, 1, 33),
(34, 1, 34),
(35, 1, 35),
(36, 1, 36),
(37, 2, 37),
(38, 2, 38),
(39, 2, 39),
(40, 3, 40),
(41, 3, 41),
(42, 3, 42),
(43, 1, 43),
(44, 1, 44),
(45, 1, 45),
(46, 1, 46),
(47, 1, 47),
(48, 1, 48),
(49, 2, 49),
(50, 2, 50);
-- | ID | id_inventario | id_pedido |


INSERT INTO tipos_prod(id_tipo_prod, nombre) VALUES
(1, "Cultivo"),
(2, "Lácteo"),
(3, "Carne"),
(4, "Huevo");

-- | ID | nombre_tipo |


INSERT INTO unidades_medidas(id_unidad_medida, nombre)VALUES
(1,"Canastilla"),
(2,"Kilo"),
(3,"Libra"),
(4,"Litro"),
(5,"Saco"),
(6,"Unidad");

-- | ID | Nombre_medida |

INSERT INTO productos(id_producto, id_tipo_prod, id_unidad_medida, nombre, precio, stock) VALUES
(1, 1, 2, "Limón", 60000.00, 100),
(2, 1, 1, "Maracuyá", 40000.00, 100),
(3, 1, 1, "Mango", 35000.00, 100),
(4, 1, 1, "Piña", 30000.00, 100),
(5, 1, 1, "Naranja", 28000.00, 100),
(6, 1, 1, "Mandarina", 26000.00, 100),
(7, 1, 1, "Fresas", 50000.00, 100),
(8, 1, 2, "Zanahoria", 18000.00, 100),
(9, 1, 2, "Tomate", 25000.00, 100),
(10, 1, 2, "Pimentón", 30000.00, 100),
(11, 1, 2, "Cebolla", 22000.00, 100),
(12, 1, 2, "Café", 50000.00, 100),
(13, 2, 4, "Leche de Vaca", 2000.00, 100),
(14, 2, 4, "Leche de Cabra", 2500.00, 100),
(15, 3, 2, "Carne de Cordero", 45000.00, 100),
(16, 3, 2, "Carne de Cerdo", 40000.00, 100),
(17, 4, 6, "Huevos de Gallina", 9000.00, 100),
(18, 3, 2, "Pollo",25000.00, 100);
-- | ID | id_tipo | id_medidad | nombre | precio | stock


INSERT INTO clientes(id_cliente, nombre, correo)VALUES
(1,"Juan Ruiz","Juanruiz@gmail.com"),
(2,"Zurdo Vaca", "Vaca@gmail.com"),
(3,"Isabella Navas", "Isa@gmail.com"),
(4, "Carlos Pérez", "carlosp@gmail.com"),
(5, "Ana Gómez", "ana.gomez@gmail.com"),
(6, "Diego Fernández", "dfernandez@gmail.com"),
(7, "María Jiménez", "mariaj@gmail.com"),
(8, "Luis Torres", "luis.torres@gmail.com"),
(9, "Sofía Castillo", "sofia.castillo@gmail.com"),
(10, "Pedro Sánchez", "pedros@gmail.com"),
(11, "Laura Romero", "laura.romero@gmail.com"),
(12, "José Díaz", "josediaz@gmail.com"),
(13, "Lucía Márquez", "lucia.marquez@gmail.com"),
(14, "Miguel Herrera", "miguelh@gmail.com"),
(15, "Elena Cruz", "elenac@gmail.com"),
(16, "Alberto Silva", "asilva@gmail.com"),
(17, "Claudia Vargas", "claudia.vargas@gmail.com"),
(18, "Felipe Soto", "felipesoto@gmail.com"),
(19, "Paula Rojas", "paular@gmail.com"),
(20, "Javier Ortiz", "javier.ortiz@gmail.com"),
(21, "Gabriela Méndez", "gaby.mendez@gmail.com"),
(22, "Ricardo Ramírez", "ricardo.ramirez@gmail.com"),
(23, "Valentina Morales", "valentina.morales@gmail.com"),
(24, "Andrés Serrano", "andres.serrano@gmail.com"),
(25, "Patricia Martínez", "patricia.martinez@gmail.com"),
(26, "Francisco Castro", "fran.castro@gmail.com"),
(27, "Carmen Medina", "carmen.medina@gmail.com"),
(28, "Daniela Reyes", "danireyes@gmail.com"),
(29, "Gustavo López", "glopez@gmail.com"),
(30, "Monica Peña", "monicap@gmail.com"),
(31, "Esteban Salinas", "estebans@gmail.com"),
(32, "Inés Benítez", "ines.benitez@gmail.com"),
(33, "Rafael Ruiz", "rafaelruiz@gmail.com"),
(34, "Beatriz Campos", "beatrizc@gmail.com"),
(35, "Manuel Flores", "manuel.flores@gmail.com"),
(36, "Sara Aguilar", "sara.aguilar@gmail.com"),
(37, "Pablo Guerra", "pablog@gmail.com"),
(38, "Marta León", "martaleon@gmail.com"),
(39, "Rodrigo Ramos", "rodrigor@gmail.com"),
(40, "Natalia Duarte", "natalia.duarte@gmail.com"),
(41, "Óscar Cortés", "oscar.cortes@gmail.com"),
(42, "Carolina Peña", "carolina.pena@gmail.com"),
(43, "Eduardo Vera", "eduardo.vera@gmail.com"),
(44, "Fabiola Suárez", "fab.suarez@gmail.com"),
(45, "Ignacio Méndez", "ignacio.m@gmail.com"),
(46, "Rebeca Moreno", "rebeca.moreno@gmail.com"),
(47, "Roberto Gil", "roberto.gil@gmail.com"),
(48, "Adriana Palacios", "adriana.palacios@gmail.com"),
(49, "Emilio Lara", "emilio.lara@gmail.com"),
(50, "Virginia Muñoz", "virginia.munoz@gmail.com");
-- | ID | Nombre | Correo |


INSERT INTO ventas(id_venta,id_cliente,fecha)VALUES
(1, 1, "2024-12-14"),
(2, 1, "2024-01-30"),
(3, 3, "2024-05-05"),
(4, 2, "2024-02-10"),
(5, 3, "2024-03-15"),
(6, 4, "2024-04-20"),
(7, 5, "2024-05-25"),
(8, 6, "2024-06-30"),
(9, 7, "2024-07-05"),
(10, 8, "2024-08-10"),
(11, 9, "2024-09-15"),
(12, 10, "2024-10-20"),
(13, 11, "2024-11-25"),
(14, 12, "2024-12-01"),
(15, 13, "2024-12-05"),
(16, 14, "2024-12-10"),
(17, 15, "2024-12-12"),
(18, 16, "2024-12-14"),
(19, 17, "2024-12-16"),
(20, 18, "2024-12-18"),
(21, 19, "2024-12-20"),
(22, 20, "2024-12-22"),
(23, 21, "2024-12-24"),
(24, 22, "2024-12-26"),
(25, 23, "2024-12-28"),
(26, 24, "2024-12-30"),
(27, 25, "2024-12-31"),
(28, 26, "2024-11-05"),
(29, 27, "2024-10-25"),
(30, 28, "2024-09-12"),
(31, 29, "2024-08-08"),
(32, 30, "2024-07-14"),
(33, 31, "2024-06-18"),
(34, 32, "2024-05-22"),
(35, 33, "2024-04-26"),
(36, 34, "2024-03-30"),
(37, 35, "2024-02-12"),
(38, 36, "2024-01-08"),
(39, 37, "2024-12-17"),
(40, 38, "2024-11-09"),
(41, 39, "2024-10-11"),
(42, 40, "2024-09-03"),
(43, 41, "2024-08-15"),
(44, 42, "2024-07-28"),
(45, 43, "2024-06-16"),
(46, 44, "2024-05-30"),
(47, 45, "2024-04-04"),
(48, 46, "2024-03-14"),
(49, 47, "2024-02-22"),
(50, 48, "2024-01-12");
-- | ID | Id_cliente | fecha |

INSERT INTO facturas(id_factura, id_venta, id_producto, cantidad, total) VALUES
(1, 1, 1, 2, 120000.00),    -- Venta 1, Limón, 2 kilos
(2, 1, 2, 10, 120000.00),   -- Venta 1, Maracuyá, 10 canastillas
(3, 2, 3, 5, 120000.00),    -- Venta 2, Mango, 5 canastillas
(4, 2, 4, 4, 120000.00),    -- Venta 2, Piña, 4 canastillas
(5, 3, 5, 6, 120000.00),    -- Venta 3, Naranja, 6 canastillas
(6, 3, 6, 8, 120000.00),    -- Venta 3, Mandarina, 8 canastillas
(7, 4, 7, 3, 120000.00),    -- Venta 4, Fresas, 3 canastillas
(8, 4, 8, 12, 120000.00),   -- Venta 4, Zanahoria, 12 kilos
(9, 5, 9, 7, 120000.00),    -- Venta 5, Tomate, 7 kilos
(10, 5, 10, 5, 120000.00),  -- Venta 5, Pimentón, 5 kilos
(11, 6, 11, 10, 120000.00), -- Venta 6, Cebolla, 10 kilos
(12, 6, 12, 15, 120000.00), -- Venta 6, Café, 15 kilos
(13, 7, 13, 20, 120000.00), -- Venta 7, Leche de Vaca, 20 litros
(14, 7, 14, 25, 120000.00), -- Venta 7, Leche de Cabra, 25 litros
(15, 8, 15, 8, 120000.00),  -- Venta 8, Carne de Cordero, 8 kilos
(16, 8, 16, 9, 120000.00),  -- Venta 8, Carne de Cerdo, 9 kilos
(17, 9, 17, 12, 120000.00), -- Venta 9, Huevos de Gallina, 12 docenas
(18, 10, 18, 6, 120000.00), -- Venta 10, Pollo, 6 kilos
(19, 11, 1, 4, 120000.00),  -- Venta 11, Limón, 4 kilos
(20, 11, 2, 6, 120000.00),  -- Venta 11, Maracuyá, 6 canastillas
(21, 12, 3, 7, 120000.00),  -- Venta 12, Mango, 7 canastillas
(22, 12, 4, 10, 120000.00), -- Venta 12, Piña, 10 canastillas
(23, 13, 5, 3, 120000.00),  -- Venta 13, Naranja, 3 canastillas
(24, 13, 6, 6, 120000.00),  -- Venta 13, Mandarina, 6 canastillas
(25, 14, 7, 5, 120000.00),  -- Venta 14, Fresas, 5 canastillas
(26, 14, 8, 8, 120000.00),  -- Venta 14, Zanahoria, 8 kilos
(27, 15, 9, 4, 120000.00),  -- Venta 15, Tomate, 4 kilos
(28, 15, 10, 7, 120000.00), -- Venta 15, Pimentón, 7 kilos
(29, 16, 11, 6, 120000.00), -- Venta 16, Cebolla, 6 kilos
(30, 16, 12, 10, 120000.00),-- Venta 16, Café, 10 kilos
(31, 17, 13, 15, 120000.00),-- Venta 17, Leche de Vaca, 15 litros
(32, 17, 14, 20, 120000.00),-- Venta 17, Leche de Cabra, 20 litros
(33, 18, 15, 12, 120000.00),-- Venta 18, Carne de Cordero, 12 kilos
(34, 18, 16, 10, 120000.00),-- Venta 18, Carne de Cerdo, 10 kilos
(35, 19, 17, 18, 120000.00),-- Venta 19, Huevos de Gallina, 18 docenas
(36, 20, 18, 9, 120000.00), -- Venta 20, Pollo, 9 kilos
(37, 21, 1, 8, 120000.00),  -- Venta 21, Limón, 8 kilos
(38, 21, 2, 12, 120000.00), -- Venta 21, Maracuyá, 12 canastillas
(39, 22, 3, 5, 120000.00),  -- Venta 22, Mango, 5 canastillas
(40, 22, 4, 6, 120000.00),  -- Venta 22, Piña, 6 canastillas
(41, 23, 5, 10, 120000.00), -- Venta 23, Naranja, 10 canastillas
(42, 23, 6, 9, 120000.00),  -- Venta 23, Mandarina, 9 canastillas
(43, 24, 7, 7, 120000.00),  -- Venta 24, Fresas, 7 canastillas
(44, 24, 8, 15, 120000.00), -- Venta 24, Zanahoria, 15 kilos
(45, 25, 9, 8, 120000.00),  -- Venta 25, Tomate, 8 kilos
(46, 25, 10, 10, 120000.00),-- Venta 25, Pimentón, 10 kilos
(47, 26, 11, 12, 120000.00),-- Venta 26, Cebolla, 12 kilos
(48, 26, 12, 20, 120000.00),-- Venta 26, Café, 20 kilos
(49, 27, 13, 18, 120000.00),-- Venta 27, Leche de Vaca, 18 litros
(50, 27, 14, 25, 120000.00);-- Venta 27, Leche de Cabra, 25 litros

-- | ID | id_venta | id_producto | cantidad |


INSERT INTO tipos_empleado(id_tipo_empleado,nombre)VALUES
(1,"Limpiador"),
(2,"Macaneador"),
(3,"Recolector"),
(4,"Fumigador"),
(5,"Mayordomo"),
(6,"Veterinario"),
(7,"Conductor"),
(8,"Sembrador"),
(9,"Celador"),
(10,"Contador"),
(11,"Supervisor"),
(12,"Mecanico"),
(13,"Vendedor"),
(14,"Empacador");
-- | ID | Nombre_tipo |


INSERT INTO empleados(id_empleado,id_tipo_empleado,nombre,correo,salario)VALUES
(1,1,"Angel Parra","Angel@gmail.com",220000.00),
(2,4,"Arley Rueda","Arley@gmail.com",550000.00),
(3, 2, "Mario González", "mario.gonzalez@gmail.com", 300000.00),
(4, 3, "Carlos Ruiz", "carlos.ruiz@gmail.com", 280000.00),
(5, 5, "Juan Martínez", "juan.martinez@gmail.com", 600000.00),
(6, 6, "Diana Pérez", "diana.perez@gmail.com", 750000.00),
(7, 7, "Pedro Fernández", "pedro.fernandez@gmail.com", 350000.00),
(8, 8, "Laura Gómez", "laura.gomez@gmail.com", 270000.00),
(9, 9, "Rafael Torres", "rafael.torres@gmail.com", 250000.00),
(10, 10, "Sofía López", "sofia.lopez@gmail.com", 900000.00),
(11, 1, "Miguel Jiménez", "miguel.jimenez@gmail.com", 230000.00),
(12, 4, "Roberto Sánchez", "roberto.sanchez@gmail.com", 550000.00),
(13, 5, "Andrés Ramírez", "andres.ramirez@gmail.com", 620000.00),
(14, 2, "Luis Castro", "luis.castro@gmail.com", 310000.00),
(15, 3, "Esteban Morales", "esteban.morales@gmail.com", 290000.00),
(16, 6, "Paula Herrera", "paula.herrera@gmail.com", 780000.00),
(17, 7, "Jorge Ortiz", "jorge.ortiz@gmail.com", 365000.00),
(18, 8, "Valeria Díaz", "valeria.diaz@gmail.com", 275000.00),
(19, 9, "Felipe Vega", "felipe.vega@gmail.com", 255000.00),
(20, 10, "Carmen Ríos", "carmen.rios@gmail.com", 920000.00),
(21, 1, "Ricardo Navarro", "ricardo.navarro@gmail.com", 240000.00),
(22, 4, "Manuel Peña", "manuel.pena@gmail.com", 565000.00),
(23, 5, "Álvaro Castro", "alvaro.castro@gmail.com", 635000.00),
(24, 6, "Carolina Márquez", "carolina.marquez@gmail.com", 765000.00),
(25, 7, "Daniel Suárez", "daniel.suarez@gmail.com", 370000.00),
(26, 8, "Natalia Gutiérrez", "natalia.gutierrez@gmail.com", 280000.00),
(27, 9, "Sebastián Vallejo", "sebastian.vallejo@gmail.com", 260000.00),
(28, 10, "Elena Muñoz", "elena.munoz@gmail.com", 930000.00),
(29, 1, "Luis Mendoza", "luis.mendoza@gmail.com", 225000.00),
(30, 2, "Gabriel León", "gabriel.leon@gmail.com", 305000.00),
(31, 3, "Lucía Vargas", "lucia.vargas@gmail.com", 285000.00),
(32, 4, "Diego Rojas", "diego.rojas@gmail.com", 560000.00),
(33, 5, "Isabel Cárdenas", "isabel.cardenas@gmail.com", 615000.00),
(34, 6, "Andrea Navarro", "andrea.navarro@gmail.com", 775000.00),
(35, 7, "Fernando Ortega", "fernando.ortega@gmail.com", 355000.00),
(36, 8, "Luisa Morales", "luisa.morales@gmail.com", 290000.00),
(37, 9, "Tomás Durán", "tomas.duran@gmail.com", 265000.00),
(38, 10, "Monica Álvarez", "monica.alvarez@gmail.com", 940000.00),
(39, 1, "Francisco Prieto", "francisco.prieto@gmail.com", 235000.00),
(40, 2, "Julio Pérez", "julio.perez@gmail.com", 315000.00),
(41, 3, "Pablo Reyes", "pablo.reyes@gmail.com", 295000.00),
(42, 4, "Martín Silva", "martin.silva@gmail.com", 570000.00),
(43, 5, "Manuela Correa", "manuela.correa@gmail.com", 625000.00),
(44, 6, "Camila Gómez", "camila.gomez@gmail.com", 785000.00),
(45, 7, "Marcos Espinoza", "marcos.espinoza@gmail.com", 360000.00),
(46, 8, "Ángela Castaño", "angela.castano@gmail.com", 295000.00),
(47, 9, "David Mendoza", "david.mendoza@gmail.com", 270000.00),
(48, 10, "Inés Velásquez", "ines.velasquez@gmail.com", 950000.00),
(49, 1, "Rosa Castellanos", "rosa.castellanos@gmail.com", 245000.00),
(50, 2, "Nicolás Bustos", "nicolas.bustos@gmail.com", 320000.00);

-- | ID | Id_tipo | Nombre | Correo | Salario |


INSERT INTO procesos(id_proceso,nombre)VALUES
(1,"Fumigar"),
(2,"Lavar"),
(3, "Recoger"),
(4, "Sembrar"),
(5, "Contar"),
(6, "Cuidar ganado"),
(7, "Transportar productos"),
(8, "Mantener maquinaria"),
(9, "Alimentar animales"),
(10, "Clasificar productos"),
(11, "Supervisar trabajadores"),
(12, "Inspección veterinaria"),
(13, "Vender productos"),
(14, "Empacar productos"),
(15, "Matar"),
(16, "Arar"),
(17, "Macanear"),
(18, "Excavar"),
(19, "Triturar"),
(20, "Regar"),
(21, 'Ordeñar'),
(22, 'Esquilar'),
(23, 'Recolectar huevos');
-- | ID | nombre | fecha |


INSERT INTO maquinas(id_maquina,nombre,modelo)VALUES
(1,"Retroescabadora","R2006"),
(2,"Macaneadora","5000"),
(3,"Pajarita","s500"),
(4, "Tractor", "T800"),
(5, "Cosechadora", "C3000"),
(6, "Arado", "A500"),
(7, "Sembradora", "S700"),
(8, "Rastrillo", "R450"),
(9, "Fumigadora", "F550"),
(10, "Trituradora", "T1000"),
(11, "Sistema de riego", "SR2024"),
(12, "Turbo", "SD200"),
(13, "Dron", "SR400");
-- | ID | nombre | modelo |

INSERT INTO procesos_empleado(id_proceso_empleado, id_proceso, id_empleado, fecha) VALUES
(1, 1, 2, "2024-03-12"),   -- Fumigar en Limonal
(2, 3, 4, "2024-04-14"),   -- Recoger en Limonal
(3, 4, 3, "2024-01-13"),   -- Sembrar en Limonal
(4, 7, 7, "2024-06-10"),   -- Transportar productos en Limonal
(5, 1, 2, "2024-06-15"),   -- Fumigar en Mangar
(6, 3, 4, "2024-07-20"),   -- Recoger en Mangar
(7, 4, 8, "2024-08-25"),   -- Sembrar en Mangar
(8, 7, 5, "2024-08-30"),   -- Transportar productos en Mangar
(9, 2, 1, "2024-09-01"),   -- Lavar en Corral
(10, 6, 6, "2024-09-05"),  -- Cuidar ganado en Corral
(11, 12, 12, "2024-09-10"), -- Inspección veterinaria en Corral
(12, 3, 4, "2024-09-15"),  -- Recoger en Corral
(13, 7, 11, "2024-09-20"),  -- Transportar productos en Corral
(14, 1, 1, "2024-09-25"),  -- Fumigar en Tomatal
(15, 3, 5, "2024-10-01"),  -- Recoger en Tomatal
(16, 4, 3, "2024-10-05"),  -- Sembrar en Tomatal
(17, 7, 7, "2024-10-10"),  -- Transportar productos en Tomatal
(18, 1, 2, "2024-10-15"),  -- Fumigar en Fresal
(19, 3, 5, "2024-10-20"),  -- Recoger en Fresal
(20, 4, 3, "2024-10-25"),  -- Sembrar en Fresal
(21, 7, 7, "2024-10-30"),  -- Transportar productos en Fresal
(22, 2, 9, "2024-11-01"),  -- Lavar en Gallinero
(23, 6, 6, "2024-11-05"),  -- Cuidar ganado en Gallinero
(24, 12, 10, "2024-11-10"), -- Inspección veterinaria en Gallinero
(25, 3, 1, "2024-11-15"),  -- Recoger en Gallinero
(26, 7, 4, "2024-11-20"),  -- Transportar productos en Gallinero
(27, 2, 8, "2024-11-25"),  -- Lavar en Ovejal
(28, 6, 12, "2024-11-30"), -- Cuidar ganado en Ovejal
(29, 12, 3, "2024-12-01"), -- Inspección veterinaria en Ovejal
(30, 3, 5, "2024-12-05"),  -- Recoger en Ovejal
(31, 7, 4, "2024-12-10"),  -- Transportar productos en Ovejal
(32, 2, 1, "2024-12-15"),  -- Lavar en Finca
(33, 2, 4, "2024-12-25"),  -- Lavar en Pocilga
(34, 6, 6, "2024-12-30"),  -- Cuidar ganado en Pocilga
(35, 12, 12, "2024-12-31"), -- Inspección veterinaria en Pocílga
(36, 3, 4, "2025-01-05"),  -- Recoger en Pocilga
(37, 7, 8, "2025-01-10"),  -- Transportar productos en Pocilga
(38, 1, 5, "2025-01-15"),  -- Fumigar en Cebollera
(39, 3, 4, "2025-01-20"),  -- Recoger en Cebollera
(40, 4, 8, "2025-01-25"),  -- Sembrar en Cebollera
(41, 7, 6, "2025-01-30"),  -- Transportar productos en Cebollera
(42, 1, 5, "2025-02-05"),  -- Fumigar en Cafetal
(43, 3, 6, "2025-02-10"),  -- Recoger en Cafetal
(44, 4, 8, "2025-02-15"),  -- Sembrar en Cafetal
(45, 7, 7, "2025-02-20"),  -- Transportar productos en Cafetal
(46, 1, 1, "2025-02-25"),  -- Fumigar en Piñal
(47, 3, 4, "2025-03-01"),  -- Recoger en Piñal
(48, 4, 8, "2025-03-05"),  -- Sembrar en Piñal
(49, 7, 5, "2025-03-10"),  -- Transportar productos en Piñal
(50, 1, 5, "2025-03-15"),  -- Fumigar en Naranjo
(51, 3, 6, "2025-03-20"),  -- Recoger en Naranjo
(52, 4, 8, "2025-03-25"),  -- Sembrar en Naranjo
(53, 7, 9, "2025-03-30"),  -- Transportar productos en Naranjo
(54, 1, 10, "2025-04-05"), -- Fumigar en Maracuyal
(55, 3, 10, "2025-04-10"), -- Recoger en Maracuyal
(56, 4, 1, "2025-04-15"),  -- Sembrar en Maracuyal
(57, 7, 6, "2025-04-20"),  -- Transportar productos en Maracuyal
(58, 1, 2, "2025-04-25"),  -- Fumigar en Mandarinal
(59, 3, 3, "2025-04-30"),  -- Recoger en Mandarinal
(60, 4, 2, "2025-05-05"),  -- Sembrar en Mandarinal
(61, 7, 1, "2025-05-10"),  -- Transportar productos en Mandarinal
(62, 1, 2, "2025-05-15"),  -- Fumigar en Zanahorial
(63, 3, 1, "2025-05-20"),  -- Recoger en Zanahorial
(64, 4, 2, "2025-05-25"),  -- Sembrar en Zanahorial
(65, 7, 5, "2025-05-30"),  -- Transportar productos en Zanahorial
(66, 1, 10, "2025-06-05"), -- Fumigar en Pimental
(67, 3, 6, "2025-06-10"),  -- Recoger en Pimental
(68, 4, 2, "2025-06-12"),  -- Sembrar en Pimental
(69, 7, 3, "2025-06-15"),  -- Transportar productos en Pimental
(70, 2, 18, "2025-06-20"), -- Lavar en Establo
(71, 6, 18, "2025-06-25"), -- Cuidar ganado en Establo
(72, 2, 19, "2025-07-10"), -- Lavar en Matadero
(73, 15, 19, "2025-07-15"), -- Matar ganado en Matadero
(74, 3, 19, "2025-07-20"), -- Recoger en Matadero
(75, 7, 18, "2025-07-25"), -- Transportar productos en Matadero
(76, 1, 17, "2025-07-30"), -- Fumigar en Cultivo 1
(77, 3, 16, "2025-08-01"), -- Recoger en Cultivo 1
(78, 4, 17, "2025-08-05"), -- Sembrar en Cultivo 1
(79, 7, 15, "2025-08-10"), -- Transportar productos en Cultivo 1
(80, 1, 13, "2025-08-15"), -- Fumigar en Cultivo 2
(81, 3, 12, "2025-08-20"), -- Recoger en Cultivo 2
(82, 4, 13, "2025-08-25"), -- Sembrar en Cultivo 2
(83, 7, 15, "2025-08-30"), -- Transportar productos en Cultivo 2
(84, 1, 14, "2025-09-01"), -- Fumigar en Cultivo 3
(85, 3, 15, "2025-09-05"), -- Recoger en Cultivo 3
(86, 4, 16, "2025-09-10"), -- Sembrar en Cultivo 3
(87, 7, 19, "2025-09-15"), -- Transportar productos en Cultivo 3
(88, 1, 20, "2025-09-20"), -- Fumigar en Cultivo 4
(89, 3, 19, "2025-09-25"), -- Recoger en Cultivo 4
(90, 4, 21, "2025-09-30"), -- Sembrar en Cultivo 4
(91, 7, 22, "2025-10-01"), -- Transportar productos en Cultivo 4
(92, 1, 24, "2025-10-05"), -- Fumigar en Cultivo 5
(93, 3, 22, "2025-10-10"), -- Recoger en Cultivo 5
(94, 4, 23, "2025-10-15"), -- Sembrar en Cultivo 5
(95, 7, 24, "2025-10-20"), -- Transportar productos en Cultivo 5
(96, 1, 26, "2025-10-25"), -- Fumigar en Cultivo 6
(97, 3, 27, "2025-10-30"), -- Recoger en Cultivo 6
(98, 4, 25, "2025-11-05"), -- Sembrar en Cultivo 6
(99, 7, 26, "2025-11-10"), -- Transportar productos en Cultivo 6
(100, 1, 29, "2025-11-15"), -- Fumigar en Cultivo 7
(101, 3, 28, "2025-11-20"), -- Recoger en Cultivo 7
(102, 4, 29, "2025-11-25"), -- Sembrar en Cultivo 7
(103, 7, 30, "2025-12-01"); -- Transportar productos en Cultivo 7


-- | ID | id_proceso | Id_empleado | Fecha1


INSERT INTO procesos_maquina(id_proceso_maquina, id_proceso, id_maquina, id_empleado, fecha) VALUES
(1, 16, 1, 1, '2024-10-22'),
(2, 17, 2, 2, '2024-10-22'),
(3, 18, 3, 3, '2024-10-22'),
(4, 7, 4, 4, '2024-10-22'),
(5, 3, 5, 5, '2024-10-22'),
(6, 16, 6, 6, '2024-10-22'),
(7, 4, 7, 7, '2024-10-22'),
(8, 3, 8, 8, '2024-10-22'),
(9, 1, 9, 9, '2024-10-22'),
(10, 19, 10, 10, '2024-10-22'),
(11, 20, 11, 11, '2024-10-22'),
(12, 7, 12, 12, '2024-10-22'),
(13, 1, 13, 13, '2024-10-22');
-- | ID | Id_proceso | Id_maquina |

INSERT INTO tipos_zona(id_tipo_zona,nombre) VALUES
(1,"Zona de cultivo"),
(2,"Zona de animales"),
(3,"Hogar");

-- | ID | Nombres |

INSERT INTO zonas(id_zona, id_tipo_zona, nombre) VALUES
(1, 1, "Limonal"),        
(2, 1, "Mangar"),         
(3, 2, "Corral"),         
(4, 1, "Tomatal"),        
(5, 1, "Fresal"),         
(6, 2, "Gallinero"),      
(7, 2, "Ovejal"),         
(8, 2, "Finca"),          
(9, 2, "Pocilga"),        
(10, 1, "Cebollera"),     
(11, 1, "Cafetal"),
(12, 1, "Piñal"),
(13, 1, "Naranjo"),
(14, 1, "Maracuyal"),
(15, 1, "Mandarinal"),
(16, 1, "Zanahorial"),
(17, 1, "Pimental"),
(18, 2, "Establo"),
(19, 2, "Matadero");

-- | ID | Id_tipo_zona | Nombre |

INSERT INTO procesos_zona(id_proceso_zona, id_proceso, id_zona, fecha) VALUES
(1, 1, 1, "2024-03-12"),  -- Fumigar en Limonal
(2, 3, 1, "2024-04-14"),  -- Recoger en Limonal
(3, 4, 1, "2024-01-13"),  -- Sembrar en Limonal
(4, 7, 1, "2024-06-10"),  -- Transportar productos en Limonal
(5, 1, 2, "2024-06-15"),  -- Fumigar en Mangar
(6, 3, 2, "2024-07-20"),  -- Recoger en Mangar
(7, 4, 2, "2024-08-25"),  -- Sembrar en Mangar
(8, 7, 2, "2024-08-30"),  -- Transportar productos en Mangar
(9, 2, 3, "2024-09-01"),  -- Lavar en Corral
(10, 6, 3, "2024-09-05"),  -- Cuidar ganado en Corral
(11, 12, 3, "2024-09-10"), -- Inspección veterinaria en Corral
(12, 3, 3, "2024-09-15"),  -- Recoger en Corral
(13, 7, 3, "2024-09-20"),  -- Transportar productos en Corral
(14, 1, 4, "2024-09-25"),  -- Fumigar en Tomatal
(15, 3, 4, "2024-10-01"),  -- Recoger en Tomatal
(16, 4, 4, "2024-10-05"),  -- Sembrar en Tomatal
(17, 7, 4, "2024-10-10"),  -- Transportar productos en Tomatal
(18, 1, 5, "2024-10-15"),  -- Fumigar en Fresal
(19, 3, 5, "2024-10-20"),  -- Recoger en Fresal
(20, 4, 5, "2024-10-25"),  -- Sembrar en Fresal
(21, 7, 5, "2024-10-30"),  -- Transportar productos en Fresal
(22, 2, 6, "2024-11-01"),  -- Lavar en Gallinero
(23, 6, 6, "2024-11-05"),  -- Cuidar ganado en Gallinero
(24, 12, 6, "2024-11-10"), -- Inspección veterinaria en Gallinero
(25, 3, 6, "2024-11-15"),  -- Recoger en Gallinero
(26, 7, 6, "2024-11-20"),  -- Transportar productos en Gallinero
(27, 2, 7, "2024-11-25"),  -- Lavar en Ovejal
(28, 6, 7, "2024-11-30"),  -- Cuidar ganado en Ovejal
(29, 12, 7, "2024-12-01"), -- Inspección veteromaroa en Ovejal
(30, 3, 7, "2024-12-05"),  -- Recoger en Ovejal
(31, 7, 7, "2024-12-10"),  -- Transportar productos en Ovejal
(32, 2, 8, "2024-12-15"),  -- Lavar en Finca
(33, 2, 9, "2024-12-25"),  -- Lavar en Pocilga
(34, 6, 9, "2024-12-30"),  -- Cuidar ganado en Pocilga
(35, 12, 9, "2024-12-31"), -- Inspección veteromaroa en Pocílga
(75, 3, 9, "2025-01-05"),  -- Recoger en Pocilga
(36, 7, 9, "2025-01-10"),  -- Transportar productos en Pocilga
(37, 1, 10, "2025-01-15"), -- Fumigar en Cebollera
(38, 3, 10, "2025-01-20"), -- Recoger en Cebollera
(39, 4, 10, "2025-01-25"), -- Sembrar en Cebollera
(40, 7, 10, "2025-01-30"),  -- Transportar productos en Cebollera
(41, 1, 11, "2025-02-05"), -- Fumigar en Cafetal
(42, 3, 11, "2025-02-10"), -- Recoger en Cafetal
(43, 4, 11, "2025-02-15"), -- Sembrar en Cafetal
(44, 7, 11, "2025-02-20"),  -- Transportar productos en Cafetal
(45, 1, 12, "2025-02-25"), -- Fumigar en Piñal
(46, 3, 12, "2025-03-01"), -- Recoger en Piñal
(47, 4, 12, "2025-03-05"), -- Sembrar en Piñal
(48, 7, 12, "2025-03-10"),  -- Transportar productos en Piñal
(49, 1, 13, "2025-03-15"), -- Fumigar en Naranjo
(50, 3, 13, "2025-03-20"), -- Recoger en Naranjo
(51, 4, 13, "2025-03-25"), -- Sembrar en Naranjo
(52, 7, 13, "2025-03-30"),  -- Transportar productos en Naranjo
(53, 1, 14, "2025-04-05"), -- Fumigar en Maracuyal
(54, 3, 14, "2025-04-10"), -- Recoger en Maracuyal
(55, 4, 14, "2025-04-15"), -- Sembrar en Maracuyal
(56, 7, 14, "2025-04-20"),  -- Transportar productos en Maracuyal
(57, 1, 15, "2025-04-25"), -- Fumigar en Mandarinal
(58, 3, 15, "2025-04-30"), -- Recoger en Mandarinal
(59, 4, 15, "2025-05-05"), -- Sembrar en Mandarinal
(60, 7, 15, "2025-05-10"),  -- Transportar productos en Mandarinal
(61, 1, 16, "2025-05-15"), -- Fumigar en Zanahorial
(62, 3, 16, "2025-05-20"), -- Recoger en Zanahorial
(63, 4, 16, "2025-05-25"), -- Sembrar en Zanahorial
(64, 7, 16, "2025-05-30"),  -- Transportar productos en Zanahorial
(65, 1, 17, "2025-06-05"), -- Fumigar en Pimental
(66, 3, 17, "2025-06-10"), -- Recoger en Pimental
(67, 4, 17, "2025-06-12"), -- Sembrar en Pimental
(68, 7, 17, "2025-06-15"),  -- Transportar productos en Pimental
(69, 2, 18, "2025-06-20"), -- Lavar en Establo
(70, 6, 18, "2025-06-25"), -- Cuidar ganado en Establo
(71, 2, 19, "2025-07-10"), -- Lavar en Matadero
(72, 15, 19, "2025-07-15"), -- Matar ganado en Matadero
(73, 3, 19, "2025-07-20"), -- Recoger en Matadero
(74, 7, 19, "2025-07-25");  -- Transportar productos en Matadero

-- | ID | Id_proceso | id_zona |

INSERT INTO cultivos(id_cultivo,id_zona,nombre) VALUES
(1,1,"Cultivo de Limon"),
(2,2,"Cultivo de Mango"),
(3,5,"Cultivo de Fresas"),
(4,12,"Cultivo de Piña"),
(5,13,"Cultivo de Naranja"),
(6,14,"Cultivo de Maracuyá"),
(7,15,"Cultivo de Mandarina"),
(8,16,"Cultivo de Zanahoria"),
(9,4,"Cultivo de Tomate"),
(10,17,"Cultivo de Pimenton"),
(11,10,"Cultivo de Cebolla"),
(12,11,"Cultivo de Café");

-- | ID | id_zona | nombre |

INSERT INTO procesos_cultivo(id_proceso_cultivo, id_proceso, id_cultivo, fecha) VALUES
(1, 1, 1, '2024-10-22'),  -- Fumigar en el Cultivo de Limón
(2, 3, 1, '2024-10-22'),  -- Recoger en el Cultivo de Limón
(3, 4, 1, '2024-10-22'),  -- Sembrar en el Cultivo de Limón
(4, 10, 1, '2024-10-22'), -- Clasificar productos en el Cultivo de Limón
(5, 1, 2, '2024-10-22'),  -- Fumigar en el Cultivo de Mango
(6, 3, 2, '2024-10-22'),  -- Recoger en el Cultivo de Mango
(7, 4, 2, '2024-10-22'),  -- Sembrar en el Cultivo de Mango
(8, 10, 2, '2024-10-22'), -- Clasificar productos en el Cultivo de Mango
(9, 1, 3, '2024-10-22'),  -- Fumigar en el Cultivo de Fresas
(10, 2, 3, '2024-10-22'), -- Lavar en el Cultivo de Fresas
(11, 3, 3, '2024-10-22'), -- Recoger en el Cultivo de Fresas
(12, 10, 3, '2024-10-22'), -- Clasificar productos en el Cultivo de Fresas
(13, 1, 4, '2024-10-22'),  -- Fumigar en el Cultivo de Piña
(14, 3, 4, '2024-10-22'),  -- Recoger en el Cultivo de Piña
(15, 4, 4, '2024-10-22'),  -- Sembrar en el Cultivo de Piña
(16, 10, 4, '2024-10-22'), -- Clasificar productos en el Cultivo de Piña
(17, 1, 5, '2024-10-22'),  -- Fumigar en el Cultivo de Naranja
(18, 3, 5, '2024-10-22'),  -- Recoger en el Cultivo de Naranja
(19, 4, 5, '2024-10-22'),  -- Sembrar en el Cultivo de Naranja
(20, 10, 5, '2024-10-22'), -- Clasificar productos en el Cultivo de Naranja
(21, 1, 6, '2024-10-22'),  -- Fumigar en el Cultivo de Maracuyá
(22, 3, 6, '2024-10-22'),  -- Recoger en el Cultivo de Maracuyá
(23, 4, 6, '2024-10-22'),  -- Sembrar en el Cultivo de Maracuyá
(24, 10, 6, '2024-10-22'), -- Clasificar productos en el Cultivo de Maracuyá
(25, 1, 7, '2024-10-22'),  -- Fumigar en el Cultivo de Mandarina
(26, 3, 7, '2024-10-22'),  -- Recoger en el Cultivo de Mandarina
(27, 4, 7, '2024-10-22'),  -- Sembrar en el Cultivo de Mandarina
(28, 10, 7, '2024-10-22'), -- Clasificar productos en el Cultivo de Mandarina
(29, 1, 8, '2024-10-22'),  -- Fumigar en el Cultivo de Zanahoria
(30, 4, 8, '2024-10-22'),  -- Sembrar en el Cultivo de Zanahoria
(31, 10, 8, '2024-10-22'), -- Clasificar productos en el Cultivo de Zanahoria
(32, 1, 9, '2024-10-22'),  -- Fumigar en el Cultivo de Tomate
(33, 2, 9, '2024-10-22'),  -- Lavar en el Cultivo de Tomate
(34, 3, 9, '2024-10-22'),  -- Recoger en el Cultivo de Tomate
(35, 10, 9, '2024-10-22'), -- Clasificar productos en el Cultivo de Tomate
(36, 1, 10, '2024-10-22'), -- Fumigar en el Cultivo de Pimentón
(37, 3, 10, '2024-10-22'), -- Recoger en el Cultivo de Pimentón
(38, 4, 10, '2024-10-22'), -- Sembrar en el Cultivo de Pimentón
(39, 10, 10, '2024-10-22'), -- Clasificar productos en el Cultivo de Pimentón
(40, 1, 11, '2024-10-22'), -- Fumigar en el Cultivo de Cebolla 
(41, 3, 11, '2024-10-22'), -- Recoger en el Cultivo de Cebolla
(42, 4, 11, '2024-10-22'), -- Sembrar en el Cultivo de Cebolla
(43, 10, 11, '2024-10-22'), -- Clasificar productos en el Cultivo de Cebolla
(44, 1, 12, '2024-10-22'), -- Fumigar en el Cultivo de Café
(45, 3, 12, '2024-10-22'), -- Recoger en el Cultivo de Café
(46, 4, 12, '2024-10-22'), -- Sembrar en el Cultivo de Café
(47, 10, 12, '2024-10-22'); -- Clasificar productos en el Cultivo de Café


-- | ID | id_proceso | id_cultivo |
 
INSERT INTO animales(id_animal, id_zona, nombre) VALUES
(1, 3, "Vacas"),
(2, 3, "Cabra"),
(3, 6, "Gallina"),
(4, 7, "Oveja"),
(5, 18, "Caballo"),
(6, 8, "Perro"),
(7, 8, "Gato"),
(8, 9, "Cerdo");

-- | ID | id_zona | nombre |

INSERT INTO procesos_animales(id_proceso_animal, id_animal, id_proceso, fecha) VALUES
-- Vacas
(1, 1, 6, '2024-10-22'),  -- Cuidar ganado
(2, 1, 9, '2024-10-22'),  -- Alimentar animales
(3, 1, 12, '2024-10-22'), -- Inspección veterinaria
(4, 1, 21, '2024-10-22'), -- Ordeñar
(5, 1, 15, '2024-10-22'), -- Matar
(6, 1, 7, '2024-10-22'), -- Transladar productos
-- Cabra
(7, 2, 6, '2024-10-22'),  -- Cuidar ganado
(8, 2, 9, '2024-10-22'),  -- Alimentar animales
(9, 2, 12, '2024-10-22'), -- Inspección veterinaria
(10, 2, 21, '2024-10-22'), -- Ordeñar
(11, 2, 15, '2024-10-22'), -- Matar
(12, 2, 7, '2024-10-22'), -- Transladar productos
-- Gallina
(13, 3, 6, '2024-10-22'), -- Cuidar ganado
(14, 3, 9, '2024-10-22'), -- Alimentar animales
(15, 3, 12, '2024-10-22'), -- Inspección veterinaria
(16, 3, 3, '2024-10-22'), -- Recolectar huevos
(17, 3, 15, '2024-10-22'), -- Matar
(18, 3, 7, '2024-10-22'), -- Transladar productos
-- Oveja
(19, 4, 6, '2024-10-22'), -- Cuidar ganado
(20, 4, 9, '2024-10-22'), -- Alimentar animales
(21, 4, 12, '2024-10-22'), -- Inspección veterinaria
(22, 4, 15, '2024-10-22'), -- Matar
(23, 4, 23, '2024-10-22'), -- Esquilar
(24, 4, 7, '2024-10-22'), -- Transladar productos
-- Caballo
(25, 5, 6, '2024-10-22'),  -- Cuidar ganado
(26, 5, 9, '2024-10-22'),  -- Alimentar animales
(27, 5, 12, '2024-10-22'), -- Inspección veterinaria
-- Cerdo
(28, 8, 6, '2024-10-22'),  -- Cuidar ganado
(29, 8, 9, '2024-10-22'),  -- Alimentar animales
(30, 8, 12, '2024-10-22'), -- Inspección veterinaria
(31, 8, 15, '2024-10-22'), -- Matar
(32, 8, 7, '2024-10-22'); -- Transladar productos
-- | ID | id_animal | id_proceso | fecha |
