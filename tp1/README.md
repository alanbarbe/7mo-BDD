1-    Crear una base
de datos llamada Restaurante, que contenga la tabla Lista de comidas:

Nombre del campo                       Tipo y longitud


Número                                 (autonumérico)


Plato                                  (Texto, 25)


Precio porción                         (float)


2-    Completar la
Lista de comidas del restaurante con 12 platos diferentes.


3-    Buscar los
datos del código 5.

SELECT * FROM Lista_comidas WHERE Numero = 5;


4-    Listar los
platos cuyo nombre comience con la letra M.

SELECT * FROM Lista_comidas WHERE Plato LIKE 'M%';


5-    Buscar todos
los platos cuyo precio sea mayor a $ 15000.

SELECT * FROM Lista_comidas WHERE Precio_porcion > 15000;

6-    Averiguar los
platos que cuestan menos de $ 90000

SELECT * FROM Lista_comidas WHERE Precio_porcion < 90000;

