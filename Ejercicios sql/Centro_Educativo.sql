DROP TABLE MATRICULADO;
DROP TABLE IMPARTE;
DROP TABLE ASIGNATURA;
DROP TABLE ALUMNO;
DROP TABLE PROFESOR;
DROP TABLE PROVINCIA;

CREATE TABLE PROVINCIA 
(
	ID_PROV NUMBER NOT NULL , 
	NOMBRE VARCHAR2(100) NOT NULL , 
	CONSTRAINT PK_PROVINCIA PRIMARY KEY (ID_PROV)
);
  
CREATE TABLE PROFESOR 
(	
	ID_PROF NUMBER NOT NULL , 
	NOMBRE VARCHAR2(100) NOT NULL , 
	APELLIDOS VARCHAR2(100) NOT NULL , 
	DNI VARCHAR(9) NOT NULL,
	NACIDO_EN NUMBER, 
	CONSTRAINT PK_PROFESOR PRIMARY KEY (ID_PROF),
  CONSTRAINT FK_PROFESOR_PROVINCIA FOREIGN KEY (NACIDO_EN) REFERENCES PROVINCIA (ID_PROV) 
);
  

CREATE TABLE ALUMNO 
(	
	ID_ALUM NUMBER NOT NULL , 
	DNI VARCHAR2(9) NOT NULL , 
	NOMBRE VARCHAR2(100) NOT NULL , 
	APELLIDOS VARCHAR2(100) NOT NULL , 
	FECHA_NAC DATE, 
	NACIDO_EN NUMBER, 
	CONSTRAINT PK_ALUMNO PRIMARY KEY (ID_ALUM),
	CONSTRAINT FK_ALUMNO_PROVICIA FOREIGN KEY (NACIDO_EN) REFERENCES PROVINCIA (ID_PROV) 
);


CREATE TABLE ASIGNATURA 
(
	ID_ASIG NUMBER NOT NULL , 
	NOMBRE VARCHAR2(100) NOT NULL , 
	CONSTRAINT PK_ASIGNATURA PRIMARY KEY (ID_ASIG)
);
  

CREATE TABLE IMPARTE 
(	
	ID_PROF NUMBER NOT NULL , 
	ID_ASIG NUMBER NOT NULL , 
	CONSTRAINT PK_IMPARTE PRIMARY KEY (ID_PROF, ID_ASIG), 
	CONSTRAINT FK_IMPARTE_PROFESOR FOREIGN KEY (ID_PROF) REFERENCES PROFESOR (ID_PROF) ON DELETE CASCADE , 
	CONSTRAINT FK_IMPARTE_ASIGNATURA FOREIGN KEY (ID_ASIG) REFERENCES ASIGNATURA (ID_ASIG) ON DELETE CASCADE 
);

CREATE TABLE MATRICULADO
(
	ID_ALUM NUMBER NOT NULL, 
	ID_ASIG NUMBER NOT NULL, 
	NOTA1 NUMBER(4,2), 
	NOTA2 NUMBER(4,2), 
	NOTA3 NUMBER(4,2), 
	CONSTRAINT PK_MATRICULADO PRIMARY KEY (ID_ALUM, ID_ASIG),
  CONSTRAINT FK_MATRICULADO_ASIGNATURA FOREIGN KEY (ID_ASIG) REFERENCES ASIGNATURA (ID_ASIG) ON DELETE CASCADE , 
	CONSTRAINT FK_MATRICULADO_ALUMNO FOREIGN KEY (ID_ALUM) REFERENCES ALUMNO (ID_ALUM) ON DELETE CASCADE
);

INSERT INTO PROVINCIA (ID_PROV, Nombre) VALUES (1, 'Almer�a');
INSERT INTO PROVINCIA (ID_PROV, Nombre) VALUES (2, 'Cadiz');
INSERT INTO PROVINCIA (ID_PROV, Nombre) VALUES (3, 'C�rdoba');
INSERT INTO PROVINCIA (ID_PROV, Nombre) VALUES (4, 'Granada');
INSERT INTO PROVINCIA (ID_PROV, Nombre) VALUES (5, 'Huelva');
INSERT INTO PROVINCIA (ID_PROV, Nombre) VALUES (6, 'Jaen');
INSERT INTO PROVINCIA (ID_PROV, Nombre) VALUES (7, 'M�laga');
INSERT INTO PROVINCIA (ID_PROV, Nombre) VALUES (8, 'Sevilla');

INSERT INTO PROFESOR (ID_PROF, Nombre, Apellidos, Nacido_en, dni) VALUES (1, 'Alvaro', 'Acebedo', 8, '78293485F');
INSERT INTO PROFESOR (ID_PROF, Nombre, Apellidos, Nacido_en, dni) VALUES (2, 'Manuel', 'Gutierrez', 2, '69298485J');
INSERT INTO PROFESOR (ID_PROF, Nombre, Apellidos, Nacido_en, dni) VALUES (3, 'Celia', 'Villa', 8, '23293465L');
INSERT INTO PROFESOR (ID_PROF, Nombre, Apellidos, Nacido_en, dni) VALUES (4, 'Maria', 'Mu�oz', 3, '19298885N');

