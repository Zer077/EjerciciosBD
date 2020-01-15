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

INSERT INTO PROVINCIA (ID_PROV, Nombre) VALUES (1, 'Almería');
INSERT INTO PROVINCIA (ID_PROV, Nombre) VALUES (2, 'Cadiz');
INSERT INTO PROVINCIA (ID_PROV, Nombre) VALUES (3, 'Córdoba');
INSERT INTO PROVINCIA (ID_PROV, Nombre) VALUES (4, 'Granada');
INSERT INTO PROVINCIA (ID_PROV, Nombre) VALUES (5, 'Huelva');
INSERT INTO PROVINCIA (ID_PROV, Nombre) VALUES (6, 'Jaen');
INSERT INTO PROVINCIA (ID_PROV, Nombre) VALUES (7, 'Málaga');
INSERT INTO PROVINCIA (ID_PROV, Nombre) VALUES (8, 'Sevilla');

INSERT INTO PROFESOR (ID_PROF, Nombre, Apellidos, Nacido_en, dni) VALUES (1, 'Alvaro', 'Acebedo', 8, '78293485F');
INSERT INTO PROFESOR (ID_PROF, Nombre, Apellidos, Nacido_en, dni) VALUES (2, 'Manuel', 'Gutierrez', 2, '69298485J');
INSERT INTO PROFESOR (ID_PROF, Nombre, Apellidos, Nacido_en, dni) VALUES (3, 'Celia', 'Villa', 8, '23293465L');
INSERT INTO PROFESOR (ID_PROF, Nombre, Apellidos, Nacido_en, dni) VALUES (4, 'Maria', 'Muñoz', 3, '19298885N');

INSERT INTO ALUMNO (ID_ALUM, DNI, Nombre, Apellidos, FECHA_NAC, Nacido_en) VALUES (1, '28756358V', 'Juan', 'Veloso', TO_DATE('11/02/1977','DD/MM/YYYY'), 8);
INSERT INTO ALUMNO (ID_ALUM, DNI, Nombre, Apellidos, FECHA_NAC, Nacido_en) VALUES (2, '28956157L', 'Sonia', 'Sanchez', TO_DATE('24/08/1981','DD/MM/YYYY'), 8);
INSERT INTO ALUMNO (ID_ALUM, DNI, Nombre, Apellidos, FECHA_NAC, Nacido_en) VALUES (3, '27568011D', 'Cristina', 'Abascal', TO_DATE('08/06/1980','DD/MM/YYYY'), 2);
INSERT INTO ALUMNO (ID_ALUM, DNI, Nombre, Apellidos, FECHA_NAC, Nacido_en) VALUES (4, '28754685C', 'Manuel', 'Perez', TO_DATE('04/06/1974','DD/MM/YYYY'), 8);
INSERT INTO ALUMNO (ID_ALUM, DNI, Nombre, Apellidos, FECHA_NAC, Nacido_en) VALUES (5, '28546821Y', 'Manuel', 'Bueno', TO_DATE('19/12/1985','DD/MM/YYYY'), 2);
INSERT INTO ALUMNO (ID_ALUM, DNI, Nombre, Apellidos, FECHA_NAC, Nacido_en) VALUES (6, '27656981Y', 'Jose Antonio', 'Montero', TO_DATE('25/07/1990','DD/MM/YYYY'), 3);
INSERT INTO ALUMNO (ID_ALUM, DNI, Nombre, Apellidos, FECHA_NAC, Nacido_en) VALUES (7, '58324542B', 'Juan José', 'Sanchez', TO_DATE('01/11/1992','DD/MM/YYYY'), 2);
INSERT INTO ALUMNO (ID_ALUM, DNI, Nombre, Apellidos, FECHA_NAC, Nacido_en) VALUES (8, '56846315M', 'Sandra', 'Vallés', TO_DATE('05/01/1985','DD/MM/YYYY'), 3);
INSERT INTO ALUMNO (ID_ALUM, DNI, Nombre, Apellidos, FECHA_NAC, Nacido_en) VALUES (9, '28468215X', 'Sara', 'Merida', TO_DATE('09/09/1986','DD/MM/YYYY'), 8);
INSERT INTO ALUMNO (ID_ALUM, DNI, Nombre, Apellidos, FECHA_NAC, Nacido_en) VALUES (10, '27684214Z', 'Laura', 'Gutierrez', TO_DATE('9/04/1987','DD/MM/YYYY'), 8);
INSERT INTO ALUMNO (ID_ALUM, DNI, Nombre, Apellidos, FECHA_NAC, Nacido_en) VALUES (11, '28896443S', 'Inmaculada', 'García', TO_DATE('21/03/1989','DD/MM/YYYY'), 8);

