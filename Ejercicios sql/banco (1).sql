DROP TABLE MOVIMIENTO;
DROP TABLE TIPO_MOVIMIENTO;
DROP TABLE CUENTA;
DROP TABLE SUCURSAL;
DROP TABLE CLIENTE;


CREATE TABLE CLIENTE(
  COD_CLIENTE VARCHAR(20) CONSTRAINT PK_CLIENTE PRIMARY KEY,
  APELLIDOS VARCHAR(50) NOT NULL,
  NOMBRE VARCHAR (30) NOT NULL,
  DIRECCION VARCHAR (50) NOT NULL
);

CREATE TABLE SUCURSAL(
  COD_SUCURSAL NUMBER(6) CONSTRAINT PK_SUCURSAL PRIMARY KEY,
  DIRECCION VARCHAR (50) NOT NULL,
  CAPITAL_ANIO_ANTERIOR NUMBER(14,2)
);

CREATE TABLE TIPO_MOVIMIENTO(
  COD_TIPO_MOVIMIENTO VARCHAR(6) CONSTRAINT PK_TIPO_MOVIMIENTO PRIMARY KEY,
  DESCRIPCION VARCHAR(200),
  SALIDA VARCHAR(3) CHECK(SALIDA='S�' OR SALIDA='No'));

CREATE TABLE CUENTA(
  COD_CUENTA NUMBER(10) CONSTRAINT PK_CUENTA PRIMARY KEY,
  SALDO NUMBER (10,2) NOT NULL,
  INTERES NUMBER (5,4) NOT NULL CHECK (INTERES < 1),
  COD_CLIENTE VARCHAR(20),
  COD_SUCURSAL NUMBER(6),
 CONSTRAINT FK_CUENTA_CLIENTE FOREIGN KEY (COD_CLIENTE) REFERENCES CLIENTE (COD_CLIENTE),
  CONSTRAINT FK_CUENTA_SUCURSAL FOREIGN KEY (COD_SUCURSAL) REFERENCES SUCURSAL (COD_SUCURSAL) 
);

CREATE TABLE MOVIMIENTO(
  COD_CUENTA NUMBER(10),
  MES NUMBER (2) CHECK (MES >= 1 AND MES <= 12),
  NUM_MOV_MES NUMBER(6),
  IMPORTE NUMBER(12,2) NOT NULL,
  FECHA_HORA TIMESTAMP NOT NULL,
  COD_TIPO_MOVIMIENTO VARCHAR(6),
  CONSTRAINT PK_MOVIMIENTO PRIMARY KEY(COD_CUENTA, MES, NUM_MOV_MES),
  CONSTRAINT FK_MOVIMIENTO_CUENTA FOREIGN KEY (COD_CUENTA) REFERENCES CUENTA(COD_CUENTA) ON DELETE CASCADE,
  CONSTRAINT FK_MOVIMIENTO_TIPO_MOVIMIENTO FOREIGN KEY (COD_TIPO_MOVIMIENTO) REFERENCES  TIPO_MOVIMIENTO (COD_TIPO_MOVIMIENTO) 
);
  
