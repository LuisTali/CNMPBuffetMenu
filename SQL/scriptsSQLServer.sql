CREATE DATABASE CNMPBuffet;
USE CNMPBuffet;

CREATE TABLE Platos(
	idPlato int IDENTITY(1,1) CONSTRAINT pkPlato PRIMARY KEY,
	nombre varchar(50) NOT NULL,
	descripcion varchar(200),
	precio float,
	platoDia bit NULL DEFAULT 0 
	--Permite valor nulo y su valor por default es 0, ya que el plato del dia se escoge luego.
);

CREATE TABLE Usuarios(
	idUser int IDENTITY(1,1) CONSTRAINT pkUsuarios PRIMARY KEY,
	userName varchar(50) UNIQUE NOT NULL,
	nombre varchar(50) NOT NULL,
	apellido varchar(50) NOT NULL,
	[password] varchar(50) CONSTRAINT ckUsuarios1 CHECK ([password] LIKE '[a-z,0-9][a-z,0-9][a-z,0-9][a-z,0-9][a-z,0-9][a-z,0-9][a-z,0-9][a-z,0-9]%')
	--password LIKE 8 caracteres o mas, permitiendo letras de la A a la Z y numeros de 0 a 9
);