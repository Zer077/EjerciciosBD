/*1*/---30

select e.apellido2, e.apellido1, e.nombre, e.codigo_empleado, ej.apellido1, ej.apellido2, ej.nombre 
from empleado e, empleado ej
where e.codigo_empleado=ej.codigo_jefe;

/*2*/-----1
select c.nombre_cliente, c.nombre_contacto, c.apellido_contacto, c.telefono, c.limite_credito
from  cliente c
where rownum=1
order by c.limite_credito DESC;


/*3*/----1
select e.nombre, e.apellido1, count(c.codigo_cliente)as "Numero_Clientes"
from empleado e, cliente c, oficina o
where o.region='Australia' and (select count(c.codigo_empleado_rep_ventas) from empleado e,cliente c where e.codigo_empleado=c.codigo_empleado_rep_ventas)>4  and o.codigo_oficina=e.codigo_oficina
group by e.nombre, e.apellido1;

/*4*/---129
select  p.nombre, p.codigo_producto, p.proveedor,p.cantidad_en_stock
from producto p
where p.codigo_producto not in(select dp.codigo_producto from detalle_pedido dp where dp.codigo_producto=p.codigo_producto)



/*5*/---3
select o.codigo_oficina, o.ciudad, o.pais
from oficina o, (select o.codigo_oficina, e.codigo_empleado from producto p, detalle_pedido dp, pedido pe, cliente c, empleado e, oficina o where p.gama='Frutales' and p.codigo_producto=dp.codigo_producto and dp.codigo_pedido=pe.codigo_pedido and pe.codigo_cliente=c.codigo_cliente and c.codigo_empleado_rep_ventas=e.codigo_empleado and o.codigo_oficina=e.codigo_oficina) fin
where o.codigo_oficina=fin.codigo_oficina(+) and fin.codigo_empleado is null;

/*B*/
/*1*/

insert into cliente values(40,'Flower Power', 'Jorge', 'Rodriguez','34954123456', '34954123456', 'Avda.Leonardo Da Vinci 7',null, 'Sevilla', 'Andalucia', 'España','41012', (select e.codigo_empleado from empleado e where e.nombre='Mariano' and e.apellido1='López'),1400000 );
insert into pago values((select c.codigo_cliente from cliente c where c.nombre_cliente='Flower Power' and c.nombre_contacto='Jorge'), 'Paypal','ak-std-000027', '12-03-2019', 5000 );
/*2*/---12
update producto p set cantidad_en_stock=0 where (select sum(dp.cantidad) from detalle_pedido dp where dp.codigo_producto=p.codigo_producto)>200; 

/*3*/----------
delete producto where nombre='Cerezo' and gama='Frutales' and Dimensiones='16/18';
/*4*/
Create Sequence Secuencia_Cliente increment by 1 start with 39;
Create Sequence Secuencia_Empleado increment by 1 start with 32;




/*5*/
/*Rollback sirve para volver al commit hecho anteriormente, es util para deshacer cambios hechos en la base de datos */
/*Commit, sirve para que los datos en la base de datos consoliden correctamente*/
/*Savepoint, sirve para hacer un punto de guardado en un punto concreto de la base de datos por si es necesario volver atras para descartar ciertos cambios, ya que una vez un commit
se ejecuta no se puede volver más atrás de este*/