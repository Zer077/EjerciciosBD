
--Trabajo BD 

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
    FECHA1 DATE,
	NOTA2 NUMBER(4,2),
    FECHA2 DATE,
	NOTA3 NUMBER(4,2),
    FECHA3 DATE,
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



--Procedimiento para elegir las diversas opciones que quieres ejecutar

Create or replace procedure BuclePrincipal is





END BuclePrincipal;
/

--PROCEDIMIENTO DE QUE INSERTAR

--FUNCION DE INSERTAR ALUMNO
--**********AUDITORIA**********--

--FUNCION DE INSERTAR PROFESOR
--**********AUDITORIA**********--

--FUNCION DE INSERTAR MATRICULADO
--**********AUDITORIA**********--

--PROCEDIMIENTO QUE CREE UN BOLETIN DE NOTAS

--FUNCION QUE SAQUE LA NOTA1 DE UN ALUMNO

--FUNCION QUE SAQUE LA NOTA2 DE UN ALUMNO

--FUNCION QUE SAQUE LA NOTA3 DE UN ALUMNO

--PROCEDIMIENTO QUE DADA X ASIGNATURA MUESTRA TODOS LOS ALUMNOS

--PROCEDIMIENTO DE ELIMINAR REGISTRO POR ROWNUM DE ALUMNO PROFESOR O MATRICULADO POSTERIORMENTE A MOSTRARLA
--**********AUDITORIA**********--

--PROCEDIMIENTO QUE DEVUELVA LA NOTA 1 2  O 3 DE UN ALUMNO Y ASIGNATURA Y TE PERMITA MODIFICARLA (SOLO 7 DIAS) POSTERIOR A ESO SOLO A UN USUARIO DIRECTOR
--**********AUDITORIA**********--


--VER DATOS DE LA TABLA QUE TE PIDA

create or replace PROCEDURE VERTABLA IS
    V1 NUMBER(1);
    cursor n1 is SELECT ID_PROV ,NOMBRE  FROM PROVINCIA;
    cursor n2 is SELECT ID_PROF ,NOMBRE ,APELLIDOS ,DNI ,NACIDO_EN  FROM PROFESOR;
    cursor n3 is SELECT ID_ALUM ,DNI ,NOMBRE ,APELLIDOS ,FECHA_NAC ,NACIDO_EN  FROM ALUMNO;
    cursor n4 is SELECT ID_ALUM ,ID_ASIG ,NOTA1 ,FECHA1 ,NOTA2 ,FECHA2 ,NOTA3 ,FECHA3  FROM MATRICULADO;
    cursor n5 is SELECT ID_ASIG ,NOMBRE  FROM ASIGNATURA;
    cursor n6 is SELECT ID_PROF ,ID_ASIG  FROM IMPARTE;
    registro1 n1%ROWTYPE;
    registro2 n2%ROWTYPE;
    registro3 n3%ROWTYPE;
    registro4 n4%ROWTYPE;
    registro5 n5%ROWTYPE;
    registro6 n6%ROWTYPE;

BEGIN
        DBMS_OUTPUT.PUT_LINE ('1.PROVINCIA');
        DBMS_OUTPUT.PUT_LINE ('2.PROFESOR');
        DBMS_OUTPUT.PUT_LINE ('3.ALUMNO');
        DBMS_OUTPUT.PUT_LINE ('4.MATRICULADO');
        DBMS_OUTPUT.PUT_LINE ('5.ASIGNATURA');
        DBMS_OUTPUT.PUT_LINE ('6.IMPARTE');
        V1 := '&elegir que tabla ver';
        CASE
            WHEN V1=1 THEN 
                open n1;
                    loop
                    FETCH n1 INTO registro1;
                        exit  when n1%notfound;
                        dbms_output.put_line ('provincia: ' || registro1.ID_PROV || ' nombre: '|| registro1.NOMBRE);
                    end loop;
                close n1;

            WHEN V1=2 THEN 
                open n2;
                    loop
                        FETCH n2 INTO registro2;
                        exit  when n2%notfound;
                        dbms_output.put_line('ID: '||registro2.ID_PROF || ' nombre: '||registro2.NOMBRE || ' APELLIDO: '||registro2.APELLIDOS || ' DNI: '||registro2.DNI || ' Nacido en: '||registro2.NACIDO_EN);
                    end loop;

                close n2;

            WHEN V1=3 THEN 
                open n3;

                    loop
                        FETCH n3 INTO registro3;
                        exit  when n3%notfound;
                        dbms_output.put_line('ID: '||registro3.ID_ALUM  || ' DNI: '||registro3.DNI || ' nombre: '|| registro3.NOMBRE || ' APELLIDO: '||registro3.APELLIDOS || ' FECHA: '||registro3.FECHA_NAC || ' NACIDO EN: '||registro3.NACIDO_EN);
                    end loop;

                close n3;

            WHEN V1=4 THEN 
            open n4;

                loop
                    FETCH n4 INTO registro4;
                    exit  when n4%notfound;
                    dbms_output.put_line('ID ALUMNO: '||registro4.ID_ALUM || ' ID ASIGNATURA: '||registro4.ID_ASIG || ' NOTA1: '||registro4.NOTA1 || ' FECHA1: '||registro4.FECHA1 ||' nOTA2: '|| registro4.NOTA2 || ' FECHA2: '||registro4.FECHA2 || ' noTA3: '||registro4.NOTA3 || ' FECHA3: '||registro4.FECHA3);
                end loop;

            close n4;          

            WHEN V1=5 THEN 
                open n5;

                    loop
                        FETCH n5 INTO registro5;
                        exit  when n5%notfound;
                        dbms_output.put_line('ID ASIGNATURA: '||registro5.ID_ASIG || ' nombre: '||registro5.NOMBRE);
                    end loop;

                close n5;

            WHEN V1=6 THEN 
                open n6;

                    loop
                        FETCH n6 INTO registro6;
                        exit  when n6%notfound;
                        dbms_output.put_line('ID PROFESOR: '||registro6.ID_PROF || ' ID ASIGNATURA: '||registro6.ID_ASIG);
                    end loop;

                close n6;

            ELSE DBMS_OUTPUT.PUT_LINE('Numero inválido');
        END CASE;
        
