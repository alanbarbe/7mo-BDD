CREATE DATABASE aeropuerto;
USE aeropuerto;

CREATE TABLE Companias (
    IdCompania INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE Aviones (
    IdAvion INT AUTO_INCREMENT PRIMARY KEY,
    IdCompania INT,
    tipo_avion VARCHAR(100) NOT NULL,
    FOREIGN KEY (IdCompania) REFERENCES Companias(IdCompania)
);

CREATE TABLE Ciudades (
    IdCiudad INT AUTO_INCREMENT PRIMARY KEY,
    ciudad VARCHAR(100) NOT NULL,
    pais VARCHAR(100) NOT NULL
);

CREATE TABLE Aeropuertos (
    IdAeropuerto INT AUTO_INCREMENT PRIMARY KEY,
    IdCiudad INT,
    FOREIGN KEY (IdCiudad) REFERENCES Ciudades(IdCiudad)
);

CREATE TABLE Vuelos (
    IdVuelo INT AUTO_INCREMENT PRIMARY KEY,
    IdAvion INT,
    IdAeropuerto INT,
    tipo_vuelo VARCHAR(50) NOT NULL,
    fecha_vuelo DATE,
    FOREIGN KEY (IdAvion) REFERENCES Aviones(IdAvion),
    FOREIGN KEY (IdAeropuerto) REFERENCES Aeropuertos(IdAeropuerto)
);

CREATE TABLE Vuelos_salidas (
    IdVuelo INT,
    IdAvion INT,
    IdAeropuerto INT,
    fecha_vuelo DATE,
    hora_salida TIME,
    ciudad_destino INT,
    puerta_embarque VARCHAR(10),
    PRIMARY KEY (IdVuelo),
    FOREIGN KEY (IdVuelo) REFERENCES Vuelos(IdVuelo),
    FOREIGN KEY (IdAvion) REFERENCES Aviones(IdAvion),
    FOREIGN KEY (IdAeropuerto) REFERENCES Aeropuertos(IdAeropuerto),
    FOREIGN KEY (ciudad_destino) REFERENCES Ciudades(IdCiudad)
);

CREATE TABLE Vuelos_llegadas (
    IdVuelo INT,
    IdAvion INT,
    IdAeropuerto INT,
    fecha_vuelo DATE,
    hora_aterrizaje TIME,
    ciudad_origen INT,
    puerta_llegada VARCHAR(10),
    PRIMARY KEY (IdVuelo),
    FOREIGN KEY (IdVuelo) REFERENCES Vuelos(IdVuelo),
    FOREIGN KEY (IdAvion) REFERENCES Aviones(IdAvion),
    FOREIGN KEY (IdAeropuerto) REFERENCES Aeropuertos(IdAeropuerto),
    FOREIGN KEY (ciudad_origen) REFERENCES Ciudades(IdCiudad)
);

CREATE TABLE Pasajeros (
    IdPasajero INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    fecha_nac DATE,
    telefono VARCHAR(15),
    direccion VARCHAR(255),
    correo VARCHAR(100),
    numero_asiento VARCHAR(10),
    IdVuelo INT,
    FOREIGN KEY (IdVuelo) REFERENCES Vuelos(IdVuelo)
);