INSERT INTO CLIENTE (cod_cliente, apellidos, nombre, direccion) VALUES ('ARUBIO', 'Rubio Caballero', 'Ana', 'C/ Col�n, 10');
INSERT INTO CLIENTE (cod_cliente, apellidos, nombre, direccion ) VALUES ('ASOTILLO', 'Sotillo Roda', '�ngeles', 'C/ Donoso Cort�s, 1');
INSERT INTO CLIENTE (cod_cliente, apellidos, nombre, direccion ) VALUES ('CALONSO', 'Alonso Cordero', 'Carlos', 'Ctra. De la Playa, 67');
INSERT INTO CLIENTE (cod_cliente, apellidos, nombre, direccion ) VALUES ('CLUENGO', 'Luengo G�mez', 'Cristina', 'C/ Lepanto, 17');
INSERT INTO CLIENTE (cod_cliente, apellidos, nombre, direccion ) VALUES ('EPEREZ', 'P�rez Honda', 'Eusebio', 'Paseo Castellana, 230');
INSERT INTO CLIENTE (cod_cliente, apellidos, nombre, direccion ) VALUES ('FSANTOS', 'Santos P�rez', 'Fernando', 'Avda. Juan Carlos I, 10');
INSERT INTO CLIENTE (cod_cliente, apellidos, nombre, direccion) VALUES ('IBUADES', 'Buades Avaro', 'Ignacio', 'Avda. San Antonio, 4');
INSERT INTO CLIENTE (cod_cliente, apellidos, nombre, direccion ) VALUES ('JALONSO', 'Alonso Alfaro', 'Jer�nimo', 'Avda. Santa Marina, 31');
INSERT INTO CLIENTE (cod_cliente, apellidos, nombre, direccion ) VALUES ('JARANAZ', 'Aranaz Rodr�guez', 'Juan Luis', 'C/ Virgen del ?guila, 8');
INSERT INTO CLIENTE (cod_cliente, apellidos, nombre, direccion ) VALUES ('JBECERRA', 'Becerra S�nchez', 'Jos�', 'C/ Col�n, 10');
INSERT INTO CLIENTE (cod_cliente, apellidos, nombre, direccion ) VALUES ('JGOMEZ', 'G�mez Trillar', 'Joaqu�n', 'C/ Donoso Cort�s, 1');
INSERT INTO CLIENTE (cod_cliente, apellidos, nombre, direccion ) VALUES ('JMARTINEZ', 'Mart�nez Moraes', 'Juan', 'Ctra. De la Playa, 67');
INSERT INTO CLIENTE (cod_cliente, apellidos, nombre, direccion) VALUES ('JSALINAS', 'Salinas del Mar', 'Javier', 'C/ Lepanto, 17');
INSERT INTO CLIENTE (cod_cliente, apellidos, nombre, direccion ) VALUES ('JSANTOS', 'Santos P�rez', 'Jaime', 'Paseo Castellana, 230');
INSERT INTO CLIENTE (cod_cliente, apellidos, nombre, direccion ) VALUES ('MCARDO', 'Cardo Merita', 'Mar�a', 'Avda. Juan Carlos I, 10');
INSERT INTO CLIENTE (cod_cliente, apellidos, nombre, direccion ) VALUES ('MFRANCO', 'Franco Alonso', 'Mar�a', 'Avda. San Antonio, 4');
INSERT INTO CLIENTE (cod_cliente, apellidos, nombre, direccion ) VALUES ('MGUTIERREZ', 'Guti�rrez Carro', 'Mar�a', 'Avda. Santa Marina, 31');
INSERT INTO CLIENTE (cod_cliente, apellidos, nombre, direccion ) VALUES ('OLUENGO', 'Luengo Casta�o', 'Ofelia', 'C/ Virgen del �guila, 8');
INSERT INTO CLIENTE (cod_cliente, apellidos, nombre, direccion) VALUES ('PALVAREZ', '�lvarez Morr�n', 'Paloma', 'C/ Virgen del �guila, 8');

INSERT INTO SUCURSAL (cod_sucursal, direccion, capital_anio_anterior ) VALUES (1, 'Avda. Juan Carlos I, 10', 120347);
INSERT INTO SUCURSAL (cod_sucursal, direccion, capital_anio_anterior ) VALUES (2, 'Paseo Castellana, 230', 259089);
INSERT INTO SUCURSAL (cod_sucursal, direccion, capital_anio_anterior ) VALUES (3, 'Ctra. De la Playa, 67', 100786);
INSERT INTO SUCURSAL (cod_sucursal, direccion, capital_anio_anterior ) VALUES (4, 'C/ Lepanto, 17', 70531);
INSERT INTO SUCURSAL (cod_sucursal, direccion, capital_anio_anterior ) VALUES (5, 'C / Juan de la Cosa', 500000);

INSERT INTO TIPO_MOVIMIENTO (cod_tipo_movimiento, descripcion, salida ) VALUES ('IE', 'Ingreso en efectivo', 'No');
INSERT INTO TIPO_MOVIMIENTO (cod_tipo_movimiento, descripcion, salida ) VALUES ('PR', 'Pago de recibo', 'S�');
INSERT INTO TIPO_MOVIMIENTO (cod_tipo_movimiento, descripcion, salida ) VALUES ('PT', 'Pago con tarjeta', 'S�');
INSERT INTO TIPO_MOVIMIENTO (cod_tipo_movimiento, descripcion, salida ) VALUES ('RC', 'Retirada por cajero autom�tico', 'S�');
INSERT INTO TIPO_MOVIMIENTO (cod_tipo_movimiento, descripcion, salida ) VALUES ('TR-E', 'Transferencia-Entrada', 'No');
INSERT INTO TIPO_MOVIMIENTO (cod_tipo_movimiento, descripcion, salida ) VALUES ('TR-S', 'Transferencia-Salida', 'S�' );