Exception

DBMS_OUTPUT.PUT_LINE('Numero inválido');

        
END VERTABLA;





--FUNCION QUE DE LA NOTA MEDIA DE 3 NOTAS

--FUNCION QUE TE DE LA MEDIA DE NOTAS DE TODOS LOS ALUMNOS DE UNA ASIGNATURA PARA IN PROFESOR

--PROCEDIMIENTO QUE DE EL PORCENTAJE DE APROBADOS Y SUSPENSOS DE CADA ASIGNATURA


--PORCENTAJE DE APROBADOS Y SUSPENSO POR PROFESOR POR ASIGNATURA

create or replace procedure Cambiodenota is 
declare

    fecha date;

begin

    alumno:='&alumno a modificar (numero)'
    asignatura:='&asignatura a modificar (numero)'
    opcion:='& nota a modificar 1.Nota 1, 2.Nota 2, 3.Nota 3'
    
    case when opcion:
    
        when opcion=1 then fecha:= select fecha1 from matriculado where ID_ALUM=alumno AND ID_ASIG=asignatura;   
        when opcion=2 then fecha:= select fecha2 from matriculado where ID_ALUM=alumno AND ID_ASIG=asignatura;
        when opcion=3 then fecha:= select fecha3 from matriculado where ID_ALUM=alumno AND ID_ASIG=asignatura;
    
    end case
    
    if(ComprobacionFechaYUsuario(fecha)=true) then
        nota:='&que nota deseas ponerle al alumno seleccionado?'
    
        case when opcion:
        
            when opcion=1 then UPDATE matriculado set nota1=nota where id_alum=alumno;   
            when opcion=2 then UPDATE matriculado set nota2=nota where id_alum=alumno;  
            when opcion=3 then UPDATE matriculado set nota2=nota where id_alum=alumno;  
        
        end case
    
    end if;
    
exception
DBMS_OUTPUT.PUT_LINE('introducte los datos correctamente por favor');

end Cambiodenota
/







create or replace function ComprobacionFechaYUsuario(fecha date) is
return boolean
begin

    if (select CURRENT_USER=DIRECTOR)
        return true;
        elsif (sysdate between fecha and fecha2 ) then
            return true;
        else return false;
        end if;
    end if;

end ComprobacionFechaYUsuario;
/





create or replace procedure Porcentajes is 
declare
    total number(20);
    suspensos number(20);
    aprobados number(20);
    cursor alumnos is
    select a.id_alum, sum(nota1+nota2+nota3)/3 as notaFinal from matriculado m, alumno a where id_asig=1 and a.id_alum=m.id_alum group by a.id_alum;
    registro alumnos%ROWTYPE

begin


    total:=select count(a.id_alum) from matriculado m, alumno a where id_asig=1 and a.id_alum=m.id_alum;
    
    open alumnos;
        loop
            fetch alumnos into registro;
            EXIT WHEN alumnos%NOTFOUND;
            if (registro.notaFinal>=5)
                aprobados:=probados+1;
            else suspensos:=suspensos+1;
        end loop;
    
    
    
    DBMS_OUTPUT.PUT_LINE('aprobado: '|| (aprobados/total)*100);
    DBMS_OUTPUT.PUT_LINE('suspensos: '|| (suspensos/total)*100);
 
    exception
    DBMS_OUTPUT.PUT_LINE('errror inesperado ');



end Porcentajes;
/









