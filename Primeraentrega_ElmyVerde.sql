-- opcion CREATE DATABASE
CREATE SCHEMA galeria;

USE galeria;


CREATE TABLE artista (
	id_artista INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(50),
    apellido VARCHAR(50) NOT NULL,
    banco VARCHAR(50) NOT NULL,
    cuenta_clabe VARCHAR (12) UNIQUE NOT NULL,
    rfc VARCHAR (8) NOT NULL
);

CREATE TABLE cliente (
	id_cliente INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(50),
    apellido VARCHAR(50) NOT NULL,
    celular INT,
    email VARCHAR(50),
    calle VARCHAR(20),
    numero VARCHAR(10),
    cruzamiento VARCHAR(20),
    ciudad VARCHAR(20),
    estado VARCHAR(20),
    cp INT
);

CREATE TABLE galeria (
	rfc VARCHAR(8) PRIMARY KEY NOT NULL,
    sucursal VARCHAR(20) NOT NULL,
    calle VARCHAR(20),
    numero VARCHAR(10),
    cruzamiento VARCHAR(20),
    ciudad VARCHAR(20),
    estado VARCHAR(20),
    cp INT,
    marca_comercial VARCHAR(20),
    nombre_titular VARCHAR(50),
    apellido_titular VARCHAR(50),
    banco VARCHAR(20) NOT NULL,
    cuenta_clabe VARCHAR(12) NOT NULL UNIQUE
);

CREATE TABLE inv_obra (
	id_obra INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(50),
    id_artista INT,
    rfc VARCHAR(8),
    FOREIGN KEY (id_artista) REFERENCES artista(id_artista),
    FOREIGN KEY (rfc) REFERENCES galeria(rfc)
);

CREATE TABLE compra (
	id_compra INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    id_artista INT,
    id_obra INT,
    precio FLOAT,
    estado_pago TINYINT(1),
    sucursal VARCHAR(20),
    fecha_compra DATE,
	FOREIGN KEY (id_artista) REFERENCES artista(id_artista),
    FOREIGN KEY (id_obra) REFERENCES inv_obra(id_obra)
);

CREATE TABLE venta (
	id_venta INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    id_obra INT,
    id_cliente INT,
    precio FLOAT NOT NULL,
    estado_pago TINYINT(1),
    sucursal VARCHAR(20),
    fecha_venta DATE,
    FOREIGN KEY (id_obra) REFERENCES inv_obra(id_obra),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);