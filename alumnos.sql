-- @block Borrar la tabla si existe
DROP TABLE IF EXISTS alumnos;

-- @block Crear la tabla
CREATE TABLE alumnos(
    id SERIAL NOT NULL PRIMARY KEY,
    nombre VARCHAR(15) NOT NULL,
    matematicas INTEGER NOT NULL, CHECK(matematicas >= 0), CHECK (matematicas <= 10),
    lengua INTEGER NOT NULL, CHECK(lengua >= 0), CHECK (lengua <= 10),
    fisica INTEGER NOT NULL, CHECK(fisica >= 0), CHECK (fisica <= 10)
);
-- @block Insertar Datos
INSERT INTO alumnos(nombre, matematicas, lengua, fisica)
VALUES ('Alicia', 7, 2, 5),
    ('Bernardo', 8, 9, 6),
    ('Carmen', 8, 3, 6),
    ('Dario', 5, 5, 9),
    ('Esther', 3, 7, 9),
    ('Fernando', 4, 8, 10),
    ('Gloria', 1, 4, 6);

-- @block Comprobación
SELECT * FROM alumnos ORDER BY id;

-- @block Recuperar matemáticas para Gloria
-- Ojo, lo estamos haciendo borrando su registro
DELETE FROM alumnos WHERE nombre = 'Gloria';

INSERT INTO alumnos (
    nombre, 
    matematicas, 
    lengua, 
    fisica) 
VALUES (
    'Gloria',
    8, 
    4, 
    6
);

--@block  Recuperar matemáticas con UPDATE
UPDATE 
    alumnos 
SET 
    matematicas = 8
WHERE
    nombre = 'Gloria';

-- @block Borrar a los que suspendieron mates
DELETE FROM alumnos
WHERE matematicas < 5;

-- @block Poner un 10 en fisica a los que tengan
-- aprovadas las matematicas

UPDATE alumnos
SET fisica = 10
WHERE matematicas >= 5; 

-- @block Aprovado general en lengua

UPDATE alumnos
SET lengua = 5
WHERE lengua < 5;

-- @block Añadir columna Educación Física
ALTER TABLE alumnos
ADD COLUMN educacion_fisica INTEGER;

-- @block Insertar notas de Educación Física
UPDATE alumnos
SET educacion_fisica = CASE nombre
    WHEN 'Alicia' THEN 8
    WHEN 'Bernardo' THEN 7
    WHEN 'Carmen' THEN 9
    WHEN 'Dario' THEN 3
    WHEN 'Esther' THEN 7
    WHEN 'Fernando' THEN 5
    WHEN 'Gloria' THEN 7
    END;

-- @block Restricción No Nulo en columna nueva
ALTER TABLE alumnos
ALTER COLUMN educacion_fisica SET NOT NULL;

-- @block Borrar la columna lengua
ALTER TABLE alumnos
DROP COLUMN lengua;

-- @block Cambiar Nombre
ALTER TABLE alumnos
RENAME TO notas_alumnos;

-- @block Cambiar nombre a una columna
ALTER TABLE notas_alumnos
RENAME COLUMN matematicas TO notas_matematicas;

-- @block Cambiar tipo a matematicas
ALTER TABLE notas_alumnos
ALTER COLUMN notas_matematicas TYPE NUMERIC(3,1);