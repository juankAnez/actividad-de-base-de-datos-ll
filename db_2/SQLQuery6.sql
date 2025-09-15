
CREATE TABLE Categoria (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nombre NVARCHAR(100) NOT NULL UNIQUE,
    descripcion NVARCHAR(MAX)
);
CREATE TABLE Proveedor (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nombre NVARCHAR(100) NOT NULL,
    contacto NVARCHAR(100),
    telefono NVARCHAR(20),
    direccion NVARCHAR(MAX)
);


CREATE TABLE Producto (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nombre NVARCHAR(200) NOT NULL,
    descripcion NVARCHAR(MAX),
    precio DECIMAL(10,2) CHECK (precio >= 0),
    categoria_id INT FOREIGN KEY REFERENCES Categoria(id)
);

CREATE TABLE Sucursal (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nombre NVARCHAR(100) NOT NULL,
    direccion NVARCHAR(MAX),
    telefono NVARCHAR(20)
);
CREATE TABLE Almacen (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nombre NVARCHAR(100) NOT NULL,
    sucursal_id INT FOREIGN KEY REFERENCES Sucursal(id)
);

CREATE TABLE Ubicacion (
    id INT IDENTITY(1,1) PRIMARY KEY,
    pasillo NVARCHAR(10),
    estante NVARCHAR(10),
    nivel NVARCHAR(10),
    almacen_id INT FOREIGN KEY REFERENCES Almacen(id)
);

CREATE TABLE Lote (
    id INT IDENTITY(1,1) PRIMARY KEY,
    numero_lote NVARCHAR(50) NOT NULL,
    fecha_ingreso DATE,
    fecha_vencimiento DATE
);
CREATE TABLE StockSucursal (
    id INT IDENTITY(1,1) PRIMARY KEY,
    producto_id INT FOREIGN KEY REFERENCES Producto(id),
    sucursal_id INT FOREIGN KEY REFERENCES Sucursal(id),
    cantidad INT DEFAULT 0 CHECK (cantidad >= 0),
    ubicacion_id INT FOREIGN KEY REFERENCES Ubicacion(id),
    lote_id INT FOREIGN KEY REFERENCES Lote(id)
);
CREATE TABLE MovimientoInventario (
    id INT IDENTITY(1,1) PRIMARY KEY,
    tipo_movimiento NVARCHAR(20) CHECK (tipo_movimiento IN ('ENTRADA', 'SALIDA', 'AJUSTE')),
    cantidad INT NOT NULL,
    fecha_movimiento DATETIME DEFAULT GETDATE(),
    producto_id INT FOREIGN KEY REFERENCES Producto(id),
    sucursal_id INT FOREIGN KEY REFERENCES Sucursal(id),
    usuario_id INT
);

CREATE TABLE Garantia (
    id INT IDENTITY(1,1) PRIMARY KEY,
    producto_id INT UNIQUE FOREIGN KEY REFERENCES Producto(id),
    tiempo_garantia INT,
    condiciones NVARCHAR(MAX)
);

CREATE TABLE Producto_Proveedor (
    producto_id INT FOREIGN KEY REFERENCES Producto(id),
    proveedor_id INT FOREIGN KEY REFERENCES Proveedor(id),
    PRIMARY KEY (producto_id, proveedor_id)
);







