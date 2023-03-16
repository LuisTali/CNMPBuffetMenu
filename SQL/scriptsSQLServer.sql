CREATE DATABASE CNMPBuffet;
USE CNMPBuffet;

CREATE TABLE Plato(
	idPlato int IDENTITY(1,1) CONSTRAINT pkPlato PRIMARY KEY,
	nombre varchar(50) NOT NULL CONSTRAINT uqPlato UNIQUE,
	descripcion varchar(200),
	precio float null DEFAULT 0.00,
	platoDia bit null DEFAULT 0 
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

ALTER TABLE Plato ADD idCategoria int NOT NULL CONSTRAINT fkPlato1 FOREIGN KEY REFERENCES Categoria(idCategoria);

INSERT INTO Categoria VALUES ('Entradas'),('Sandwich'),('Pescados y Mariscos'),('Pastas'),('Carnes Rojas'),('Carnes Blancas'),
('Guarnicion'),('Ensaladas'),('Arroces'),('Postres');

INSERT INTO Plato VALUES ('Mondongo a la espanola','Mondongo con morron, cebolla, chorizo y pimienta.',1500.00,default,5),
('Carne a la cacerola','Carne a la cacerola con pure o papas a la espanola',1400.00,default,5),
('Tarta Tricolor','Porcion individual de tarta con verdura, calabaza y muzzarella',800.00,default,1),
('Merluza al roquefort','Merluza al roquefort con queso gratinado, acompanada de pure',2300.00,default,3),
('Pollo con salsa de champignones','Pollo con salsa de champignones y papas a la espanola',1300.00,1,6),
('Rabas','Aros de calamar fritos, porcion para 2, una delicia',1500.00,default,3)

SELECT p.nombre, p.precio, c.nombreCat FROM Plato AS p INNER JOIN Categoria AS c ON p.idCategoria = c.idCategoria ORDER BY p.nombre DESC;