INSERT INTO ASIGNATURA (ID_ASIG, Nombre) VALUES (1, 'Redes');
INSERT INTO ASIGNATURA (ID_ASIG, Nombre) VALUES (2, 'Sistemas');
INSERT INTO ASIGNATURA (ID_ASIG, Nombre) VALUES (3, 'Inglés');

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
SELECT nombre, apellidos FROM alumno WHERE ROWNUM <=4  ORDER BY fecha_nac DESC;
<--12-->
SELECT a.nombre, a.apellidos, p.nombre 
FROM alumno a, provincia p 
WHERE(p.id_prov Between 3 and 7 AND a.nacido_en=p.id_prov);
<--13-->
SELECT id_alum, dni, nombre, apellidos, fecha_nac, nacido_en, (TO_CHAR (FECHA_NAC, 'MON'))as mes FROM alumno ORDER BY "MES";
<--14-->
SELECT id_alum, dni, nombre, apellidos, fecha_nac, nacido_en FROM alumno WHERE (EXTRACT(YEAR FROM SYSDATE)) -(EXTRACT(YEAR FROM FECHA_NAC))>=24
SELECT id_alum, dni, nombre, apellidos, fecha_nac, nacido_en FROM alumno WHERE (SYSDATE - alumno.fecha_nac)/365>24;
<--15-->
SELECT COUNT(*) 
FROM alumno b, matriculado m, asignatura a
WHERE  (a.nombre='Redes' AND (m.id_asig=a.id_asig) AND (b.id_alum=m.id_alum));

<--16-->
SELECT ID_ALUM, ID_ASIG, Nota1, Nota2, Nota3 FROM matriculado WHERE (Nota2>=5) ORDER BY Nota2 desc;
<--17-->
SELECT  DISTINCT p.nombre FROM alumno a, provincia p WHERE (a.Nacido_en=p.id_prov);
<--18-->

SELECT a.nombre FROM profesor a, provincia p WHERE (p.nombre IN ('ALMERIA', 'CÓRDOBA', 'HUELVA', 'MÁLAGA'));  
<--19-->
SELECT b.id_alum, dni, b.nombre, apellidos, fecha_nac, nacido_en 
FROM alumno b, asignatura a, matriculado m 
WHERE ((m.NOTA1=10) OR (m.NOTA2=10) OR (m.NOTA3=10) AND (b.id_alum=m.id_alum) AND (m.id_asig=a.id_asig));

<--20-->
SELECT  b.id_alum, dni, b.nombre, apellidos, fecha_nac, nacido_en 
FROM alumno b
WHERE (FECHA_NAC BETWEEN '19021980' AND '20071984');
<--21-->
SELECT b.nombre, a.nombre, m.NOTA1, m.NOTA2, m.NOTA3
FROM alumno b, asignatura a, matriculado m
WHERE (b.id_alum=m.id_alum) AND (m.id_asig=a.id_asig) and b.id_alum=7;
<--22-->
SELECT DISTINCT ID_ALUM, ID_ASIG, Nota1, Nota2, Nota3, ((NOTA1+ NOTA2+NOTA3)/3)AS notas
FROM matriculado
ORDER BY NOTAS DESC;
<--23-->
SELECT b.nombre
FROM alumno b, matriculado m, asignatura a
WHERE (a.nombre='Redes' AND m.NOTA1>=5 AND m.NOTA2>=5 AND m.NOTA3>=5 AND (b.id_alum=m.id_alum) AND (m.id_asig=a.id_asig));
<--24-->
SELECT DISTINCT b.id_alum, dni, b.nombre, apellidos, fecha_nac, nacido_en 
FROM alumno b, asignatura a, matriculado m 
WHERE (m.NOTA1>=5 or m.NOTA2>=5 or m.NOTA3>=5) 
AND b.id_alum=m.id_alum 
AND m.id_asig=a.id_asig
AND a.nombre='Sistemas';

<--25-->
SELECT DISTINCT P.NOMBRE
FROM Profesor P, alumno a, asignatura b, imparte i, matriculado m
WHERE (P.id_prof=i.id_prof 
AND i.id_asig=b.id_asig 
AND m.id_asig=b.id_asig 
AND m.id_alum=a.id_alum 
AND fecha_nac BETWEEN '01011985' AND '31121985');
<--26-->
SELECT a.id_alum, a.dni, a.nombre, a.apellidos, a.fecha_nac, a.nacido_en, p.nombre, 'Nacido el dia ' || to_char(fecha_nac, 'DD') || ' de ' ||to_char(fecha_nac, 'MONTH') || ' del año ' || to_char(fecha_nac, 'YYYY') AS fecha_de_nacimiento
FROM alumno a, provincia p
WHERE p.nombre IN ('Sevilla', 'Córdoba') 
AND p.id_prov=a.nacido_en;
<--27-->
SELECT COUNT(*) 
FROM profesor p, asignatura a, imparte i, provincia pro
WHERE  (a.nombre='Redes' AND pro.nombre='Sevilla' AND i.id_prof=p.id_prof 
AND i.id_asig=a.id_asig AND p.nacido_en=pro.id_prov);
<--28-->

