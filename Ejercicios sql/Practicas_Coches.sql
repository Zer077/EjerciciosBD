--Esquema de coches y concesionarios

CREATE TABLE marcas (
    cifm NUMBER(4),
    nombre VARCHAR2(15),
    ciudad VARCHAR2(15),
    PRIMARY KEY(cifm)
);

CREATE TABLE clientes (
    dni NUMBER(4),
    nombre VARCHAR2(15),
    apellido VARCHAR2(15),
    ciudad VARCHAR2(15),
    PRIMARY KEY(dni)
);

CREATE TABLE coches (
    codcoche NUMBER(4),
    nombre VARCHAR2(15),
    modelo VARCHAR2(15),
    PRIMARY KEY(codcoche)
);

CREATE TABLE concesionarios (
    cifc NUMBER(4),
    nombre VARCHAR2(15),
    ciudad VARCHAR2(15),
    PRIMARY KEY (cifc)
);

CREATE TABLE ventas (
    cifc NUMBER(4),
    dni NUMBER(4),
    codcoche NUMBER(4),
    color VARCHAR2(15),
    PRIMARY KEY(cifc,dni,codcoche),
    FOREIGN KEY (cifc) REFERENCES concesionarios(cifc),
    FOREIGN KEY (dni) REFERENCES clientes(dni),
    FOREIGN KEY (codcoche) REFERENCES coches(codcoche)
);

CREATE TABLE distribucion (
    cifc NUMBER(4),
    codcoche NUMBER(4),
    cantidad NUMBER(4),
    PRIMARY KEY(cifc, codcoche),
    FOREIGN KEY (cifc) REFERENCES concesionarios(cifc),
    FOREIGN KEY (codcoche) REFERENCES coches(codcoche)
);

CREATE TABLE marco (
    cifm NUMBER(4),
    codcoche NUMBER(4),
    PRIMARY KEY (cifm,codcoche),
    FOREIGN KEY (cifm) REFERENCES marcas(cifm),
    FOREIGN KEY (codcoche) REFERENCES coches(codcoche)
);

INSERT INTO marcas (cifm, nombre, ciudad) VALUES (1, 'seat', 'Madrid');
INSERT INTO marcas (cifm, nombre, ciudad) VALUES (2, 'renault', 'Barcelona');
INSERT INTO marcas (cifm, nombre, ciudad) VALUES (3, 'citroen', 'Valencia');
INSERT INTO marcas (cifm, nombre, ciudad) VALUES (4, 'audi', 'Madrid');
INSERT INTO marcas (cifm, nombre, ciudad) VALUES (5, 'opel', 'Bilbao');
INSERT INTO marcas (cifm, nombre, ciudad) VALUES (6, 'bmw', 'Barcelona');

INSERT INTO clientes (dni, nombre, apellido, ciudad) VALUES (1, 'Luis', 'García', 'Madrid');
INSERT INTO clientes (dni, nombre, apellido, ciudad) VALUES (2, 'Antonio', 'López', 'Valencia');
INSERT INTO clientes (dni, nombre, apellido, ciudad) VALUES (3, 'Juan', 'Martín', 'Madrid');
INSERT INTO clientes (dni, nombre, apellido, ciudad) VALUES (4, 'María', 'García', 'Madrid');
INSERT INTO clientes (dni, nombre, apellido, ciudad) VALUES (5, 'Javier', 'González', 'Barcelona');
INSERT INTO clientes (dni, nombre, apellido, ciudad) VALUES (6, 'Ana', 'López', 'Barcelona');

INSERT INTO concesionarios (cifc, nombre, ciudad) VALUES (1, 'acar', 'Madrid');
INSERT INTO concesionarios (cifc, nombre, ciudad) VALUES (2, 'bcar', 'Madrid');
INSERT INTO concesionarios (cifc, nombre, ciudad) VALUES (3, 'ccar', 'Barcelona');
INSERT INTO concesionarios (cifc, nombre, ciudad) VALUES (4, 'dcar', 'Valencia');
INSERT INTO concesionarios (cifc, nombre, ciudad) VALUES (5, 'ecar', 'Bilbao');

INSERT INTO coches (codcoche, nombre, modelo) VALUES (1, 'ibiza', 'glx');
INSERT INTO coches (codcoche, nombre, modelo) VALUES (2, 'ibiza', 'gti');
INSERT INTO coches (codcoche, nombre, modelo) VALUES (3, 'ibiza', 'gtd');
INSERT INTO coches (codcoche, nombre, modelo) VALUES (4, 'toledo', 'gtd');
INSERT INTO coches (codcoche, nombre, modelo) VALUES (5, 'cordoba', 'gti');
INSERT INTO coches (codcoche, nombre, modelo) VALUES (6, 'megane', '1.6');
INSERT INTO coches (codcoche, nombre, modelo) VALUES (7, 'megane', 'gti');
INSERT INTO coches (codcoche, nombre, modelo) VALUES (8, 'laguna', 'gtd');
INSERT INTO coches (codcoche, nombre, modelo) VALUES (9, 'laguna', 'td');
INSERT INTO coches (codcoche, nombre, modelo) VALUES (10, 'zx', '16v');
INSERT INTO coches (codcoche, nombre, modelo) VALUES (11, 'zx', 'td');
INSERT INTO coches (codcoche, nombre, modelo) VALUES (12, 'xantia', 'gtd');
INSERT INTO coches (codcoche, nombre, modelo) VALUES (13, 'a4', '1.8');
INSERT INTO coches (codcoche, nombre, modelo) VALUES (14, 'a4', '2.8');
INSERT INTO coches (codcoche, nombre, modelo) VALUES (15, 'astra', 'caravan');
INSERT INTO coches (codcoche, nombre, modelo) VALUES (16, 'astra', 'gti');
INSERT INTO coches (codcoche, nombre, modelo) VALUES (17, 'corsa', '1.4');
INSERT INTO coches (codcoche, nombre, modelo) VALUES (18, '300', '316i');
INSERT INTO coches (codcoche, nombre, modelo) VALUES (19, '500', '525i');
INSERT INTO coches (codcoche, nombre, modelo) VALUES (20, '700', '750i');

