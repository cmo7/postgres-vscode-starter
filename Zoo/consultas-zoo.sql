--@block Queremos poder obtener de forma sencilla cuantas veces ha sido visitado cada animal.
SELECT
    animales.id_animal,
    animales.nombre,
    count(*) AS "Numero de visitas"
FROM 
    visitas_habitats 
    INNER JOIN animales 
    ON visitas_habitats.id_habitat = animales.id_habitat
GROUP BY animales.id_animal
ORDER BY "Numero de visitas" DESC;

--@block Queremos poder comprobar si un visitante ha visitado a un animal concreto.
SELECT 
    visitantes.id_visitante,
    animales.id_animal,
    animales.nombre
FROM 
    visitantes 
    INNER JOIN visitas 
    ON visitantes.id_visitante = visitas.id_visitante
    INNER JOIN visitas_habitats
    ON visitas.id_visita = visitas_habitats.id_visita
    INNER JOIN animales
    ON visitas_habitats.id_habitat = animales.id_habitat
WHERE
    visitantes.id_visitante = 8 AND
    animales.id_animal = 5;
--@block Queremos una lista de los 10 hábitats más populares.
SELECT
    habitats.id_habitat, habitats.nombre, count(*) AS "Visitas"
FROM
    habitats
    INNER JOIN visitas_habitats
    ON habitats.id_habitat = visitas_habitats.id_habitat
GROUP BY habitats.id_habitat
ORDER BY "Visitas" DESC
LIMIT 10;
--@block Queremos saber cual es el animal más popular entre visitantes menores de edad.
SELECT 
    animales.id_animal, 
    animales.nombre, 
    count(*) AS "Numero de Visitas"
FROM 
    visitantes
    INNER JOIN visitas
    ON visitantes.id_visitante = visitas.id_visitante
    INNER JOIN visitas_habitats
    ON visitas.id_visita = visitas_habitats.id_visita
    INNER JOIN habitats
    ON visitas_habitats.id_habitat = habitats.id_habitat
    INNER JOIN animales
    ON habitats.id_habitat = animales.id_habitat
WHERE visitantes.edad < 18
GROUP BY animales.id_animal
ORDER BY "Numero de Visitas" DESC
LIMIT 1;
--@block Queremos una lista de los animales ancianos (su edad es mayor que su esperanza de vida) para cuidarlos con más mimo.
--@block Queremos una lista de los animales de especies peligrosas.
--@block Queremos saber cual es el animal más popular entre personas de género femenino.
--@block Queremos saber el tamaño total del zoo en metros cuadrados.
--@block Queremos saber el porcentaje de animales de sexo masculino.
--@block Queremos saber el porcentaje de carnívoros en cada hábitat.