SELECT b.nombre, m.NOTA1
    FROM alumno b, asignatura a, matriculado m
    WHERE  (a.nombre='Sistemas' 
AND m.NOTA1<(SELECT avg(NOTA1) 
    from matriculado m 
    WHERE (a.nombre='Sistemas')) 
AND (b.id_alum=m.id_alum) AND (m.id_asig=a.id_asig));

SELECT b.nombre, m.NOTA1
    FROM alumno b, asignatura a, matriculado m
    WHERE  (a.nombre='Sistemas' 
AND m.NOTA1<(SELECT avg(NOTA1) 
    from matriculado m)
AND (b.id_alum=m.id_alum) AND (m.id_asig=a.id_asig));
    
SELECT b.nombre, m.NOTA1
    FROM alumno b, asignatura a, matriculado m, 
        (SELECT avg(NOTA1) as NOTA1 
            from matriculado, asignatura 
            where asignatura.nombre='Sistemas' 
                AND matriculado.id_asig=asignatura.id_asig) media
    WHERE  a.nombre='Sistemas'
        AND b.id_alum=m.id_alum
        AND m.id_asig=a.id_asig 
        AND m.NOTA1<media.nota1;
        
        
SELECT b.nombre, m.NOTA1, 
    (SELECT avg(NOTA1)
        from matriculado, asignatura 
        where asignatura.nombre='Sistemas' 
        AND matriculado.id_asig=asignatura.id_asig) as media
    FROM alumno b, asignatura a, matriculado m      
    WHERE  a.nombre='Sistemas'
        AND b.id_alum=m.id_alum
        AND m.id_asig=a.id_asig ;
        

<--1-->

SELECT dni, nombre, apellidos, SUBSTR(dni,1,8)
FROM alumno
WHERE (mod(SUBSTR(dni,1,8),2)>0);

<--2-->
--SELECT b.dni, b.nombre, b.apellidos
--FROM alumno b, asignatura a, matriculado m
--WHERE (EXTRACT(YEAR FROM SYSDATE)) -(EXTRACT(YEAR FROM FECHA_NAC))>=30 AND (EXTRACT(YEAR FROM SYSDATE)) -(EXTRACT(YEAR FROM FECHA_NAC))<38 AND a.nombre='Redes' AND (b.id_alum=m.id_alum) AND (m.id_asig=a.id_asig);
SELECT b.dni, b.nombre, b.apellidos
FROM alumno b, asignatura a, matriculado m
WHERE (SYSDATE - b.fecha_nac)/365>=30 AND (SYSDATE - b.fecha_nac)/365<38 AND a.nombre='Redes' AND (b.id_alum=m.id_alum) AND (m.id_asig=a.id_asig);


<--3-->
SELECT 'El alumno ' || b.nombre ||' '|| b.apellidos ||' con DNI ' || b.dni || ' ha obtenido una calificacion de ' || m.Nota1 || ' en la asignatura ' || a.nombre AS "LISTADO DE CALIFICACIONES"
FROM alumno b, matriculado m, asignatura a
WHERE (b.id_alum=m.id_alum) AND (m.id_asig=a.id_asig)
ORDER BY dni asc;

<--4-->
SELECT a.nombre as "Nombre alumno", p.nombre as "Nombre profesor", min(m.nota2) as "minima" ,max(m.nota2) as "maxima", avg(m.NOTA2) as "media"
FROM matriculado m, asignatura a, profesor p, imparte i
WHERE m.id_asig=a.id_asig AND p.id_prof=i.id_prof AND a.id_asig=i.id_asig
GROUP BY a.nombre, p.nombre;


<--5-->
SELECT b.dni, b.nombre, b.apellidos, trunc(avg(m.nota1),2) as "media nota 1", trunc(avg(m.nota2),2) as "media nota 2", trunc(avg(m.nota3),2) as "media nota 3"
FROM asignatura a, alumno b, matriculado m
WHERE (b.id_alum=m.id_alum) AND (m.id_asig=a.id_asig)
GROUP BY b.dni, b.nombre, b.apellidos
HAVING count (b.dni)>=2;
















<---->