INSERT INTO ALUMNO (ID_ALUM, DNI, Nombre, Apellidos, FECHA_NAC, Nacido_en) VALUES (1, '28756358V', 'Juan', 'Veloso', TO_DATE('11/02/1977','DD/MM/YYYY'), 8);
INSERT INTO ALUMNO (ID_ALUM, DNI, Nombre, Apellidos, FECHA_NAC, Nacido_en) VALUES (2, '28956157L', 'Sonia', 'Sanchez', TO_DATE('24/08/1981','DD/MM/YYYY'), 8);
INSERT INTO ALUMNO (ID_ALUM, DNI, Nombre, Apellidos, FECHA_NAC, Nacido_en) VALUES (3, '27568011D', 'Cristina', 'Abascal', TO_DATE('08/06/1980','DD/MM/YYYY'), 2);
INSERT INTO ALUMNO (ID_ALUM, DNI, Nombre, Apellidos, FECHA_NAC, Nacido_en) VALUES (4, '28754685C', 'Manuel', 'Perez', TO_DATE('04/06/1974','DD/MM/YYYY'), 8);
INSERT INTO ALUMNO (ID_ALUM, DNI, Nombre, Apellidos, FECHA_NAC, Nacido_en) VALUES (5, '28546821Y', 'Manuel', 'Bueno', TO_DATE('19/12/1985','DD/MM/YYYY'), 2);
INSERT INTO ALUMNO (ID_ALUM, DNI, Nombre, Apellidos, FECHA_NAC, Nacido_en) VALUES (6, '27656981Y', 'Jose Antonio', 'Montero', TO_DATE('25/07/1990','DD/MM/YYYY'), 3);
INSERT INTO ALUMNO (ID_ALUM, DNI, Nombre, Apellidos, FECHA_NAC, Nacido_en) VALUES (7, '58324542B', 'Juan Jos�', 'Sanchez', TO_DATE('01/11/1992','DD/MM/YYYY'), 2);
INSERT INTO ALUMNO (ID_ALUM, DNI, Nombre, Apellidos, FECHA_NAC, Nacido_en) VALUES (8, '56846315M', 'Sandra', 'Vall�s', TO_DATE('05/01/1985','DD/MM/YYYY'), 3);
INSERT INTO ALUMNO (ID_ALUM, DNI, Nombre, Apellidos, FECHA_NAC, Nacido_en) VALUES (9, '28468215X', 'Sara', 'Merida', TO_DATE('09/09/1986','DD/MM/YYYY'), 8);
INSERT INTO ALUMNO (ID_ALUM, DNI, Nombre, Apellidos, FECHA_NAC, Nacido_en) VALUES (10, '27684214Z', 'Laura', 'Gutierrez', TO_DATE('9/04/1987','DD/MM/YYYY'), 8);
INSERT INTO ALUMNO (ID_ALUM, DNI, Nombre, Apellidos, FECHA_NAC, Nacido_en) VALUES (11, '28896443S', 'Inmaculada', 'Garc�a', TO_DATE('21/03/1989','DD/MM/YYYY'), 8);

INSERT INTO ASIGNATURA (ID_ASIG, Nombre) VALUES (1, 'Redes');
INSERT INTO ASIGNATURA (ID_ASIG, Nombre) VALUES (2, 'Sistemas');
INSERT INTO ASIGNATURA (ID_ASIG, Nombre) VALUES (3, 'Ingl�s');

INSERT INTO IMPARTE (ID_PROF, ID_ASIG) VALUES (1, 1);
INSERT INTO IMPARTE (ID_PROF, ID_ASIG) VALUES (2, 1);
INSERT INTO IMPARTE (ID_PROF, ID_ASIG) VALUES (3, 2);

