CREATE TABLE profesores
(

Nombre VARCHAR2(20) NOT NULL,
Apellido1 VARCHAR2(20)  NOT NULL,
Apellido2 VARCHAR2(20) NOT NULL,
NIF CHAR(9) CONSTRAINT NIF_PRO_PK PRIMARY KEY,
Dir VARCHAR2(20),
Titulacion VARCHAR2(20),
Salario Number(6,2)




CREATE TABLE cursos
(
Nombre VARCHAR2(20) NOT NULL,
Codigo CHAR(20)  CONSTRAINT COD_CUR_PK PRIMARY KEY,
Profesor CONSTRAINT COD_CUR_FK FOREIGN KEY REFERENCES profesores,
Maximo_Alumnos NUMBER(3),
Fecha_inicio DATE,
Fecha_final DATE CHECK(Fecha_Final>Fecha_inicio),
Numero_horas NUMBER(3)
);

);CREATE TABLE alumnos
(
Nombre VARCHAR2(20)  NOT NULL,
Apellido1 VARCHAR2(20) NOT NULL,
Apellido2 VARCHAR2(20) NOT NULL,
NIF CHAR(9) CONSTRAINT NIF_ALU_PK PRIMARY KEY,
Dir VARCHAR2(20),
Sexo CHAR(5),
Nacimiento DATE,
Curso CHAR(20) CONSTRAINT CUR_ALU_FK FOREIGN KEY REFERENCES cursos
);

CREATE INDEX curso (Codigo);

CREATE INDEX alumno (NIF, Apellido);

CREATE INDEX profesores (NIF, Apellido);