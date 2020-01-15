


set serveroutput on;

Create or replace procedure validar_fecha (fecha in varchar2) is


aniof varchar2(4);
mesf varchar2(2);
diaf varchar2(2);



begin
diaf:=substr(fecha, 0, 2);
mesf:=substr(fecha, 3, 2);
aniof:=substr(fecha, 5, 4);

if (bisiesto(aniof)=true and anio(aniof) and mes(mesf) and dia(diaf, bisiesto(aniof), mesf)) then
DBMS_OUTPUT.PUT_LINE('Funciona');

end if;
end validar_fecha;

/



create or replace function bisiesto(anio varchar2)
return boolean is
begin

if (MOD(to_number(anio), 4)=0)then
return true;


else return false;

end if;

end bisiesto;
/



create or replace function anio(anio1 varchar2)
return boolean is
begin

if (to_number(anio1) between 0 and 50000000000) then
return true;



else return false;


end if;
end anio;
/



create or replace function mes(mes1 varchar2)
return boolean is
begin

if (to_number(mes1) between 1 and 12) then
return true;


 
else return false;

end if;
end mes;
/




create or replace function dia(dia1 varchar2, bisiesto boolean, mes varchar2)
return boolean is
begin

if (to_number(dia1) between 1 and 31 and to_number(mes)In(1, 3, 5, 7, 8, 10, 12)) then
return true;

elsif (to_number(dia1) between 1 and 29 and to_number(mes)=2 and bisiesto=true) then
return true;

elsif (to_number(dia1) between 1 and 30 and to_number(mes)IN(4, 6, 9, 11)) then
return true;

elsif (to_number(dia1) between 1 and 28 and to_number(mes)=2 and bisiesto=false) then
return true;

else return false;
 end if;
end dia;
/






Create or replace procedure premio is

    v1 number(2);
    v2 number(2);

begin

    v2 := '&INGRESE_1';
    v1 := '&INGRESE_VALOR';
    
    case 
    when v2=1 then
        if v1=1 then DBMS_OUTPUT.PUT_LINE('Medalla de Oro');
            elsif v1=2 then DBMS_OUTPUT.PUT_LINE('Medalla de plata');
            elsif v1=3 then DBMS_OUTPUT.PUT_LINE('Medalla de bronce');
            elsif v1>3 and v1<6 then DBMS_OUTPUT.PUT_LINE('diploma');
            elsif v1>6 then DBMS_OUTPUT.PUT_LINE('Nada');
            ELSE DBMS_OUTPUT.PUT_LINE('Nota no válida');
        end if;
    
    when v2=2 then 
        case 
            when v1=1 then DBMS_OUTPUT.PUT_LINE('Medalla de Oro');
            when v1=2 then DBMS_OUTPUT.PUT_LINE('Medalla de plata');
            when v1=3 then DBMS_OUTPUT.PUT_LINE('Medalla de bronce');
            when v1>3 and v1<6 then DBMS_OUTPUT.PUT_LINE('diploma');
            when v1>6 then DBMS_OUTPUT.PUT_LINE('Nada');
            ELSE DBMS_OUTPUT.PUT_LINE('Nota no válida');
        end case;
    
    end case;
    
end premio;
/






create or replace procedure media is


    nota NUMBER(2);
    nota1 NUMBER(2);
    nota2 NUMBER(2);
    
BEGIN

    nota1:='&valor';
    nota2:='&valor';
    nota:=(nota1+nota2)/2;
    
    CASE
        WHEN nota=10 OR nota=9 THEN
        DBMS_OUTPUT.PUT_LINE('Sobresaliente');
        WHEN nota=8 OR nota=7 THEN
        DBMS_OUTPUT.PUT_LINE('Notable');
        WHEN nota=6 THEN DBMS_OUTPUT.PUT_LINE('Bien');
        WHEN nota=5 THEN DBMS_OUTPUT.PUT_LINE('Suficiente');
        WHEN nota<5 AND nota>=0 THEN
        DBMS_OUTPUT.PUT_LINE('Insuficiente');
        ELSE DBMS_OUTPUT.PUT_LINE('Nota no válida');
    END CASE;
    
END media;


create or replace procedure factorial is

    n1 number(38);
    n2 number(38);

begin

    n1:='&valor';
    n2:=n1;
    
        while n2>=1 loop
            n1:=n1*n2;
            n2:=n2-1;
        end loop;
        
    DBMS_OUTPUT.PUT_LINE(n1);

end factorial;

    
create or replace procedure duplicar is 

    anio number(2);
    dinero number(38);
    interes number(38);
    dinero2 number(38);

begin

    interes:='10';
    dinero:='10';
    dinero2:=dinero;

    
    while dinero2<dinero2*2 loop
    
        dinero:=dinero*(0.1*interes);
    
    end loop;
    
    
    DBMS_OUTPUT.PUT_LINE(anio);

end duplicar;






create  procedure diagonal(lado number) is

lado1 number(32);
lado2 number(32);
num number(32);

begin

lado1:=0;
lado2:=0;


while lado1<lado loop
    while lado2<lado loop   
        if lado1=lado2 then
            DBMS_OUTPUT.PUT_LINE('*');
            elsif lado1=0 then
            DBMS_OUTPUT.PUT_LINE('*');
            elsif lado1=lado then
            DBMS_OUTPUT.PUT_LINE('*');
            elsif lado2=0 then
            DBMS_OUTPUT.PUT_LINE('*');
            elsif lado2=lado then
            DBMS_OUTPUT.PUT_LINE('*');
        end if;
    lado2:=lado2+1;
    end loop;
lado1:=lado1+1;
end loop;


end diagonal;


   
Create table Hotel(
id number,
nombre varchar2(20),
NHABS number
);

insert into hotel values(1,'Melia', 300);
insert into hotel values(2,'NH', 250);
insert into hotel values(15,'Ryu', 500);
insert into hotel values(99,'BARCELÓ', 375);
set serveroutput on;

DECLARE
Hotel99 Hotel%ROWTYPE;
BEGIN
SELECT * INTO Hotel99 -- Hotel99 es un cursor
FROM HOTEL WHERE ID=99; -- Almacena un solo
if sql%notfound=false then
DBMS_OUTPUT.PUT_LINE ('Cód. Hotel : ' || Hotel99.ID);
DBMS_OUTPUT.PUT_LINE ('Habitaciones: ' ||
Hotel99.NHABS);
DBMS_OUTPUT.PUT_LINE ('ROWCOUNT : ' || SQL%ROWCOUNT);
end if;
END;
/


DECLARE
Hotel99 Hotel%ROWTYPE;
BEGIN
SELECT * INTO Hotel99 from hotel WHERE Nombre='Costanera';
IF SQL%NOTFOUND THEN 
DBMS_OUTPUT.PUT_LINE ('ejemplo');
end if;
-- IF SQL%ROWCOUNT > 1 THEN ... // Tampoco tiene sentido
EXCEPTION
WHEN NO_DATA_FOUND THEN -- Cuando no se recupera ninguna
INSERT INTO Hotel VALUES (100, 'Costanera', 110);
WHEN TOO_MANY_ROWS THEN -- Cuando se recuperan varias filas
DELETE Hotel WHERE Nombre='Costanera' AND
id<>100;
END;






