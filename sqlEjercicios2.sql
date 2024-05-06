DROP DATABASE IF EXISTS tienda;
CREATE DATABASE tienda CHARACTER SET utf8mb4;
USE tienda;
CREATE TABLE fabricante (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, nombre VARCHAR(100) NOT NULL
);
CREATE TABLE producto (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, nombre VARCHAR(100) NOT NULL, precio DOUBLE NOT NULL, id_fabricante INT UNSIGNED NOT NULL, FOREIGN KEY (id_fabricante) REFERENCES fabricante(id)
);
INSERT INTO fabricante VALUES(1, 'Asus');
INSERT INTO fabricante VALUES(2, 'Lenovo');
INSERT INTO fabricante VALUES(3, "Hewlett-Packard");
INSERT INTO fabricante VALUES(4, 'Samsung');
INSERT INTO fabricante VALUES(5, 'Seagate');
INSERT INTO fabricante VALUES(6, 'Crucial');
INSERT INTO fabricante VALUES(7, 'Gigabyte');
INSERT INTO fabricante VALUES(8, 'Huawei');
INSERT INTO fabricante VALUES(9, 'Xiaomi');
INSERT INTO producto VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO producto VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO producto VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO producto VALUES(4, 'GeForce GTX 1050T1', 185, 7);
INSERT INTO producto VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO producto VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO producto VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO producto VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO producto VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO producto VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO producto VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);

select nombre from producto;
select nombre, precio from producto;
select * from producto;

select nombre, precio, precio*2 from producto;

select nombre as 'NOMBRE DE PRODUCTO', precio AS EUROS,  precio*1.15 AS DÓLARES  from producto;

select UPPER(nombre) AS 'UPPER(NOMBRE)' , precio  from producto;

select LOWER(nombre) AS 'LOWER(NOMBRE)' , precio  from producto;

select nombre, UPPER((SUBSTR(NOMBRE, 1, 2))) from fabricante;

select nombre, ROUND(precio, 0) as 'Precio Redondeado' from producto;

select nombre, truncate(precio,0) as 'Precio truncado' from producto;

select id_fabricante from producto as pd join fabricante AS fab on fab.id = pd.id_fabricante;

select DISTINCT id_fabricante from producto as pd join fabricante AS fab on fab.id = pd.id_fabricante;

select nombre from fabricante Order by nombre ASC;

select nombre from fabricante Order by nombre DESC;

select nombre, precio from producto order by nombre ASC ,precio DESC;

select * from fabricante LIMIT 5 OFFSET 1;
select * from fabricante LIMIT 5;

select * from fabricante LIMIT 2 OFFSET 3;

select nombre, precio from producto Order BY precio ASC limit 1; 

select nombre, precio from producto Order BY precio DESC limit 1; 

select nombre from producto where id_fabricante = 2;

select nombre from producto where precio <= 120;

select nombre from producto where precio >= 400;

select nombre from producto where precio < 400;

select nombre from producto where precio >= 80 AND precio <=300;

select * from producto where precio between 60 and 250;

select * from producto where precio >200 and id_fabricante =6;

select * from producto where id_fabricante = 1 or id_fabricante = 3 or id_fabricante = 5;

SELECT * FROM producto WHERE id_fabricante IN (1, 3, 5);

select nombre, precio,  precio*100 AS centimos  from producto;

select * from fabricante where nombre Like 'S%';

select * from fabricante where nombre Like '%e';

select * from fabricante where nombre Like '%w%';

SELECT * FROM fabricante WHERE LENGTH(nombre) = 4;
SELECT * FROM fabricante WHERE nombre like '____';


select * from producto where nombre Like '%Portátil%';

select * from producto where nombre Like '%Monitor%' and precio < 215;

select * from producto where precio >= 180 Order by precio DESC, nombre ASC;
