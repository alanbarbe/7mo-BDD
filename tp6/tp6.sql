CREATE DATABASE club_nautico;
USE club_nautico;

CREATE TABLE Socios (
    IdSocio INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    telefono VARCHAR(15),
    direccion VARCHAR(255),
    correo VARCHAR(100)
);

CREATE TABLE Patrones (
    IdPatron INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    dni VARCHAR(20) NOT NULL,
    telefono VARCHAR(15),
    correo VARCHAR(100)
);

CREATE TABLE Destinos (
    IdDestino INT AUTO_INCREMENT PRIMARY KEY,
    lugar_destino VARCHAR(100) NOT NULL
);

CREATE TABLE Barcos (
    Matricula VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    numero_amarre INT,
    cuota_amarre DECIMAL(10, 2),
    IdSocio INT,
    FOREIGN KEY (IdSocio) REFERENCES Socios(IdSocio)
);

CREATE TABLE Salidas (
    IdSalida INT AUTO_INCREMENT PRIMARY KEY,
    fecha_salida DATE,
    hora_salida TIME,
    IdDestino INT,
    matricula_barco VARCHAR(20),
    IdPatron INT,
    FOREIGN KEY (IdDestino) REFERENCES Destinos(IdDestino),
    FOREIGN KEY (matricula_barco) REFERENCES Barcos(Matricula),
    FOREIGN KEY (IdPatron) REFERENCES Patrones(IdPatron)
);
