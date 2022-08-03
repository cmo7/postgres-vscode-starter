-- Borar las tablas si existen --

DROP TABLE IF EXISTS visitas_habitats;
DROP TABLE IF EXISTS visitas;
DROP TABLE IF EXISTS visitantes;
DROP TABLE IF EXISTS animales;
DROP TABLE IF EXISTS especies;
DROP TABLE IF EXISTS habitats;

-- Crea las tablas necesarias para la base de datos del zoo --       
CREATE TABLE animales
(
  id_animal  SERIAL       NOT NULL,
  id_especie INTEGER      NOT NULL,
  id_habitat INTEGER      NOT NULL,
  nombre     VARCHAR(30)  NOT NULL,
  sexo       CHAR(1)      NOT NULL,
  edad       INTEGER      NOT NULL,
  PRIMARY KEY (id_animal)
);

CREATE TABLE especies
(
  id_especie        SERIAL       NOT NULL,
  nombre            VARCHAR(60)  NOT NULL,
  peso_maximo       NUMERIC(8,2) NOT NULL,
  esperanza_de_vida INTEGER      NOT NULL,
  peligrosidad      VARCHAR(5)   NOT NULL,
  dieta             VARCHAR(9)   NOT NULL,
  PRIMARY KEY (id_especie)
);

CREATE TABLE habitats
(
  id_habitat SERIAL        NOT NULL,
  nombre     VARCHAR(60)   NOT NULL,
  tipo       VARCHAR(8)    NOT NULL,
  tamanio    NUMERIC(10,2) NOT NULL,
  PRIMARY KEY (id_habitat)
);

CREATE TABLE visitantes
(
  id_visitante SERIAL     NOT NULL,
  edad         INTEGER    NOT NULL,
  genero       VARCHAR(9) NOT NULL,
  PRIMARY KEY (id_visitante)
);

CREATE TABLE visitas
(
  id_visita    SERIAL NOT NULL,
  id_visitante INTEGER NOT NULL,
  duracion     TIME   NULL    ,
  PRIMARY KEY (id_visita)
);

CREATE TABLE visitas_habitats
(
  id_visita_habitat SERIAL NOT NULL,
  id_habitat        INTEGER NOT NULL,
  id_visita         INTEGER NOT NULL,
  PRIMARY KEY (id_visita_habitat)
);

ALTER TABLE animales
  ADD CONSTRAINT FK_habitats_TO_animales
    FOREIGN KEY (id_habitat)
    REFERENCES habitats (id_habitat);

ALTER TABLE animales
  ADD CONSTRAINT FK_especies_TO_animales
    FOREIGN KEY (id_especie)
    REFERENCES especies (id_especie);

ALTER TABLE visitas
  ADD CONSTRAINT FK_visitantes_TO_visitas
    FOREIGN KEY (id_visitante)
    REFERENCES visitantes (id_visitante);

ALTER TABLE visitas_habitats
  ADD CONSTRAINT FK_habitats_TO_visitas_habitats
    FOREIGN KEY (id_habitat)
    REFERENCES habitats (id_habitat);

ALTER TABLE visitas_habitats
  ADD CONSTRAINT FK_visitas_TO_visitas_habitats
    FOREIGN KEY (id_visita)
    REFERENCES visitas (id_visita);