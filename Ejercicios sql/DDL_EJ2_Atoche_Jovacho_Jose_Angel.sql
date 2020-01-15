CREATE TABLE juego
(
    Titulo VARCHAR2(20) CONSTRAINT JUE_TIT_PK PRIMARY KEY,
    Pegi NUMBER(2),
    codigo_juego CHAR(18) NOT NULL,
    Genero VARCHAR2(20)
);

CREATE TABLE jugador
(
    DNI CHAR(9) CONSTRAINT JUG_DNI_PK PRIMARY KEY,
    Nombre VARCHAR2(20) NOT NULL,
    Nick VARCHAR2(20) DEFAULT 'PLAYER_UNKNOW',
    Edad NUMBER(2)CONSTRAINT JUG_EDA_CK CHECK(EDAD>16)
);

CREATE TABLE equipo
(
    Nombre VARCHAR2(20) NOT NULL CONSTRAINT EQUI_NOM_UK UNIQUE,
    Numero_Jugadores NUMBER(1) CONSTRAINT EQUI_NOM_NULL NOT NULL,
    Jugador_lider CHAR(9) CONSTRAINT EQU_JUG_FK REFERENCES jugador,
    Juego VARCHAR2(20),
    CONSTRAINT equ_pri_pk PRIMARY KEY (Nombre, Juego),
    CONSTRAINT EQU_JUE_FK FOREIGN KEY (Juego) REFERENCES juego
);
 
 
--Modificacion de tablas
     ALTER TABLE jugador MODIFY (Edad NUMBER(3));
     ALTER TABLE equipo MODIFY (Numero_Jugadores NUMBER(2));
     ALTER TABLE equipo ADD (Ganadas NUMBER(3));
     ALTER TABLE equipo DISABLE CONSTRAINT EQU_JUG_FK;
     ALTER TABLE equipo DROP CONSTRAINT EQU_JUG_FK;
     ALTER TABLE equipo DROP COLUMN Jugador_lider;
     ALTER TABLE juego MODIFY (Pegi CONSTRAINT JUE_PEG_CK CHECK (Pegi>3));
     ALTER TABLE equipo ADD(Mejor_Jugador CHAR(9) CONSTRAINT EQU_MJUG_FK REFERENCES jugador);


--Creación de Indices

--Quiero buscar a jugadores por Nick
    CREATE INDEX  JUG_NIC_ID ON jugador (Nick);
--Quiero buscar a jugadores por Edad
    CREATE INDEX JUG_EDA_ID ON jugador (Edad);

--Quiero buscar a juegos por Genero
    CREATE INDEX  JUE_GEN_ID ON juego (Genero);


--Creación de Roles
    CREATE ROLE ADMINISTRAD;
    CREATE ROLE SUPERUSER;
    CREATE ROLE NORMALUSER;
    CREATE ROLE INVITADO;


--Privilegios de ROLES
    GRANT ALL PRIVILEGES TO ADMINISTRAD;
    GRANT SELECT ANY TABLE TO SUPERUSER;
    GRANT INSERT ANY TABLE TO SUPERUSER;
    GRANT INSERT ON juego TO NORMALUSER;
    GRANT SELECT ON juego TO INVITADO;


--Creacion usuarios
    CREATE USER pepe IDENTIFIED BY usuario;
    CREATE USER juan IDENTIFIED BY usuario;
    CREATE USER manolo IDENTIFIED BY usuario;
    CREATE USER kiko IDENTIFIED BY usuario;


--Dar roles a usuarios
    GRANT ADMINISTRAD TO pepe;
    GRANT SUPERUSER TO juan;
    GRANT NORMALUSER TO manolo;
    GRANT INVITADO TO kiko;

--Eliminacion usuarios
    DROP USER pepe CASCADE;
    DROP USER juan CASCADE;
    DROP USER manolo CASCADE;
    DROP USER kiko CASCADE;


--Eliminacion ROLES
    DROP ROLE ADMINISTRAD;
    DROP ROLE SUPERUSER;
    DROP ROLE NORMALUSER;
    DROP ROLE INVITADO;
 
--Borrado de Indices
    DROP INDEX JUG_NIC_ID;
    DROP INDEX JUG_EDA_ID;
    DROP INDEX JUE_GEN_ID;
 
 
--Borrado de tablas
    DROP TABLE equipo;
    DROP TABLE jugador;
    DROP TABLE juego;