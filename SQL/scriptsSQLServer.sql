CREATE DATABASE CNMPBuffet;
USE CNMPBuffet;

CREATE TABLE Plato(
	idPlato int IDENTITY(1,1) CONSTRAINT pkPlato PRIMARY KEY,
	nombre varchar(50) NOT NULL CONSTRAINT uqPlato UNIQUE,
	descripcion varchar(200),
	precio float null DEFAULT 0.00,
	platoDia bit null DEFAULT 0,
	idCategoria int NOT NULL CONSTRAINT fkPlato1 FOREIGN KEY REFERENCES Categoria(idCategoria)
	--Permite valor nulo y su valor por default es 0, ya que el plato del dia se escoge luego.
);
CREATE TABLE Usuario(
	idUser int IDENTITY(1,1) CONSTRAINT pkUsuarios PRIMARY KEY,
	nombre varchar(50) NOT NULL,
	apellido varchar(50) NOT NULL,
	isAdmin bit NOT NULL default 0,
	[password] varchar(50) CONSTRAINT ckUsuarios1 CHECK ([password] LIKE '[a-z,0-9][a-z,0-9][a-z,0-9][a-z,0-9][a-z,0-9][a-z,0-9][a-z,0-9][a-z,0-9]%')
	--password LIKE 8 caracteres o mas, permitiendo letras de la A a la Z y numeros de 0 a 9
);

CREATE TABLE Categoria(
	idCategoria int IDENTITY(1,1) CONSTRAINT pkCategoria PRIMARY KEY,
	nombreCat varchar(30) NOT NULL CONSTRAINT uqCategoria1 UNIQUE
);

INSERT INTO Categoria VALUES ('Entradas'),('Sandwich'),('Pescados y Mariscos'),('Pastas'),('Carnes Rojas'),('Carnes Blancas'),('Guarnicion'),('Ensaladas'),('Arroces'),('Postres'),('Cafeteria'),
('Bebidas'),('Cervezas'),('Menu infantil');


SELECT p.nombre, p.precio, c.nombreCat FROM Plato AS p INNER JOIN Categoria AS c ON p.idCategoria = c.idCategoria ORDER BY c.nombreCat ASC,p.nombre ASC;


INSERT INTO Plato VALUES ('Mondongo a la espanola','Mondongo con morron, cebolla, chorizo y pimienta.',1500.00,default,5),
('Carne a la cacerola','Carne a la cacerola con pure o papas a la espanola',1400.00,default,5),
('Tarta Tricolor','Porcion individual de tarta con verdura, calabaza y muzzarella',800.00,default,1),
('Merluza al roquefort','Merluza al roquefort con queso gratinado, acompanada de pure',2300.00,default,3),
('Pollo con salsa de champignones','Pollo con salsa de champignones y papas a la espanola',1300.00,1,6),
('Rabas','Aros de calamar fritos, porcion para 2, una delicia',1500.00,default,3) 

INSERT INTO Plato VALUES ('Bife de chorizo (solo)','Bife de chorizo sin acompa�amiento al plato',1800,default,5),('Bife de chorizo con guarnici�n','Bife de chorizo con guarnicion a eleccion',2100,default,5)
,('1/2 Bife de chorizo (solo)','Medio bife de chorizo sin acompa�amiento al plato',1500,default,5),('1/2 Bife de chorizo','Medio bife de chorizo con guarnicion a eleccion',1800,default,5),
('Milanesa de ternera (sola)','Milanesa de ternera sin acompa�amiento al plato',800,default,5),('Milanesa de ternera con guarnicion','Milanesa de ternera con guarnici�n a eleccion',1000,default,5),
('Milanesa de ternera a la suiza','Milanesa de ternera con perejil, cebolla, muzzarella y crema de leche sin guarnicion',1200,default,5),
('Milanesa a la napolitana con guarnicion','Milanesa napolitana con guarnicion a elecci�n',1300,default,5),
('Milanesa de ternera a la suiza con guarnici�n','Milanesa de ternera con perejil, cebolla, muzzarella y crema de leche con guarnicion a eleccion',1300,default,5),
('Mini bife (solo)','Mini bife sin acompa�amiento al plato',1000,default,5),('Mini bife completo sandwich','Mini bife al sandwich con lechuga, tomate y huevo acompa�ado con papas fritas',1500,default,5),
('Sandwich de milanesa comleto','Sandwich de milanesa con lechuga, tomate y huevo acompa�ado con papas fritas',1200,default,5);

