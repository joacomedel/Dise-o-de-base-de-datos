--Seleccionar las personas (tipo y nro de doc) y la cantidad de veces que
--hayan realizado acciones de emergencia siempre y cuando los eventos
--hayan ocurrido hace 4 o más años.

SELECT se.nrodoc , se.tipodoc , COUNT(idaccion)
FROM SE_REALIZA as se NATURAL JOIN EVENTO_CLIMATOLOGICO as e
WHERE DATEDIFF(CURRENT_DATE(), e.fechafin)/365 >= 4
GROUP BY se.nrodoc , se.tipodoc


SELECT idevento,fechainicio, fechafin, km_h,mm_minuto,cant
FROM 
		(SELECT count(distinct(SE_REALIZA.nrodoc)) as cant , idevento
		FROM EVENTO_CLIMATOLOGICO NATURAL JOIN PERTENECE NATURAL JOIN SE_REALIZA 		 NATURAL JOIN PERSONA
		WHERE PERSONA.idciudad = PERTENECE.idciudad
		GROUP BY idevento) as tab 
        
NATURAL JOIN EVENTO_CLIMATOLOGICO  
NATURAL LEFT JOIN VIENTO 
NATURAL LEFT JOIN LLUVIA

--Listar las mujeres (tipodoc, nrodoc,nombre y apellido) que no realizaron
--acciones de emergencia en la zona donde viven pero que hayan realizado
--alguna acción de emergencia para algún evento metereológico ocurrido
--en alguna zona distinta a la que viven. USAR INTERSECCIÓN
SELECT p.tipodoc,p.nrodoc,nombre , apellido 
FROM PERSONA p NATURAL JOIN SE_REALIZA NATURAL JOIN EVENTO_CLIMATOLOGICO INNER JOIN PERTENECE ON (EVENTO_CLIMATOLOGICO.idzona = PERTENECE.idzona)
WHERE  (p.genero like 'Fem%') AND (p.idciudad <> PERTENECE.idciudad)

INTERSECT

SELECT p.tipodoc,p.nrodoc,nombre , apellido 
FROM PERSONA p NATURAL JOIN SE_REALIZA NATURAL JOIN EVENTO_CLIMATOLOGICO INNER JOIN PERTENECE ON (p.idciudad = PERTENECE.idciudad)
WHERE  (p.genero like 'Fem%') AND (PERTENECE.idzona <> EVENTO_CLIMATOLOGICO.idzona)


--IV

SELECT p.tipodoc,p.nrodoc,nombre , apellido 
FROM PERSONA p NATURAL JOIN SE_REALIZA NATURAL JOIN EVENTO_CLIMATOLOGICO INNER JOIN PERTENECE ON (EVENTO_CLIMATOLOGICO.idzona = PERTENECE.idzona)
WHERE  (p.genero like 'Fem%') AND (p.idciudad <> PERTENECE.idciudad) AND
(p.tipodoc,p.nrodoc) IN
(SELECT p2.tipodoc,p2.nrodoc 
FROM PERSONA p2 NATURAL JOIN SE_REALIZA NATURAL JOIN EVENTO_CLIMATOLOGICO INNER JOIN PERTENECE ON (p2.idciudad = PERTENECE.idciudad)
WHERE  (p2.genero like 'Fem%') AND (PERTENECE.idzona <> EVENTO_CLIMATOLOGICO.idzona))

--V
--Obtener un listado que muestre los eventos y las categorías correspondientes, junto 
--con la cantidad de eventos en los que se llevan a cabo más de 5 acciones de 
--emergencia de cada categoría en un mismo evento. En otras palabras, queremos 
--identificar los eventos en los que se realizan múltiples acciones de emergencia de 
--una misma categoría y contar cuántos eventos cumplen con esta condición para cada 
--categoría específica.

SELECT se.idevento , ac.categoria , count(ac.idaccion) as cant
FROM SE_REALIZA as se NATURAL JOIN ACCION_DE_EMERGENCIA as ac
GROUP BY ac.categoria ,se.idevento
HAVING count(ac.idaccion) > 0
