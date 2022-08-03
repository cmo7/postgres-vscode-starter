-- @block Crear Tabla cuentas
CREATE TABLE cuentas (
    nombre TEXT,
    saldo TEXT
);

-- @block Insertar datos inicales
INSERT INTO cuentas (
    nombre, saldo
)
VALUES
    ('Andrés', '140€'),
    ('Blanca', '321€'),
    ('Carlos', '246€'),
    ('Diana', '500€');

-- @block Ver datos
SELECT * FROM cuentas;

-- @block El saldo debería ser NUMERIC(9,2)

ALTER TABLE cuentas
ALTER COLUMN saldo TYPE NUMERIC(9,2);

-- @block Cambiar nombre a VARCHAR(20)
ALTER TABLE cuentas
ALTER COLUMN nombre TYPE VARCHAR(20);

-- @block Añadir columna Apellido VARCHAR(10)
ALTER TABLE cuentas
ADD COLUMN apellido VARCHAR(10);

-- @block nombre y saldo no deberían ser nulos
ALTER TABLE cuentas
ALTER COLUMN nombre SET NOT NULL;

ALTER TABLE cuentas
ALTER COLUMN saldo SET NOT NULL;

-- @block Añadir los DNIs
ALTER TABLE cuentas
ADD COLUMN dni CHAR(9);

UPDATE cuentas
SET dni = CASE nombre
    WHEN 'Andrés' THEN '35264900N'
    WHEN 'Blanca' THEN '21424292E'
    WHEN 'Carlos' THEN '69541154X'
    WHEN 'Diana' THEN '34493683P'
    END;

ALTER TABLE cuentas
ALTER COLUMN dni SET NOT NULL;

-- @block Añadir los apellidos

ALTER TABLE cuentas
ALTER COLUMN apellido TYPE VARCHAR(40);

UPDATE cuentas
SET apellido = CASE nombre
    WHEN 'Andrés' THEN 'Jerez Saenz'
    WHEN 'Blanca' THEN 'Sampedro Huertas'
    WHEN 'Carlos' THEN 'Peralta Manzanares'
    WHEN 'Diana' THEN 'Palomino de Castro'
    END;