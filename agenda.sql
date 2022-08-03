drop table if exists agenda;

CREATE TABLE agenda (
    nombre                  VARCHAR(30) NOT NULL,
    apellidos               VARCHAR(50),
    edad                    INTEGER CHECK (edad > 18),
    fecha_de_nacimiento     DATE,
    profesion               VARCHAR(90),
    aficiones               TEXT,
    email                   VARCHAR(50),
    telefono                VARCHAR(15) NOT NULL UNIQUE
);

INSERT INTO agenda (
    nombre,
    apellidos,
    edad,
    fecha_de_nacimiento,
    profesion,
    aficiones,
    email,
    telefono
) VALUES (
    'Alicia',
    'Pérez',
    17,
    '2004-6-14',
    'Estudiante',
    'Futbol, toros, votar',
    'ali33@jaja.com',
    '+34666666666'
);

INSERT into agenda (nombre, telefono) values ('Bernardo', '+34666666666')