INSERT INTO CUENTA (cod_cuenta, cod_cliente, saldo, interes, cod_sucursal) VALUES (121229, 'EPEREZ', 12300, 0.12, '1');

INSERT INTO CUENTA (cod_cuenta, cod_cliente, saldo, interes, cod_sucursal) VALUES (121221, 'EPEREZ', 12300, 0.12, 1);
INSERT INTO CUENTA (cod_cuenta, cod_cliente, saldo, interes, cod_sucursal) VALUES (121222, 'CLUENGO', 3690, 0.03, 4);
INSERT INTO CUENTA (cod_cuenta, cod_cliente, saldo, interes, cod_sucursal) VALUES (121231, 'ASOTILLO', 31980, 0.06, 2);
INSERT INTO CUENTA (cod_cuenta, cod_cliente, saldo, interes, cod_sucursal) VALUES (121236, 'ARUBIO', 36900, 0.05, 1);
INSERT INTO CUENTA (cod_cuenta, cod_cliente, saldo, interes, cod_sucursal) VALUES (121237, 'CALONSO', 12300, 0.07, 3);
INSERT INTO CUENTA (cod_cuenta, cod_cliente, saldo, interes, cod_sucursal) VALUES (121255, 'EPEREZ', 36900, 0.01, 3);
INSERT INTO CUENTA (cod_cuenta, cod_cliente, saldo, interes, cod_sucursal) VALUES (121574, 'JBECERRA', 184500, 0.1, 2);
INSERT INTO CUENTA (cod_cuenta, cod_cliente, saldo, interes, cod_sucursal) VALUES (124334, 'IBUADES', 15375, 0.01, 3);
INSERT INTO CUENTA (cod_cuenta, cod_cliente, saldo, interes, cod_sucursal) VALUES (131274, 'EPEREZ', 14760, 0.11, 1);
INSERT INTO CUENTA (cod_cuenta, cod_cliente, saldo, interes, cod_sucursal) VALUES (156234, 'JALONSO', 4920, 0.03, 4);
INSERT INTO CUENTA (cod_cuenta, cod_cliente, saldo, interes, cod_sucursal) VALUES (185964, 'EPEREZ', 36900, 0.025, 4);
INSERT INTO CUENTA (cod_cuenta, cod_cliente, saldo, interes, cod_sucursal) VALUES (199234, 'FSANTOS', 49200, 0.11, 2);
INSERT INTO CUENTA (cod_cuenta, cod_cliente, saldo, interes, cod_sucursal) VALUES (331234, 'FSANTOS', 15375, 0.01, 2);
INSERT INTO CUENTA (cod_cuenta, cod_cliente, saldo, interes, cod_sucursal) VALUES (881234, 'ASOTILLO', 7380, 0.031, 4);
INSERT INTO CUENTA (cod_cuenta, cod_cliente, saldo, interes, cod_sucursal) VALUES (921234, 'FSANTOS', 29520, 0.2, 3);
INSERT INTO CUENTA (cod_cuenta, cod_cliente, saldo, interes, cod_sucursal) VALUES (961234, 'JARANAZ', 73800, 0.014, 1);

INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121221, 1, 1, 'IE', 120, TO_TIMESTAMP('23/1/2007 16:33:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121221, 1, 2, 'TR-S', 300, TO_TIMESTAMP('30/1/2007 22:00:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121221, 1, 3, 'RC', 300, TO_TIMESTAMP('23/1/2007 21:05:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121221, 1, 4, 'PT', 1500, TO_TIMESTAMP('22/1/2007 14:55:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121221, 1, 5, 'IE', 600, TO_TIMESTAMP('21/1/2007 12:43:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121221, 1, 6, 'IE', 40, TO_TIMESTAMP('20/1/2007 23:30:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121221, 1, 7, 'TR-S', 125, TO_TIMESTAMP('1/1/2007 22:14:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121221, 1, 8, 'RC', 125, TO_TIMESTAMP('13/1/2007 16:33:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121221, 1, 9, 'PT', 100, TO_TIMESTAMP('12/1/2007 22:00:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121221, 1, 10, 'IE', 240, TO_TIMESTAMP('12/1/2007 23:30:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121221, 1, 11, 'TR-S', 400, TO_TIMESTAMP('11/1/2007 22:14:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121221, 2, 1, 'TR-S', 125, TO_TIMESTAMP('1/2/2007 22:14:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121221, 2, 2, 'RC', 125, TO_TIMESTAMP('13/2/2007 16:33:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121221, 2, 3, 'PT', 100, TO_TIMESTAMP('12/2/2007 22:00:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121221, 2, 4, 'TR-S', 400, TO_TIMESTAMP('2/2/2007 14:55:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121221, 2, 5, 'RC', 60, TO_TIMESTAMP('13/2/2007 12:43:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121231, 1, 1, 'PR', 300, TO_TIMESTAMP('1/1/2007 12:45:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121231, 1, 2, 'IE', 30, TO_TIMESTAMP('11/1/2007 21:05:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121231, 2, 1, 'RC', 260, TO_TIMESTAMP('2/2/2007 13:20:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121231, 2, 2, 'PT', 100, TO_TIMESTAMP('12/2/2007 22:00:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121231, 2, 3, 'TR-S', 125, TO_TIMESTAMP('1/2/2007 22:14:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121231, 2, 4, 'IE', 40, TO_TIMESTAMP('20/2/2007 23:30:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121231, 3, 1, 'TR-S', 100, TO_TIMESTAMP('3/3/2007 14:15:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121231, 3, 2, 'RC', 125, TO_TIMESTAMP('13/3/2007 16:33:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121236, 1, 1, 'IE', 600, TO_TIMESTAMP('21/1/2007 12:43:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121236, 1, 2, 'TR-S', 300, TO_TIMESTAMP('30/1/2007 22:00:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121236, 2, 1, 'PT', 1500, TO_TIMESTAMP('22/2/2007 14:55:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121236, 2, 2, 'IE', 120, TO_TIMESTAMP('23/2/2007 16:33:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121236, 2, 3, 'IE', 240, TO_TIMESTAMP('12/2/2007 23:30:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121236, 2, 4, 'RC', 60, TO_TIMESTAMP('13/2/2007 12:43:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121236, 3, 1, 'RC', 300, TO_TIMESTAMP('23/3/2007 21:05:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121236, 3, 2, 'TR-S', 400, TO_TIMESTAMP('11/3/2007 22:14:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121574, 2, 1, 'TR-S', 125, TO_TIMESTAMP('1/2/2007 22:14:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121574, 2, 2, 'RC', 125, TO_TIMESTAMP('13/2/2007 16:33:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121574, 2, 3, 'PT', 100, TO_TIMESTAMP('12/2/2007 22:00:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121574, 2, 4, 'TR-S', 400, TO_TIMESTAMP('2/2/2007 14:55:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121574, 3, 1, 'RC', 60, TO_TIMESTAMP('13/3/2007 12:43:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121574, 3, 2, 'IE', 240, TO_TIMESTAMP('12/3/2007 23:30:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121574, 3, 3, 'TR-S', 400, TO_TIMESTAMP('11/3/2007 22:14:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121574, 3, 4, 'IE', 120, TO_TIMESTAMP('23/3/2007 16:33:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121574, 3, 5, 'TR-S', 300, TO_TIMESTAMP('30/3/2007 22:00:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121574, 3, 6, 'RC', 300, TO_TIMESTAMP('23/3/2007 21:05:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121574, 3, 7, 'PT', 1500, TO_TIMESTAMP('22/3/2007 14:55:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121574, 3, 8, 'IE', 600, TO_TIMESTAMP('21/3/2007 12:43:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (121574, 3, 9, 'IE', 40, TO_TIMESTAMP('20/3/2007 23:30:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (156234, 1, 1, 'RC', 300, TO_TIMESTAMP('23/1/2007 21:05:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (156234, 1, 2, 'PT', 1500, TO_TIMESTAMP('22/1/2007 14:55:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (156234, 1, 3, 'IE', 600, TO_TIMESTAMP('21/1/2007 12:43:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (156234, 1, 4, 'IE', 40, TO_TIMESTAMP('20/1/2007 23:30:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (156234, 1, 5, 'TR-S', 125, TO_TIMESTAMP('1/1/2007 22:14:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (156234, 1, 6, 'RC', 125, TO_TIMESTAMP('13/1/2007 16:33:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (156234, 2, 1, 'RC', 125, TO_TIMESTAMP('13/2/2007 16:33:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (156234, 2, 2, 'PT', 100, TO_TIMESTAMP('12/2/2007 22:00:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (156234, 2, 3, 'TR-S', 400, TO_TIMESTAMP('2/2/2007 14:55:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (156234, 2, 4, 'RC', 60, TO_TIMESTAMP('13/2/2007 12:43:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (156234, 2, 5, 'IE', 240, TO_TIMESTAMP('12/2/2007 23:30:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (156234, 2, 6, 'TR-S', 400, TO_TIMESTAMP('11/2/2007 22:14:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (156234, 2, 7, 'IE', 120, TO_TIMESTAMP('23/2/2007 16:33:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (156234, 2, 8, 'TR-S', 300, TO_TIMESTAMP('28/2/2007 22:00:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (156234, 3, 1, 'IE', 120, TO_TIMESTAMP('23/3/2007 16:33:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (156234, 3, 2, 'TR-S', 300, TO_TIMESTAMP('30/3/2007 22:00:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (156234, 3, 3, 'IE', 40, TO_TIMESTAMP('20/3/2007 23:30:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (156234, 3, 4, 'TR-S', 125, TO_TIMESTAMP('1/3/2007 22:14:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (881234, 1, 1, 'TR-S', 400, TO_TIMESTAMP('2/1/2007 14:55:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (881234, 1, 2, 'TR-S', 150, TO_TIMESTAMP('11/1/2007 13:20:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (881234, 3, 1, 'IE', 100, TO_TIMESTAMP('3/3/2007 12:45:00', 'DD/MM/YYYY HH24:MI:SS'));
INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES (881234, 3, 2, 'IE', 300, TO_TIMESTAMP('12/3/2007 14:15:00', 'DD/MM/YYYY HH24:MI:SS'));



INSERT INTO MOVIMIENTO (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora)  VALUES (121221, 2, 6, 'PT', 100, TO_TIMESTAMP('15/02/2007 13:45:02', 'DD/MM/YYYY HH24:MI:SS'));



COMMIT;

<--1-->
SELECT ROUND(AVG(c.saldo),2)as saldo_medio, sum(c.saldo)as suma_saldo
FROM cuenta c;

<--2-->
SELECT MAX(saldo), MIN(saldo), AVG(saldo)
FROM cuenta;

<--3-->
SELECT c.cod_sucursal, SUM(C.SALDO), AVG(c.SALDO)
FROM cuenta c
Group by c.cod_sucursal;



<--4-->
SELECT c.cod_cliente, SUM(cu.SALDO), COUNT(cu.COD_CUENTA)
FROM cliente c, cuenta cu
where c.cod_cliente=cu.cod_cliente
GROUP BY c.cod_cliente;

SELECT cli.cod_cliente, SUM(c.saldo), count(c.cod_cuenta)
FROM cliente cli
INNER JOIN cuenta c ON c.cod_cliente=cli.cod_cliente
GROUP BY cli.cod_cliente;

<--5-->
SELECT c.cod_cliente, SUM(cu.SALDO), COUNT(cu.COD_CUENTA), c.nombre, c.apellidos
FROM cliente c, cuenta cu
where C.cod_cliente=cu.cod_cliente
GROUP BY c.cod_cliente,c.nombre, c.apellidos;


<--6-->
SELECT  s.direccion, COUNT(cu.COD_CUENTA), SUM(cu.SALDO)
FROM SUCURSAL s, cuenta cu
WHERE s.cod_sucursal=cu.cod_sucursal
GROUP by  s.direccion;



<--7-->
 SELECT avg(saldo), avg(interes)
 FROM  cuenta
 WHERE (INTERES>0.1 AND (COD_SUCURSAL=1 OR COD_SUCURSAL=2));
<--8-->
SELECT c.cod_tipo_movimiento, descripcion, sum(importe)
FROM movimiento s, tipo_movimiento c 
WHERE (c.cod_tipo_movimiento=s.cod_tipo_movimiento)
GROUP BY c.cod_tipo_movimiento, descripcion;
<--9-->
SELECT COUNT(c.cod_cliente)
FROM cliente c, tipo_movimiento t, cuenta cu, movimiento m
WHERE (cu.cod_cliente=c.cod_cliente AND m.cod_tipo_movimiento=t.cod_tipo_movimiento AND m.cod_cuenta=cu.cod_cuenta AND t.descripcion='Retirada  por cajero autm�tico');

SELECT c.nombre, AVG(m.importe)
FROM movimiento m, tipo_movimiento t, cliente c, cuenta cu
where T.DESCRIPCION='Retirada por cajero autom�tico'
AND m.cod_tipo_movimiento=t.cod_tipo_movimiento
AND m.cod_cuenta=cu.cod_cuenta
aND cu.cod_cliente=c.cod_cliente
GROUP BY c.nombre;



<--10-->
SELECT SUM(m.importe)|| '�', m.cod_tipo_movimiento
FROM movimiento m, tipo_movimiento tm
Where ((tm.SALIDA='S�') AND (M.COD_TIPO_MOVIMIENTO=TM.COD_TIPO_MOVIMIENTO))
group by m.cod_tipo_movimiento;

<--11-->
SELECT tm.descripcion, SUM(m.importe), m.cod_tipo_movimiento, c.cod_cuenta
FROM Tipo_movimiento tm, movimiento m, cuenta c
WHERE (tm.SALIDA='No')AND (M.COD_TIPO_MOVIMIENTO=TM.COD_TIPO_MOVIMIENTO) AND c.cod_cuenta=m.cod_cuenta
group by m.cod_tipo_movimiento, tm.descripcion, c.cod_cuenta;
<--12-->
SELECT sum(m.importe)
FROM SUCURSAL S, movimiento m, cuenta c,tipo_movimiento t
WHERE t.salida='S�' AND s.direccion='Paseo Castellana%' and c.cod_cuenta=m.cod_cuenta and c.cod_sucursal=s.cod_sucursal and m.cod_tipo_movimiento=t.cod_tipo_movimiento;
<--13-->
SELECT DISTINCT apellidos, nombre, m.cod_cuenta, tm1.descripcion, 
(SELECT SUM(m.IMPORTE)
FROM Tipo_movimiento tm, movimiento m 
WHERE (tm.SALIDA='S�')AND (M.COD_TIPO_MOVIMIENTO=TM.COD_TIPO_MOVIMIENTO)),
(SELECT SUM(m.IMPORTE)
FROM Tipo_movimiento tm, movimiento m 
WHERE (tm.SALIDA='No')AND (M.COD_TIPO_MOVIMIENTO=TM.COD_TIPO_MOVIMIENTO))
FROM cliente c, tipo_movimiento tm1, movimiento m, cuenta cu
where cu.cod_cuenta=m.cod_cuenta and M.COD_TIPO_MOVIMIENTO=TM1.COD_TIPO_MOVIMIENTO and c.cod_cliente= cu.cod_cliente;
<--14-->
SELECT count(C.COD_CUENTA)
FROM cuenta c
WHERE c.cod_cuenta NOT IN (SELECT m.cod_cuenta FROM movimiento m);

<--15-->
SELECT  c.cod_cliente, count(c.cod_cuenta) AS "Cuenta sin movimiento"
FROM cuenta c
WHERE c.cod_cuenta NOT IN (SELECT cod_cuenta from movimiento)
group by c.cod_cliente;
<--16-->
SELECT cu.cod_cliente, sum(cu.saldo) as "total", count(cu.cod_cuenta) as "cuenta"
FROM cuenta cu
group by cu.cod_cliente
HAVING  sum(cu.saldo)>3500;
<--17-->
SELECT c.apellidos, c.nombre, COUNT(cu.cod_cuenta)
FROM cliente c, cuenta cu
WHERE (Select count(cu1.cod_cuenta) from cuenta cu1)>2 AND c.cod_cliente=cu.cod_cliente
GROUP BY c.apellidos, c.nombre;
HAVING 
<--18-->
SELECT s.cod_sucursal,s.direccion,s.CAPITAL_ANIO_ANTERIOR, SUM(c.saldo)
FROM sucursal s, cuenta c
WHERE (Select SUM(c2.saldo) from cuenta c2 where c2.cod_sucursal=s.cod_sucursal)>s.CAPITAL_ANIO_ANTERIOR
AND s.cod_sucursal=c.cod_sucursal
Group by s.cod_sucursal,s.CAPITAL_ANIO_ANTERIOR, s.direccion
Order by S.COD_SUCURSAL;

<--19-->
SELECT c.cod_cuenta, c.saldo, tm.descripcion, sum(m.importe)
FROM  cuenta c, tipo_movimiento tm, movimiento m 
WHERE  m.cod_tipo_movimiento=tm.cod_tipo_movimiento and c.cod_cuenta=m.cod_cuenta
GROUP BY c.cod_cuenta, c.saldo, tm.descripcion
HAVING SUM(importe)>saldo*0.2;
<--20-->
SELECT s.cod_sucursal, c.saldo, tm.descripcion, sum(m.importe)
FROM sucursal s, cuenta c, tipo_movimiento tm, movimiento m 
WHERE s.cod_sucursal=c.cod_sucursal and m.cod_tipo_movimiento=tm.cod_tipo_movimiento and c.cod_cuenta=m.cod_cuenta AND s.cod_sucursal<>4
GROUP BY s.cod_sucursal, c.saldo, tm.descripcion
HAVING SUM(importe)>saldo*0.1;

<--21-->
SELECT DISTINCT c.nombre, c.apellidos
FROM cliente c, cuenta cu, sucursal s
WHERE c.cod_cliente=cu.cod_cliente and cu.cod_sucursal=s.cod_sucursal
GROUP BY c.nombre, c.apellidos, S.CAPITAL_ANIO_ANTERIOR
having sum(cu.saldo)>0.2*s.CAPITAL_ANIO_ANTERIOR;



/**boletin 4**/


<--1-->
SELECT c.nombre, c.apellidos, s.direccion
FROM cliente c, sucursal s,  cuenta cu
WHERE c.cod_cliente=cu.cod_cliente and s.cod_sucursal=cu.cod_sucursal and s.direccion like'%Lepanto%'
UNION
SELECT c.nombre, c.apellidos, c.direccion
FROM cliente c, sucursal s,  cuenta cu
WHERE c.cod_cliente=cu.cod_cliente and s.cod_sucursal=cu.cod_sucursal and c.direccion like'Avda%';

<--2-->
SELECT tm.cod_tipo_movimiento, tm.descripcion
FROM tipo_movimiento tm, sucursal s
WHERE s.direccion like '%Paseo Castellana%';



<--3-->
SELECT c.nombre, c.apellidos, nvl(cu.saldo,0),nvl(cu.cod_cuenta,0)
FROM cuenta cu, cliente c
WHERE c.cod_cliente=cu.cod_cliente(+);

<--4-->
SELECT s.cod_sucursal, s.direccion, count (c.cod_cuenta)

<--5-->


<--6-->







/*1.*/

INSERT INTO CLIENTE (cod_cliente, apellidos, nombre, direccion) VALUES ('FJUAREZ', 'Fernando', 'Juarez Marquez', 'C/ Mata 11, 1�F');


/*2.*/

INSERT INTO CUENTA (cod_cuenta, cod_cliente, saldo, interes, cod_sucursal) VALUES (123231, 'FJUAREZ', 30000, 0.10, '1');

/*3*/
INSERT INTO CLIENTE (cod_cliente, apellidos, nombre, direccion) VALUES ('FRaton', 'Raton Romero', 'Fernando', 'C/Nazis n�666');

/*4*/
INSERT INTO CUENTA (cod_cuenta, cod_cliente, saldo, interes, cod_sucursal) VALUES (5551, 'FRATON', 0.0, 0.0, '1');

/*5*/
INSERT INTO TIPO_MOVIMIENTO (cod_tipo_movimiento, descripcion, salida ) VALUES ('IPCB', 'Ingreso por cheque bancario', 'No');

/*6*/
INSERT INTO SUCURSAL (cod_sucursal, direccion, capital_anio_anterior ) VALUES (6, 'C/ Curia, 21', 126547);

/*7*/
CREATE TABLE Movimiento_Salida (
cuenta number(10),
mes number(2),
num_mov_mes number(6),
cod_tipo_mov varchar2(6),
importe number(12,2), 
fecha_hora timestamp,
constraint pk_mov_sal primary key (cuenta, mes, num_mov_mes),
constraint fk_cuenta foreign key (cuenta) references Cuenta,
constraint fk_tipo_mov foreign key (cod_tipo_mov) references tipo_movimiento
);


/*8*/

INSERT INTO Movimiento_Salida (cuenta, mes, num_mov_mes, cod_tipo_mov, importe, fecha_hora) VALUES Select m.cod_cuenta, m.mes, m.num_mov_mes, m.cod_tipo_movimiento, m.importe, m.fecha_hora from movimiento m, tipo_movimiento tm where tm.cod_tipo_mov=m.cod.tipo_movimiento tm.salis like 'S�'; 

/*9*/
CREATE TABLE Movimiento_Promedio (
cod_tipo_movimiento varchar2(6),
descripcion varchar2(50),
importe number(12,2),
constraint pk_mov_promedio primary key (cod_tipo_mov),
constraint fk_tipo_mov_2 foreign key (cod_tipo_mov) references tipo_movimiento
);

/*10*/
INSERT INTO Movimiento_promedio(cod_tipo_movimiento,descripcion, importe)VALUES select 
/*11*/
CREATE TABLE Cuenta_VIP(
COD_CUENTA NUMBER(10) CONSTRAINT PK_CUENTA PRIMARY KEY,
SALDO NUMBER (10,2) NOT NULL,
INTERES NUMBER (5,4) NOT NULL CHECK (INTERES < 1),
COD_CLIENTE VARCHAR(20),
COD_SUCURSAL NUMBER(6),
CONSTRAINT FK_CUENTA_CLIENTE FOREIGN KEY (COD_CLIENTE) REFERENCES CLIENTE (COD_CLIENTE),
CONSTRAINT FK_CUENTA_SUCURSAL FOREIGN KEY (COD_SUCURSAL) REFERENCES SUCURSAL (COD_SUCURSAL) 
);

INSERT INTO CUENTA_VIP (cod_cuenta, cod_cliente, saldo, interes, cod_sucursal) VALUES select cod_cuenta, cod_cliente, saldo, interes, cod_sucursal from cliente where saldo>60000;

/*12*/
CREATE TABLE MOVIMIENTO_ENTRADA(
  COD_CUENTA NUMBER(10),
  MES NUMBER (2) CHECK (MES >= 1 AND MES <= 12),
  NUM_MOV_MES NUMBER(6),
  IMPORTE NUMBER(12,2) NOT NULL,
  FECHA_HORA TIMESTAMP NOT NULL,
  COD_TIPO_MOVIMIENTO VARCHAR(6),
  CONSTRAINT PK_MOVIMIENTO PRIMARY KEY(COD_CUENTA, MES, NUM_MOV_MES),
  CONSTRAINT FK_MOVIMIENTO_CUENTA FOREIGN KEY (COD_CUENTA) REFERENCES CUENTA(COD_CUENTA) ON DELETE CASCADE,
  CONSTRAINT FK_MOVIMIENTO_TIPO_MOVIMIENTO FOREIGN KEY (COD_TIPO_MOVIMIENTO) REFERENCES  TIPO_MOVIMIENTO (COD_TIPO_MOVIMIENTO) 
);
Insert into movimiento_entrada (cod_cuenta, mes, num_mov_mes, cod_tipo_movimiento, importe, fecha_hora) VALUES select m.cod_cuenta,m.mes, m.num_mov_mes, m.cod_tipo_movimiento, m.importe, m.fecha_hora from movimiento m, tipo_movimiento tm where tm.salida="S�" and tm.cod_tipo_movimiento=m=cod_tipo_movimiento
/*13*/
INSERT INTO CUENTA_VIP (cod_cuenta, cod_cliente, saldo, interes, cod_sucursal) VALUES select cod_cuenta, cod_cliente, saldo, interes, cod_sucursal from cliente where interes<0.5;

/*14*/
INSERT INTO CUENTA_VIP (cod_cuenta, cod_cliente, saldo, interes, cod_sucursal) VALUES select cod_cuenta, cod_cliente, saldo, interes, cod_sucursal from cliente where saldo>=60000;

/*15*/
insert into movimiento_promedio (cod_tipo_movimiento,descripcion, importe) values ('PTC','Pago con tarjeta de credito',0.0)

/*16*/
update cliente set direccion='Avda. Monotema 32' where cod_cliene='FRATON';
/*17*/
UPDATE cliente set nobre='ANA MARIA', direccion='C/Descibrimiento, 34' where cod_cliente="ARUBIO"
/*18*/
UPDATE cuenta set (sucursal)= SELECT cu.sucursal from cliente c, cuenta cu where c.cod_cliente= 
/*19*/
/*20*/
/*21*/
/*22*/
/*23*/
/*24*/
/*25*/
/*26*/
/*27*/
/*28*/
/*29*/
/*30*/
/*31*/
/*32*/
/*33*/