INSERT INTO MATRICULADO (ID_ALUM, ID_ASIG, Nota1, Nota2, Nota3) VALUES (1, 1, 4, 6, 8);
INSERT INTO MATRICULADO (ID_ALUM, ID_ASIG, Nota1, Nota2, Nota3) VALUES (2, 1, 5, 5, 5);
INSERT INTO MATRICULADO (ID_ALUM, ID_ASIG, Nota1, Nota2, Nota3) VALUES (2, 3, 10, 9, 7);
INSERT INTO MATRICULADO (ID_ALUM, ID_ASIG, Nota1, Nota2, Nota3) VALUES (3, 1, 10, 8, 9);
INSERT INTO MATRICULADO (ID_ALUM, ID_ASIG, Nota1, Nota2, Nota3) VALUES (4, 1, 3, 3, 4);
INSERT INTO MATRICULADO (ID_ALUM, ID_ASIG, Nota1, Nota2, Nota3) VALUES (4, 3, 0, 0, 0);
INSERT INTO MATRICULADO (ID_ALUM, ID_ASIG, Nota1, Nota2, Nota3) VALUES (5, 1, 1, 4, 8);
INSERT INTO MATRICULADO (ID_ALUM, ID_ASIG, Nota1, Nota2, Nota3) VALUES (5, 3, 8, 4, 4);
INSERT INTO MATRICULADO (ID_ALUM, ID_ASIG, Nota1, Nota2, Nota3) VALUES (6, 1, 5, 2, 7);
INSERT INTO MATRICULADO (ID_ALUM, ID_ASIG, Nota1, Nota2, Nota3) VALUES (7, 1, 5, 5, 5);
INSERT INTO MATRICULADO (ID_ALUM, ID_ASIG, Nota1, Nota2, Nota3) VALUES (7, 2, 7, 5, 6);
INSERT INTO MATRICULADO (ID_ALUM, ID_ASIG, Nota1, Nota2, Nota3) VALUES (7, 3, 6, 7, 7);
INSERT INTO MATRICULADO (ID_ALUM, ID_ASIG, Nota1, Nota2, Nota3) VALUES (8, 1, 4, 6, 5);
INSERT INTO MATRICULADO (ID_ALUM, ID_ASIG, Nota1, Nota2, Nota3) VALUES (8, 2, 4, 5, 6);
INSERT INTO MATRICULADO (ID_ALUM, ID_ASIG, Nota1, Nota2, Nota3) VALUES (9, 2, 7, 7, 7);
INSERT INTO MATRICULADO (ID_ALUM, ID_ASIG, Nota1, Nota2, Nota3) VALUES (9, 3, 6, 7, 8);
INSERT INTO MATRICULADO (ID_ALUM, ID_ASIG, Nota1, Nota2, Nota3) VALUES (10, 2, 9, 5, 5);

COMMIT;

<--1-->
SELECT nombre FROM provincia;
<--2-->
SELECT nombre FROM alumno WHERE nombre LIKE 'S%';
<--3-->
SELECT nombre, apellidos FROM alumno;
<--4-->
SELECT nombre FROM alumno WHERE (nombre LIKE 'Manuel') OR (nombre LIKE 'Cristina');
<--5-->
SELECT nombre, id_asig FROM asignatura;
<--6-->
SELECT dni FROM alumno WHERE (dni LIKE '%Y');
<--7-->
SELECT id_alum, dni, nombre, apellidos, fecha_nac, nacido_en FROM alumno WHERE (dni LIKE '56846315M' ); 
<--8-->
SELECT id_alum, dni, nombre, apellidos, fecha_nac, nacido_en FROM alumno WHERE (nombre LIKE '%n%') OR (nombre LIKE '%N%');
<--9-->
SELECT dni, nombre, apellidos FROM profesor ORDER BY dni ASC; 
<--10-->
SELECT id_alum, dni, nombre, apellidos, fecha_nac AS "fecha_de_nacimiento", nacido_en FROM alumno ORDER BY fecha_nac DESC;
<--11-->
SELECT nombre, apellido FROM alumno;
<--12-->
SELECT nombre FROM alumno a, provincia p WHERE(p.id_prov Between 3 and 7);
<--13-->
SELECT id_alum, dni, nombre, apellidos, fecha_nac, nacido_en FROM alumno TO_CHAR(fecha_nac 'MON');
<--14-->
SELECT id_alum, dni, nombre, apellidos, fecha_nac, nacido_en FROM alumno WHERE (EXTRACT(YEAR FROM SYSDATE)) -(EXTRACT(YEAR FROM FECHA_NAC))>=24
<--15-->
SELECT COUNT(*) Alumno
FROM Alumno a, matriculado m, asignatura c
WHERE  (matriculado= "Redes");

<--16-->
SELECT ID_ALUM, ID_ASIG, Nota1, Nota2, Nota3 FROM matriculado WHERE (Nota2>=5) ORDER BY Nota2 desc;
<--17-->
SELECT provincia FROM alumno
<--18-->
SELECT nombre FROM profesor WHERE (NACIDO_EN=1) OR (NACIDO_EN=3) OR (NACIDO_EN=5) OR (NACIDO_EN=7)
SELECT nombre FROM profesor, provincia p WHERE (p.nombre IN ('ALMERIA', 'C�RDOBA', 'C�RDOBA)  
<--19-->
<--20-->
<--21-->
<--22-->
<--23-->
<--24-->
<--25-->
SELECT DISTINT P.ID_PROF
<--26-->
<--27-->
<--28-->

SELECT nombre, nota1 FROM alumnos, matriculado WHERE()





















<---->