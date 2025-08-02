-- 1. Tabla: Unidad
CREATE TABLE Unidad (
    UnidadID INT PRIMARY KEY AUTO_INCREMENT,
    Troncal VARCHAR(50),
    IdentificadorVisual VARCHAR(100),
    CapacidadMaxima INT DEFAULT 80
);

-- 2. Tabla: Puerta
CREATE TABLE Puerta (
    PuertaID INT PRIMARY KEY AUTO_INCREMENT,
    NombrePuerta VARCHAR(10),
    UnidadID INT,
    FOREIGN KEY (UnidadID) REFERENCES Unidad(UnidadID)
);

-- 3. Tabla: Camara
CREATE TABLE Camara (
    CamaraID INT PRIMARY KEY AUTO_INCREMENT,
    Tipo VARCHAR(20), -- 'entrada' o 'salida'
    ModeloCamara VARCHAR(50),
    PuertaID INT,
    FOREIGN KEY (PuertaID) REFERENCES Puerta(PuertaID)
);

-- 4. Tabla: Deteccion
CREATE TABLE Deteccion (
    DeteccionID INT PRIMARY KEY AUTO_INCREMENT,
    CamaraID INT,
    FechaHora DATETIME,
    Sentido VARCHAR(10), -- 'entrada' o 'salida'
    PersonaDetectada BOOLEAN,
    ModeloIA VARCHAR(50), -- por ejemplo: 'YOLOv8'
    FOREIGN KEY (CamaraID) REFERENCES Camara(CamaraID)
);

-- 5. Tabla: Registro_Ocupacion
CREATE TABLE Registro_Ocupacion (
    RegistroID INT PRIMARY KEY AUTO_INCREMENT,
    UnidadID INT,
    FechaHora DATETIME,
    OcupacionActual INT,
    FOREIGN KEY (UnidadID) REFERENCES Unidad(UnidadID)
);

-- 6. Tabla: Alerta
CREATE TABLE Alerta (
    AlertaID INT PRIMARY KEY AUTO_INCREMENT,
    UnidadID INT,
    FechaHora DATETIME,
    Tipo VARCHAR(100), -- Ejemplo: 'Ocupación máxima alcanzada'
    Nivel VARCHAR(20), -- Ejemplo: 'Crítico', 'Advertencia'
    Resuelta BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (UnidadID) REFERENCES Unidad(UnidadID)
);