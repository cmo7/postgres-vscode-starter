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
--@block Queremos una lista de los 10 hábitats más populares.
--@block Queremos saber cual es el animal más popular entre visitantes menores de edad.
--@block Queremos una lista de los animales ancianos (su edad es mayor que su esperanza de vida) para cuidarlos con más mimo.
--@block Queremos una lista de los animales de especies peligrosas.
--@block Queremos saber cual es el animal más popular entre personas de género femenino.
--@block Queremos saber el tamaño total del zoo en metros cuadrados.
--@block Queremos saber el porcentaje de animales de sexo masculino.
--@block Queremos saber el porcentaje de carnívoros en cada hábitat.