INSERT INTO Plato VALUES ('Jamon cocido','Jamon cocido en fetas',500,default,1),('Jamon crudo','Jamon crudo en fetas',700,default,1),('Matambre casero','Matambre enrrollado casero',700,default,1),
('Ensalada rusa','Ensalada de papa, huevo y mayonesa',500,default,1),('Jamon cocido con ensalada rusa','Jamon cocido en fetas con ensalada rusa',600,default,1),
('Jamon crudo con ensalada rusa','Jamon crudo en fetas con ensalada rusa',900,default,1),('Matambre casero con ensalada rusa','Matambre enrrollado casero con ensalada rusa',900,default,1),
('Salpicon de ave','Pollo, huevo, zanahoria, tomate, papa y mayonesa',700,default,1),
('Mayonesa de atun','Atun, mayonesa, papa, cebolla, aceitunas, huevo duro, mayonesa y mostaza',900,default,1),
('Mayonesa de pollo','Pollo, mayonesa, papa, cebolla, aceitunas, huevo duro, mayonesa y mostaza',700,default,1),('Empanadas','J/Q, Pollo, Carne, Verdura, Capprese, Humita',200,default,1),
('Tartas','Verdura, Tricolor, J/Q y tomate',600,default,1),('Muzzarella a la milanesa','Barras de muzzarella empanadas fritas',800,default,1);

INSERT INTO Plato VALUES ('Jamon cocido y queso','Sandwich de jamon cocido y queso',600,default,2),('Salame y queso','Sandwich de salame y queso',600,default,2),
('Jamon crudo y queso','Sandwich de jamon crudo y queso',700,default,2),('Primavera de jamon cocido','Sandwich de jamon cocido, queso, tomate, huevo duro y lechuga',800,default,2),
('1/2 Primavera de jamon cocido','Medio sandwich de jamon cocido, queso, tomate, huevo duro y lechuga',550,default,2),
('Primavera de jamon crudo','Sandwich de jamon crudo, queso, tomate, huevo duro y lechuga',900,default,2),('1/2 Primavera de jamon crudo','Medio sandwich de jamon crudo, queso, tomate, huevo duro y lechuga',600,default,2),
('Tostado de miga','Tostado de miga con jamon y queso',600,default,2),('Chips','Chips de J/Q o S/Q',250,default,2);

INSERT INTO Plato VALUES ('Rabas','Aros de calamar fritos',2200,default,3),('Merluza (sola)','Merluza (a la romana, plancha o milanesa) sin acompa�amiento al plato',900,default,3),
('Merluza con guarnicion','Merluza (a la romana, plancha o milanesa) con guarnicion a eleccion',1200,default,3),('Merluza al roquefort','Merluza al graten con roquefort y pure o papas espa�olas',1700,default,3),
('Merluza a la vazca','Merluza con huevo duro y esparragos',1500,default,3),('Merluza a la crema','Merluza con crema de leche y papas a la espa�ola',1700,default,3),
('Filet con guarnicion','Filet de pescado con guarnicion a eleccion',1200,default,3),('1/2 Filet con guarnicion','Medio filet de pescado con guarnicion a eleccion',900,default,3),
('Cazuela de mariscos','Cazuela con langostinos, calamar, camarones, mejillones y caldo de verdura',0.00,default,3),('Paella','Arroz con langostinos, calamar, mejillones y almejas',0.00,default,3);

INSERT INTO Plato VALUES ('Ravioles al Plato','con Tuco, Crema, Bolognesa, Mixtos o Pesto a eleccion',850,default,4),('Porcion de Ravioles','con Tuco, Crema, Bolognesa, Mixtos o Pesto a eleccion',1300,default,4),
('�oquis al Plato','con Tuco, Crema, Bolognesa, Mixtos o Pesto a eleccion',850,default,4),('Porcion de �oquis','con Tuco, Crema, Bolognesa, Mixtos o Pesto a eleccion',1300,default,4),
('Tallarines al Plato','con Tuco, Crema, Bolognesa, Mixtos o Pesto a eleccion',850,default,4),('Porcion de Tallarines','con Tuco, Crema, Bolognesa, Mixtos o Pesto a eleccion',1300,default,4),
('Canelones de Verdura','con Tuco, Crema, Bolognesa, Mixtos o Pesto a eleccion',1300,default,4),('Canelones de J/Q','con Tuco, Crema, Bolognesa, Mixtos o Pesto a eleccion',1300,default,4);

INSERT INTO Plato VALUES ('Milanesa de pollo (sola)','Milanesa de pollo sin acompa�amiento al plato',800,default,6),('Milanesa de pollo con guarnicion','Milanesa de pollo con guarnici�n a eleccion',1000,default,6),
('Milanesa de pollo a la suiza','Milanesa de ternera con perejil, cebolla, muzzarella y crema de leche sin guarnicion',900,default,6),
('Milanesa de pollo a la suiza con guarnici�n','Milanesa de ternera con perejil, cebolla, muzzarella y crema de leche con guarnicion a eleccion',1200,default,6),
('Suprema a la napolitana con guarnicion','Milanesa napolitana con guarnicion a elecci�n',1300,default,6),('Suprema a la fiorentina','Suprema con queso y espinaca sin guarnicion',1000,default,6),
('Suprema a la fiorentina con guranicion','Suprema con queso y espinaca con guarnicion a eleccion',1400,default,6),('Suprema a la maryland','Suprema con crema de choclo y guarnicion a eleccion',1400,default,6),
('1/4 Pollo grille (solo)','Un cuarto pollo al grille sin acompa�amiento al plato',700,default,6),('1/4 Pollo grille con guarnicion','Un cuarto pollo al grille con guarnicion a eleccion',900,default,6),
('1/4 Pollo al Ajillo, Portuguesa o Provenzal','Un cuarto pollo a eleccion con guarnicion',1200,default,6),('1/4 Pollo al Verdeo o Champignon','Un cuarto pollo al verdeo o champignon a eleccion con guarnicion',1200,default,6);

