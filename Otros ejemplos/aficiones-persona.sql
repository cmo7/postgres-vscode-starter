-- @block Crear tablas y relaciones
DROP TABLE IF EXISTS aficion_persona;
DROP TABLE IF EXISTS personas;
DROP TABLE IF EXISTS aficiones;

CREATE TABLE personas (
    id_persona SERIAL NOT NULL PRIMARY KEY,
    nombre VARCHAR(30)
);

CREATE TABLE aficiones (
    id_aficion SERIAL NOT NULL PRIMARY KEY,
    nombre VARCHAR(30)
);

CREATE TABLE aficion_persona (
    id_aficion INTEGER,
    id_persona INTEGER,
    CONSTRAINT aficion_persona_aficion_fk
        FOREIGN KEY (id_aficion)
        REFERENCES aficiones(id_aficion),
    CONSTRAINT aficion_persona_persona_fk
        FOREIGN KEY (id_persona)
        REFERENCES personas(id_persona)
)

-- @block Añadir los datos

INSERT INTO aficiones (nombre)
values
    ('Padel'),
    ('Senderismo'),
    ('Pintar'),
    ('Ajedrez'),
    ('Música'),
    ('Series'),
    ('Escalada');

-- @block Añadir personas
INSERT INTO personas (nombre)
VALUES
    ('Alicia'),
    ('Bernardo'),
    ('Carmen'),
    ('Dario'),
    ('Elisa');

-- @block insertar pares afición - persona
INSERT INTO aficion_persona (id_persona, id_aficion)
VALUES
    (1,1),
    (1,3),
    (1,4),
    (2,2),
    (2,4),
    (3,1),
    (3,2),
    (4,3),
    (5,7)

-- @block mal
INSERT INTO aficion_persona (id_persona, id_aficion)
VALUES
    (1,9);

-- @block Consulta

SELECT 
    *
FROM personas INNER JOIN aficion_persona
ON personas.id_persona = aficion_persona.id_persona
INNER JOIN aficiones
ON aficion_persona.id_aficion = aficiones.id_aficion
ORDER BY aficiones.nombre;