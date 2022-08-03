-- @block Crear tablas
DROP TABLE IF EXISTS empleados;
DROP TABLE IF EXISTS empresas;

CREATE TABLE empresas (
    id_empresa SERIAL NOT NULL PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL,
    sede VARCHAR(40) NOT NULL,
    sector VARCHAR(40) NOT NULL
);


CREATE TABLE empleados (
    id_empleado SERIAL NOT NULL PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL,
    apellido VARCHAR(40) NOT NULL,
    id_empresa INTEGER NOT NULL,
    CONSTRAINT empleado_empresa_fk 
        FOREIGN KEY (id_empresa) 
        REFERENCES empresas(id_empresa)
);

-- @block añadir los datos
INSERT INTO empresas (nombre, sede, sector)
VALUES
    ('City Network', 'S/C Tenerife', 'Diseño de interiores'),
    ('KFT Innovación', 'S/C Tenerife', 'Publicidad'),
    ('Praxis Consulting', 'Las Palmas', 'Contabilidad y Finanzas'),
    ('Robody', 'S/C Tenerife', 'Publicidad');

INSERT INTO empleados (nombre, apellido, id_empresa)
VALUES 
    ('Roque', 'Salcedo', 1),
    ('Maria Estrella', 'Sabater', 1),
    ('Eider', 'Serrano', 2),
    ('Rufina', 'Bilbao', 3),
    ('Regina', 'Puente', 4);

-- @block
SELECT * fROM empleados;

-- @block join
SELECT 
    empleados.nombre,
    empleados.apellido,
    empresas.nombre AS "Empresa"
FROM 
    empleados INNER JOIN empresas 
ON
    empleados.id_empresa = empresas.id_empresa;