INSERT INTO Plato VALUES ('Papas fritas','',600,default,7),('Pure de papa','',600,default,7),('Pure de zapallo','',600,default,7),('Acelga salteada','Acelga salteada con cebolla',500,default,7),
('Acelga a la crema','Acelga salteada con cebolla y crema de leche',700,default,7),('Tortilla de papas','',700,default,7),('Tortilla de acelga','',700,default,7),
('Tortilla espa�ola','Tortilla de huevo, chorizo y cebolla',900,default,7),('Omelette de J/Q','',750,default,7),('Omelette de verdura','',750,default,7),
('Omelette 5 gustos','Morron, verdura, jamon, queso, huevo y cebolla',800,default,7),('Revuelto gramajo','Papas fritas, morron, cebolla, huevo y arvejas',950,default,7),('Huevo frito','Individual',200,default,7);

INSERT INTO Plato VALUES ('Lechuga','',450,default,8),('Tomate','',500,default,8),('Zanahoria','',500,default,8),('Radicheta y Ajo','',500,default,8),('Rucula y Parmesano','',550,default,8),
('Mixta','Ensalada 2 gustos',650,default,8),('Completa','Ensalada 3 o 4 gustos',700,default,8),
('Taliban de pollo','Pollo, nuez, queso, lechuga, tomate y aceitunas',900,default,8),('Taliban de Atun','Atun, nuez, queso, lechuga, tomate y aceitunas',1000,default,8);

INSERT INTO Plato VALUES ('Calla chilena al plato','',1000,default,9),('Calla chilena porcion','',1400,default,9), ('Arroz con pollo','',900,default,9), ('Arroz con mariscos','',0.00,default,9), 
('Arroz con calamares','',0.00,default,9);

INSERT INTO Plato VALUES ('Helado Dos Bochas','Vainilla, Crema Americana, Frutilla, Chocolate',500,default,10),('Helado Una Bocha','Vainilla, Crema Americana, Frutilla, Chocolate',350,default,10),
('Almendrado','',600,default,10),('Bombon','',600,default,10),('Queso y Dulce','',700,default,10),('Flan casero (solo)','',500,default,10),('Budin casero (solo)','',500,default,10),
('Ensala de frutas','',500,default,10),('Durazno o Anana en almibar','',0.00,default,10),('Panqueque de dulce de leche','',900,default,10),('Panqueque de manzana','',1100,default,10),
('Frutilla con crema','',0.00,default,10),('Adicional(Crema o Dulce de leche)','A eleccion',350,default,10);

INSERT INTO Plato VALUES ('Caf�','',280,default,11),('T�','',280,default,11),('Caf� doble','',350,default,11),('Caf� con leche','',300,default,11),('T� con leche','',300,default,11),('Caf� con crema','',300,default,11),
('Submarino','',500,default,11),('Capuchino','',600,default,11),('Chocolatada','',300,default,11),('Facturas','',120,default,11),('Alfajores Maicena','',250,default,11);

INSERT INTO Plato VALUES ('Linea Coca-Cola 500cc','',350,default,12),('Agua saborizada 500cc','',300,default,12),('Gaseosas o saborizadas 1,5Lt.','',700,default,12),('Agua C/S gas 500cc','',250,default,12),
('Agua 1,5Lt.','',450,default,12),('Exprimido','',500,default,12),('Licuado de banana','',600,default,12),('Licuados especiales','',800,default,12);

INSERT INTO Plato VALUES ('Isembeck 1Lt.','',700,default,13),('Isembeck lata','',450,default,13),('Heineken 1Lt.','',1000,default,13),('Heineken lata','',600,default,13),('Imperial Rubia 1Lt.','',800,default,13),
('Imperial Rubia lata','',500,default,13),('Imperial Roja 1Lt.','',900,default,13),('Imperial Roja lata','',550,default,13),('Imperial Negra 1Lt.','',900,default,13),('Imperial Negra lata','',550,default,13);

INSERT INTO Plato VALUES ('Milanesa con papas fritas','',700,default,14),('Hamburguesa con papas fritas','',700,default,14),('Super pancho con papas pay','',500,default,14);