INSERT INTO ventas (cifc, dni, codcoche, color) VALUES (1, 1, 1, 'blanco');
INSERT INTO ventas (cifc, dni, codcoche, color) VALUES (1, 2, 5, 'rojo');
INSERT INTO ventas (cifc, dni, codcoche, color) VALUES (2, 3, 8, 'blanco');
INSERT INTO ventas (cifc, dni, codcoche, color) VALUES (2, 1, 6, 'rojo');
INSERT INTO ventas (cifc, dni, codcoche, color) VALUES (3, 4, 11, 'rojo');
INSERT INTO ventas (cifc, dni, codcoche, color) VALUES (4, 5, 14, 'verde');

INSERT INTO marco (cifm, codcoche) VALUES (1, 1);
INSERT INTO marco (cifm, codcoche) VALUES (1, 2);
INSERT INTO marco (cifm, codcoche) VALUES (1, 3);
INSERT INTO marco (cifm, codcoche) VALUES (1, 4);
INSERT INTO marco (cifm, codcoche) VALUES (1, 5);
INSERT INTO marco (cifm, codcoche) VALUES (2, 6);
INSERT INTO marco (cifm, codcoche) VALUES (2, 7);
INSERT INTO marco (cifm, codcoche) VALUES (2, 8);
INSERT INTO marco (cifm, codcoche) VALUES (2, 9);
INSERT INTO marco (cifm, codcoche) VALUES (3, 10);
INSERT INTO marco (cifm, codcoche) VALUES (3, 11);
INSERT INTO marco (cifm, codcoche) VALUES (3, 12);
INSERT INTO marco (cifm, codcoche) VALUES (4, 13);
INSERT INTO marco (cifm, codcoche) VALUES (4, 14);
INSERT INTO marco (cifm, codcoche) VALUES (5, 15);
INSERT INTO marco (cifm, codcoche) VALUES (5, 16);
INSERT INTO marco (cifm, codcoche) VALUES (5, 17);
INSERT INTO marco (cifm, codcoche) VALUES (6, 18);
INSERT INTO marco (cifm, codcoche) VALUES (6, 19);
INSERT INTO marco (cifm, codcoche) VALUES (6, 20);

INSERT INTO distribucion (cifc, codcoche, cantidad) VALUES (1, 1, 3);
INSERT INTO distribucion (cifc, codcoche, cantidad) VALUES (1, 5, 7);
INSERT INTO distribucion (cifc, codcoche, cantidad) VALUES (1, 6, 7);
INSERT INTO distribucion (cifc, codcoche, cantidad) VALUES (2, 6, 5);
INSERT INTO distribucion (cifc, codcoche, cantidad) VALUES (2, 8, 10);
INSERT INTO distribucion (cifc, codcoche, cantidad) VALUES (2, 9, 10);
INSERT INTO distribucion (cifc, codcoche, cantidad) VALUES (3, 10, 5);
INSERT INTO distribucion (cifc, codcoche, cantidad) VALUES (3, 11, 3);
INSERT INTO distribucion (cifc, codcoche, cantidad) VALUES (3, 12, 5);
INSERT INTO distribucion (cifc, codcoche, cantidad) VALUES (4, 13, 10);
INSERT INTO distribucion (cifc, codcoche, cantidad) VALUES (4, 14, 5);
INSERT INTO distribucion (cifc, codcoche, cantidad) VALUES (5, 15, 10);
INSERT INTO distribucion (cifc, codcoche, cantidad) VALUES (5, 16, 20);
INSERT INTO distribucion (cifc, codcoche, cantidad) VALUES (5, 17, 8);

COMMIT;

DROP TABLE marco;
DROP TABLE distribucion;
DROP TABLE ventas;
DROP TABLE concesionarios;
DROP TABLE coches;
DROP TABLE clientes;
DROP TABLE marcas;

SELECT * FROM marcas WHERE UPPER(ciudad)='MADRID' ORDER BY cifm DESC;
SELECT DISTINCT ciudad FROM clientes;
SELECT NOMBRE FROM marcas WHERE ciudad IN ('Madrid', 'Valencia');
SELECT SYSDATE FROM DUAL;
SELECT cantidad*10 FROM distribucion WHERE CIFC=1 AND CODCOCHE=5;
SELECT nombre FROM marcas WHERE ciudad IN ('Madrid', 'Valencia');
SELECT dni, nombre||' '||apellido AS "Nombre completo" FROM cliente WHERE dni NOT BETWEEN 3 AND 5;
SELECT co.nombre
    FROM coches.co 
