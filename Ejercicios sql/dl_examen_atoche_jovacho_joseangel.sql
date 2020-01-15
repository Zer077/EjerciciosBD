--Apartado A

CREATE TABLE cliente(
    dni CHAR(9) CONSTRAINT DNI_CLI_PK PRIMARY KEY, 
    nombre VARCHAR2(20) NOT NULL,
    direccion VARCHAR2(30) NOT NULL,
    telefono CHAR(12) NOT NULL,
    saldo Number(30,20) CONSTRAINT SAL_CLI_CK CHECK (saldo>0)
);


CREATE TABLE pedido(
    NoPedido VARCHAR2(10) constraint ped_ped_pk Primary Key,
    fecha DATE,
    dni_cliente CONSTRAINT DNI_PED_FK REFERENCES cliente
);


CREATE TABLE articulo(
    NoArticulo VARCHAR2(10) CONSTRAINT NAR_ART_PK PRIMARY KEY,
    nombre VARCHAR2(20),
    precioVenta NUMBER(4,2)
);


CREATE TABLE proveedor(
    cif CHAR(9) CONSTRAINT cid_prov_pk PRIMARY KEY,
    nombre VARCHAR2(20) NOT NULL,
    direccion VARCHAR2(30) NOT NULL,
    telefono CHAR(12) NOT NULL
);




CREATE TABLE articulopedido (
    NoArticulo VARCHAR2(10).
    nombre VARCHAR2(20),
    precioVenta NUMBER(4,2),
    NoPedido VARCHAR2(10),
    Fecha DATE ,
    Cantidad NUMBER(10)
);




CREATE TABLE articuloproveedor(
    NoArticulo VARCHAR2(10),
    nombre_articulo VARCHAR2(20),
    precioVenta NUMBER(4,2),
    cif CHAR(9),
    nombre_proveedor VARCHAR2(20) NOT NULL,
    direccion VARCHAR2(30) NOT NULL,
    telefono CHAR(12) NOT NULL,
    PrecioProveedor NUMBER(4,2)
);





CREATE TABLE empleado(
    dni CHAR(9) CONSTRAINT DNI_EMP_PK PRIMARY KEY, 
    nombre VARCHAR2(20) NOT NULL,
    direccion VARCHAR2(30) NOT NULL,
    telefono CHAR(12) NOT NULL,
    saldo Number(30,20)
);

CREATE TABLE departamento(
    idDepartamento char(5),
    areaventas char(10),
    dni_empl CHAR(9) CONSTRAINT DNI_DEP_FK REFERENCES empleado,
    EsDirector CHAR(2) 
);


--APARTADO B
ALTER TABLE cliente ADD apellido VARCHAR2(20);
ALTER TABLE empleado MODIFY saldo Number(30,20) CONSTRAINT SAL_EMP_CK CHECK (saldo between 800 and 2000);
ALTER TABLE clientes DISABLE CONSTRAINT SAL_CLI_CK;

--APARTADO C

create INDEX Indice1 ON clientes (nombre, apellido);
create INDEX Indice2 ON articulo (nombre);


--APARTADO D
CREATE ROLE cliente;
CREATE ROLE empleados;
CREATE ROLE directores;
CREATE ROLE administradores;

GRANT CREATE SESSION TO cliente;
GRANT CREATE SESSION TO empleados;
GRANT CREATE SESSION TO directores;
GRANT CREATE SESSION TO administradores;

GRANT SELECT  ON articulo TO cliente;
GRANT SELECT  ON pedido TO cliente;
GRANT SELECT  ON cliente TO cliente;

GRANT SELECT ON departamento TO empleados;
GRANT SELECT ON articulo TO empleados;
GRANT SELECT ON proveedor TO empleados;
GRANT SELECT ON cliente TO empleados;

GRANT SELECT ON departamento TO directores;
GRANT SELECT ON articulo TO directores;
GRANT SELECT ON proveedor TO directores;
GRANT SELECT ON cliente TO directores;
grant alter, delete, insert on departamento to directores;

GRANT all privileges to administradores;


GRANT DELETE ON departamento TO directores;
GRANT DELETE ON articulo TO directores;
GRANT DELETE ON proveedor TO directores;
GRANT DELETE ON cliente TO directores;
--APARTADO E
DROP INDEX indice1;
DROP INDEX indice2;


DROP TABLE pedido;
DROP TABLE cliente;
DROP TABLE articulo;
DROP TABLE proveedor;
DROP TABLE articulopedido;
DROP TABLE articuloproveedor;
DROP TABLE departamento;
DROP TABLE empleado;


DROP ROLE cliente;
DROP ROLE empleados;
DROP ROLE directores;
DROP ROLE administradores;














create index nombre on tabla (columnas)



create role 121231231
grant create sesion to 121231231
drop table nombre
drop index nombre
drop role 121231231

