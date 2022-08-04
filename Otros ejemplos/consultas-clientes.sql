-- @block Seleccionar todo
SELECT 
    *
FROM clientes;

-- @block Telefono de los clientes que son 
-- "Responsable de Ventas" o "Comercial"
SELECT
    telefono
FROM
    clientes
WHERE
    cargo = 'Responsable de Ventas' OR
    cargo = 'Comercial';

-- @block Clientes que pertenecen a la empresa syer
-- y no han sido contactados desde el 1 de junio de 2019
SELECT 
    *
FROM
    clientes
WHERE
    empresa = 'syer' AND
    ultima_vez_contactado < '2019-3-1';

-- @block Clientes de las provincias Madrid o Barcelona
SELECT 
    *
FROM
    clientes
WHERE
    provincia = 'Madrid' OR
    provincia = 'Barcelona';

-- @block Teléfono del cliente con nombre
-- empezansdo por C y dirección que contiene 
-- Rosas
SELECT
    telefono
FROM
    clientes
WHERE
    nombre LIKE 'C%' AND
    direccion LIKE '%Rosas%';

-- @block Clientes con nombre o apellido empezando
-- por la letra L
SELECT
    *
FROM
    clientes
WHERE
    nombre LIKE 'L%' OR
    primer_apellido LIKE 'L%' OR
    segundo_apellido LIKE 'L%';

-- @block Clientes con nombre o apellido empezando
-- por la letra L y que han pedido menos de 500,00€
SELECT
    *
FROM
    clientes
WHERE
    (nombre LIKE 'L%' OR
    primer_apellido LIKE 'L%' OR
    segundo_apellido LIKE 'L%') AND
    importe_total_de_pedidos < 500.00;

-- @block Obtener los primeros 5 clientes (ordenados por nombre)
SELECT
    *
FROM
    clientes
ORDER BY nombre
LIMIT 5
OFFSET 0;

-- @block Todas las empresas
SELECT DISTINCT empresa FROM clientes;

-- @block Todas las provincias con clientes que se han gastado
-- mas de 5000.00
SELECT DISTINCT
    provincia 
FROM 
    clientes
WHERE
    importe_total_de_pedidos > 5000;

-- @block 10 personas con mayor importe de pedidos
SELECT 
    *
FROM
    clientes
ORDER BY importe_total_de_pedidos DESC
LIMIT 10;

-- @block 10 personas con mayor importe de pedidos
SELECT 
    concat(
        nombre, ' ', primer_apellido, ' ', segundo_apellido
    ),
    importe_total_de_pedidos
FROM
    clientes
ORDER BY importe_total_de_pedidos DESC
LIMIT 10;

-- @block numero de clientes en cada provincia
SELECT
    provincia, 
    COUNT(*)
FROM
    clientes
GROUP BY provincia;

-- @block media de gasto por provincias
SELECT
    provincia,
    COUNT(*),
    AVG(importe_total_de_pedidos)
FROM
    clientes
GROUP BY provincia;

-- @block
Select 
    provincia AS "Las Provincias que hay", 
    sum(importe_total_de_pedidos) AS "Pedidos Totales", 
    CAST(avg(importe_total_de_pedidos) AS NUMERIC(8,2)) AS "Media de pedidos" 
from 
    clientes
group by provincia;

-- @block
SELECT
    concat(nombre, ' ', primer_apellido, ' ', segundo_apellido) AS "Nombre Completo",
    importe_total_de_pedidos / pedidos AS "Media de importe de pedidos"
FROM
    clientes;

-- @block
SELECT
    AGE('2015-1-1', fecha_de_nacimiento) AS "Edad"
FROM
    clientes;

-- @block
SELECT
    current_date - ultima_vez_contactado,
    nombre,
    correo_electronico
FROM
    clientes
ORDER BY ultima_vez_contactado
LIMIT 100;

-- @block comisiones
SELECT
    *,
    ROUND(importe_total_de_pedidos * 0.1, 2) AS "Comisión"
FROM
    clientes;

-- @block comisiones totales madrid
SELECT
    provincia,
    SUM(ROUND(importe_total_de_pedidos * 0.1, 2)) AS "Comisión Total"
FROM
    clientes
WHERE provincia = 'Madrid'
GROUP BY provincia;

-- @block Total de ventas a serize en Baleares
SELECT
    SUM(importe_total_de_pedidos)
FROM
    clientes
WHERE
    provincia = 'Baleares' AND
    empresa = 'forize';

-- @block
SELECT sum(importe_total_de_pedidos) from clientes;

-- @block Numero de pedidos desde Canarias
SELECT
    sum(pedidos)
FROM
    clientes
WHERE
    provincia = 'Santa Cruz de Tenerife' OR
    provincia = 'Las Palmas';

-- @block Media de pedidos realizados por provincia
SELECT
    provincia AS "Provincia", 
    ROUND(AVG(pedidos), 2) AS "Media de pedidos"
FROM
    clientes
GROUP BY provincia
ORDER BY provincia DESC;

-- @block Primera página
SELECT * FROM clientes LIMIT 10 OFFSET 0;

-- @block Segunda página
SELECT * FROM clientes LIMIT 10 OFFSET 10;

-- @block Tercera página
SELECT * FROM clientes LIMIT 10 OFFSET 20;

-- @block Clientes que viven en un Ático
SELECT * FROM clientes
WHERE direccion LIKE '%Ático%';

-- Consultas Destructivas --

-- @block Borrar clientes con N/A en provincia
DELETE FROM clientes
WHERE provincia = '#N/A';

-- @block Cambiar la fecha de último contacto a hoy
-- para todos los clientes de la empresa laudism

UPDATE clientes
SET ultima_vez_contactado = current_date
WHERE empresa = 'laudism';

-- @block Nuevo pedido de una persona
UPDATE clientes
SET 
    pedidos = pedidos + 1, 
    importe_total_de_pedidos = importe_total_de_pedidos + 100
WHERE 
    correo_electronico = 'pmenas@susise.com';

-- @block Ver resultado
SELECT correo_electronico, pedidos, importe_total_de_pedidos
FROM clientes
WHERE correo_electronico = 'pmenas@susise.com';

-- @block Borrar los clientes de Soria (por lo del meteorito)
DELETE FROM clientes WHERE provincia = 'Soria';

-- @block Ascender a Carlos
UPDATE clientes
SET cargo ='Director Comercial'
WHERE
    nombre = 'Carlos' AND
    primer_apellido = 'Rodrigo' AND
    segundo_apellido = 'Falcón';

-- @block Actualizar los datos de Angélica
UPDATE clientes
SET
    empresa = 'malend',
    cargo = 'Responsable de Ventas',
    direccion = 'Calle Falsa, 123',
    provincia = 'Santa Cruz de Tenerife',
    ciudad = 'Santa Cruz de Tenerife',
    ultima_vez_contactado = '2020-10-01'
WHERE
    nombre = 'Angélica';

-- @block Actualizar empresa duxo
UPDATE clientes
SET
    cargo = 'Empleado',
    ultima_vez_contactado = current_date
WHERE empresa = 'duxo';