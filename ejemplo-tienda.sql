-- Borrar la tabla si existe --
DROP TABLE IF EXISTS productos;

-- Crear la tabla de productos --
-- -- Debería tener al menos:
-- -- Nombre
-- -- Precio
CREATE TABLE productos (
    nombre VARCHAR(30),
    precio DECIMAL(6,2)
);

-- Añadir varios artículos a la tienda --
INSERT INTO productos VALUES
('Peras', 3.13),
('Galletas', 104.12),
('Agua', 3.15);