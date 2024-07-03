CREATE DATABASE vivero;
USE vivero;

CREATE TABLE Empleados (
    dni_empleado INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    telefono VARCHAR(15)
);

CREATE TABLE Viveros (
    IdVivero INT AUTO_INCREMENT PRIMARY KEY,
    nombre_vivero VARCHAR(100) NOT NULL
);

CREATE TABLE Zonas (
    IdZona INT AUTO_INCREMENT PRIMARY KEY,
    IdVivero INT,
    nombre_zona VARCHAR(100) NOT NULL,
    FOREIGN KEY (IdVivero) REFERENCES Viveros(IdVivero)
);

CREATE TABLE ClientesVips (
    dni_clienteVip INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(255),
    telefono VARCHAR(15),
    fecha_incorporacion DATE
);

CREATE TABLE Asig_vivero (
    dni_empleado INT,
    IdVivero INT,
    fecha_inicio DATE,
    fecha_fin DATE,
    PRIMARY KEY (dni_empleado, IdVivero),
    FOREIGN KEY (dni_empleado) REFERENCES Empleados(dni_empleado),
    FOREIGN KEY (IdVivero) REFERENCES Viveros(IdVivero)
);

CREATE TABLE Asig_zona (
    dni_empleado INT,
    IdZona INT,
    fecha_inicio DATE,
    fecha_fin DATE,
    PRIMARY KEY (dni_empleado, IdZona),
    FOREIGN KEY (dni_empleado) REFERENCES Empleados(dni_empleado),
    FOREIGN KEY (IdZona) REFERENCES Zonas(IdZona)
);

CREATE TABLE Responsables (
    dni_empleado INT,
    IdVivero INT,
    fecha_inicio DATE,
    fecha_fin DATE,
    PRIMARY KEY (dni_empleado, IdVivero),
    FOREIGN KEY (dni_empleado) REFERENCES Empleados(dni_empleado),
    FOREIGN KEY (IdVivero) REFERENCES Viveros(IdVivero)
);

CREATE TABLE Productos (
    Codigo INT AUTO_INCREMENT PRIMARY KEY,
    nombre_prod VARCHAR(100) NOT NULL,
    precio_prod DECIMAL(10, 2),
    tipo_prod VARCHAR(100)
);

CREATE TABLE Plantas (
    codigo_producto INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    cuidados VARCHAR(255),
    FOREIGN KEY (codigo_producto) REFERENCES Productos(Codigo)
);

CREATE TABLE Pedidos (
    IdPedido INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE,
    descuento DECIMAL(5, 2),
    precio_portes DECIMAL(10, 2),
    dni_empleado INT,
    dni_cliente INT,
    IdVivero INT,
    FOREIGN KEY (dni_empleado) REFERENCES Empleados(dni_empleado),
    FOREIGN KEY (dni_cliente) REFERENCES ClientesVips(dni_clienteVip),
    FOREIGN KEY (IdVivero) REFERENCES Viveros(IdVivero)
);

CREATE TABLE DetallePedidos (
    numero_pedido INT,
    codigo_producto INT,
    unidades INT,
    PRIMARY KEY (numero_pedido, codigo_producto),
    FOREIGN KEY (numero_pedido) REFERENCES Pedidos(IdPedido),
    FOREIGN KEY (codigo_producto) REFERENCES Productos(Codigo)
);

CREATE TABLE Stocks (
    codigo_producto INT,
    IdZona INT,
    cantidad INT,
    PRIMARY KEY (codigo_producto, IdZona),
    FOREIGN KEY (codigo_producto) REFERENCES Productos(Codigo),
    FOREIGN KEY (IdZona) REFERENCES Zonas(IdZona)
);
