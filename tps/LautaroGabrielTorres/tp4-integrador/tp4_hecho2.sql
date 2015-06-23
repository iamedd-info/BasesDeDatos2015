----------------------
-- TP4 - Integrador --
----------------------


-- Curso 7moC
-- Nombre: Lautaro Torres

--------------------------------------------------------------------------------------------
--1
SELECT nombre FROM producto;

--2 
SELECT nombre, precio FROM producto;

--3
SELECT nombre FROM producto
          WHERE precio <= 200;

--4
SELECT nombre FROM producto
       WHERE precio >= 60 AND precio <= 120;

--5
SELECT nombre, precio*100 as centavos FROM producto;

--6
SELECT avg(precio) as prom FROM producto;

--7
SELECT precio FROM producto
       WHERE id_fabricante = 2;

--8
SELECT count(*) as cantidad FROM producto
               WHERE precio >=180;

--9
SELECT nombre, precio FROM producto
         WHERE precio >= 180
         GROUP BY nombre, precio
         ORDER BY nombre, precio DESC;

--10
SELECT *
    FROM producto
    JOIN fabricante ON producto.id_fabricante = fabricante.id;

--11
SELECT producto.nombre, producto.precio, fabricante.nombre
        FROM prdocuto
        JOIN fabricante ON producto.id_fabricante = fabricante.id;

--12
SELECT fabricante.id, avg(producto.precio) as promedio
   FROM fabricante
JOIN producto ON fabricante.id = producto.id_fabricante
GROUP BY fabricante.id

--13
SELECT fabricante.nombre, avg(producto.precio) as promedio
 FROM fabricante
 JOIN producto ON fabricante.id = producto.id_fabricante
 GROUP BY fabricante.nombre
 ORDER BY fabricante.nombre;

--14
SELECT fabricante.nombre
FROM fabricante
JOIN producto ON producto.id_fabricante = fabricante.id
WHERE producto.precio >= (SELECT avg(precio) FROM producto WHERE producto.id_fabricante = fabricante.id)
GROUP BY fabricante.nombre;

--15
SELECT nombre
FROM producto
WHERE precio = (SELECT min(precio) FROM producto);

--16
SELECT fabricante.nombre, producto.nombre, producto.precio
FROM fabricante
JOIN producto ON producto.id_fabricante = fabricante.id
WHERE producto.precio = (SELECT max(precio) FROM producto WHERE producto.id_fabricante = fabricante.id);
GROUP BY fabricante.nombre, producto.nombre, producto.precio;

--17
INSERT INTO producto (id, nombre, precio, id_fabricante)
VALUES (11, 'Parlantes', '70', '2');

--18
UPDATE producto
SET nombre= "IMpresora Laser"
WHERE id = 8;

--19
UPDATE producto
SET precio = (precio*0.9);

--20
UPDATE producto
SET precio = (precio*0.9)
WHERE precio >= 120;
