--i. Seleccionar (tipodoc,nrodoc,apellido,nombre) de TODO el personal
--incluidos los veterinarios. De los veterinarios listar también la especialidad.

SELECT *
from personal natural left join veterinario


--ii. Listar la cantidad de veterinarios que ingresan por año al zoo

SELECT count(nrodoc) , YEAR(fecha_ingreso)
from personal NATURAL JOIN veterinario
GROUP BY YEAR(fecha_ingreso)

--iii. Listar los animales (nombre y especie) nacidos en el ZOO que fueron 
--atendidos por algún veterinario durante 2013 por desparasitación, en al menos dos
--oportunidades

SELECT nombre , especie 
FROM animal inner join atiende ON (animal.idanimal = atiende.idanimal)
WHERE atiende.motivo like "desparasitación" AND YEAR(atiende.fecha) = 2013
GROUP BY nombre,especie , atiende.idanimal 
HAVING count(*) >= 2

--iv. Listar el personal femenino (apellido y nombre) que alimentó animales
--durante 2013 que vivían en habitats acuáticos. 
--Además listar el personal
--cuidadores (apellido y nombre) cuyo apellido termine en 'ez' y que esté a
--cargo de la limpieza de jaula (“limpieza”) para animales de, al menos, 3
--habitats distintos.


SELECT personal.nombre , personal.apellido
FROM personal INNER JOIN atiende ON (personal.nrodoc = atiende.nrodocPersonal AND personal.tipodoc = atiende.tipodocPersonal) INNER JOIN animal ON (atiende.idanimal = animal.idanimal) INNER JOIN  vive ON (vive.idanimal = animal.idanimal) INNER JOIN habitat ON (habitat.idhabitat LIKE vive.idhabitat)
WHERE personal.apellido LIKE '%ez' AND atiende.motivo LIKE 'limpieza'
GROUP BY atiende.tipodocPersonal , atiende.nrodocPersonal , personal.nombre , personal.apellido

--v. Listar aquellos habitats donde viven más animales que el valor de
--capacidad definido para los mismos.

SELECT habitat.idhabitat 
FROM vive NATURAL JOIN habitat 
GROUP BY vive.idhabitat , habitat.capacidad 
HAVING count(vive.idanimal) > habitat.capacidad 