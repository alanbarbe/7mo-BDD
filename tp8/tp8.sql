CREATE DATABASE farmacia;
USE farmacia;

CREATE TABLE Familias (
    IdFamilia INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255)
);

CREATE TABLE TipoMedicamentos (
    IdTipo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE Laboratorios (
    codigo_lab INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(15),
    direccion VARCHAR(255),
    persona_contacto VARCHAR(100)
);

CREATE TABLE Medicamentos (
    codigo_med INT AUTO_INCREMENT PRIMARY KEY,
    codigo_lab INT,
    IdTipo INT,
    IdFamilia INT,
    nombre VARCHAR(100) NOT NULL,
    unidades_stock INT,
    unidades_vendidas INT,
    precio DECIMAL(10, 2),
    receta_requerida BOOLEAN,
    FOREIGN KEY (codigo_lab) REFERENCES Laboratorios(codigo_lab),
    FOREIGN KEY (IdTipo) REFERENCES TipoMedicamentos(IdTipo),
    FOREIGN KEY (IdFamilia) REFERENCES Familias(IdFamilia)
);

CREATE TABLE Clientes (
    IdCliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    direccion VARCHAR(255),
    credito DECIMAL(10, 2)
);

CREATE TABLE Compras (
    IdCompras INT AUTO_INCREMENT PRIMARY KEY,
    fecha_compra DATE,
    unidades INT,
    codigo_med INT,
    IdCliente INT,
    FOREIGN KEY (codigo_med) REFERENCES Medicamentos(codigo_med),
    FOREIGN KEY (IdCliente) REFERENCES Clientes(IdCliente)
);

CREATE TABLE Tipo_Pagos (
    IdPago INT AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(100) NOT NULL
);

CREATE TABLE Cliente_creditos (
    IdCliente INT,
    datos_banc VARCHAR(100),
    fecha_pago DATE,
    IdPago INT,
    PRIMARY KEY (IdCliente),
    FOREIGN KEY (IdCliente) REFERENCES Clientes(IdCliente),
    FOREIGN KEY (IdPago) REFERENCES Tipo_Pagos(IdPago)
);
