-- Borra la tabla si existe --
DROP TABLE IF EXISTS lista_dulces;
-- Crea la tabla --
create table lista_dulces (
    nombre_dulce text,
    descripcion_dulce text,
    precio_dulce text,
    stock_dulce text,
    modificado TIMESTAMP,
    creado TIMESTAMP
);
-- Isertar datos en la tabla --
insert into lista_dulces (
        nombre_dulce,
        descripcion_dulce,
        precio_dulce
    )
VALUES (
        'Pachanga',
        'Dulce relleno de crema',
        '1,50€'
    ),
(
        'Donut',
        'Dulce con agujero',
        '1,25€ ')'
    ),
(
        'Berlina',
        'Hojaldre con relleno de crema',
        '2,00€'
    );
