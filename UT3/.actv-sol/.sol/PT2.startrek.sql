DROP DATABASE IF EXISTS startrek;
CREATE DATABASE stratrek;
USE stratrek;

/*
DROP TABLE IF EXISTS VISITAR;
DROP TABLE IF EXISTS PARTICIPAR;
DROP TABLE IF EXISTS APARECER;
DROP TABLE IF EXISTS NAVES;
DROP TABLE IF EXISTS PLANETAS;
DROP TABLE IF EXISTS CAPITULOS;
DROP TABLE IF EXISTS PELICULAS;
DROP TABLE IF EXISTS PERSONAJES;
DROP TABLE IF EXISTS ACTORES;
*/
CREATE TABLE ACTORES(
    idActor INT(3) PRIMARY KEY,
    nombre VARCHAR(100),
    nacionalidad VARCHAR(100),
    fechaNacimiento DATE
);

CREATE TABLE PERSONAJES 
( 
    nombre VARCHAR(256) PRIMARY KEY, 
    raza VARCHAR(50), 
    graduacionMilitar VARCHAR(50), 
    actor INT(3),
    capMilitar VARCHAR(100),
    FOREIGN KEY (actor) REFERENCES ACTORES(idActor),
    FOREIGN KEY (capMilitar) REFERENCES PERSONAJES(nombre)
);

CREATE TABLE PELICULAS( 
    titulo VARCHAR(200) PRIMARY KEY, 
    director VARCHAR(100), 
    añoLanzamiento INT(4), 
    protagonista VARCHAR(100),
    FOREIGN KEY (protagonista) REFERENCES PERSONAJES(nombre)
);

CREATE TABLE CAPITULOS ( 
    titulo VARCHAR(200), 
    temporada INT(2),
    ordenRodaje INT(3),
    fechaEmision1 DATE,
    PRIMARY KEY (titulo, temporada)
);

CREATE TABLE PLANETAS ( 
    codigo INT(3) PRIMARY KEY,
    nombre VARCHAR(100),
    galaxia VARCHAR(100)
);

CREATE TABLE NAVES ( 
    codigo INT(3) PRIMARY KEY,
    nombre VARCHAR(100),
    tripulacion INT(4)
);

CREATE TABLE APARECER ( 
    personaje VARCHAR(100), 
    pelicula VARCHAR(200),
    PRIMARY KEY (personaje, pelicula),
    FOREIGN KEY (personaje) REFERENCES PERSONAJES(nombre),
    FOREIGN KEY (pelicula) REFERENCES PELICULAS(titulo)
);

CREATE TABLE PARTICIPAR ( 
    capituloTitulo VARCHAR(200), 
    capituloTemporada INT(2),
    personaje VARCHAR(100),
    PRIMARY KEY (capituloTitulo, capituloTemporada, personaje),
    FOREIGN KEY (capituloTitulo, capituloTemporada) REFERENCES CAPITULOS(titulo, temporada),
    FOREIGN KEY (personaje) REFERENCES PERSONAJES(nombre)
);

CREATE TABLE VISITAR ( 
    capituloTitulo VARCHAR(200), 
    capituloTemporada INT(2),
    planeta INT(3),
    nave INT(3),
    problema VARCHAR(512),
    PRIMARY KEY (capituloTitulo, capituloTemporada, planeta, nave),
    FOREIGN KEY (capituloTitulo, capituloTemporada) REFERENCES CAPITULOS(titulo, temporada),
    FOREIGN KEY (planeta) REFERENCES PLANETAS(codigo),
    FOREIGN KEY (nave) REFERENCES NAVES(codigo)
);