CREATE TABLE Salas (
    IdSala INT PRIMARY KEY,
    metros_cuadrados DECIMAL(10,2),
    ubicacion VARCHAR(100),
    tipo_sala VARCHAR(50)
);

CREATE TABLE Monitores (
    DNI VARCHAR(20) PRIMARY KEY,
    nombre_monitor VARCHAR(100),
    telefono_monitor VARCHAR(20),
    titulacion_monitor VARCHAR(100),
    experienciaProfesional VARCHAR(200)
);

CREATE TABLE Aparatos (
    IdAparato INT PRIMARY KEY,
    descripcion VARCHAR(200),
    estado_conservacion VARCHAR(50),
    IdSala INT,
    FOREIGN KEY (IdSala) REFERENCES Salas(IdSala)
);

CREATE TABLE Clases (
    IdClase INT PRIMARY KEY,
    descripcion VARCHAR(200),
    dia_hora DATETIME,
    IdSala INT,
    DNI_Monitor VARCHAR(20),
    FOREIGN KEY (IdSala) REFERENCES Salas(IdSala),
    FOREIGN KEY (DNI_Monitor) REFERENCES Monitores(DNI)
);

CREATE TABLE Socios (
    IdSocio INT PRIMARY KEY,
    nombre_socio VARCHAR(100),
    direccion_socio VARCHAR(200),
    telefono_socio VARCHAR(20),
    profesion_socio VARCHAR(100),
    datosbancarios_socio VARCHAR(200)
);

CREATE TABLE Pistas_Squash (
    IdPista INT PRIMARY KEY,
    ubicacion_squash VARCHAR(100),
    estado_squash VARCHAR(50)
);

CREATE TABLE Reservas_Squash (
    IdSocio INT,
    IdPista INT,
    fecha_reserva DATE,
    hora_reserva TIME,
    PRIMARY KEY (IdSocio, IdPista),
    FOREIGN KEY (IdSocio) REFERENCES Socios(IdSocio),
    FOREIGN KEY (IdPista) REFERENCES Pistas_Squash(IdPista)
);

CREATE TABLE Socios_Clases (
    IdSocio INT,
    IdClase INT,
    PRIMARY KEY (IdSocio, IdClase),
    FOREIGN KEY (IdSocio) REFERENCES Socios(IdSocio),
    FOREIGN KEY (IdClase) REFERENCES Clases(IdClase)
);
