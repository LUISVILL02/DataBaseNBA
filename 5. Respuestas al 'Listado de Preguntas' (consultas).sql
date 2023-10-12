--Cuales son los jugadores de un equipo

SELECT j.idPersona,
		p.nombre
FROM equipos e INNER JOIN jugadores j USING(idEquipo) 
				INNER JOIN personas p USING(idPersona)
WHERE idEquipo = (SELECT idEquipo
				 FROM equipos
				 WHERE nombre = 'Villagod State Garden')
				 
-- Media de edad de los jugadores de cada equipo
select E.idEquipo,
		E.nombre,
		ROUND( AVG(EXTRACT (YEAR FROM AGE(NOW(), fechaNacimiento))), 0) as mediaEdad
from personas inner join jugadores Ju using(idpersona)
	inner join equipos E using(idequipo)
group by E.idequipo

--Las anotaciones hechas por cada equipo en toda la temporada
select sum(tl.puntos) as anotaciones,
		e.nombre as nombreEquipo,
		e.idequipo
from tiposlanzamientos tl inner join anotaciones A 
	on tl.idtipolanzamiento = a.idtipolanzamiento
	inner join jugadas J
	on J.idjugada = A.idJugada
	inner join Jugadores Ju
	on J.idJugador = Ju.idPersona
	inner join personas p
	on Ju.idPersona = P.idPersona
	inner join equipos e
	on Ju.idequipo = e.idequipo
GROUP BY nombreequipo, e.idequipo
ORDER BY anotaciones DESC

-- Cantidad de asistencias hechas por cada jugador de un equipo
select CONCAT(P.nombre, ' ', P.Apellido) AS nombreCompleto,
		count(J.idJugada) as asistencias,
		e.nombre as nombreEquipo
from jugadas J inner join Jugadores Ju
	on J.idJugador = Ju.idPersona
	inner join personas p
	on Ju.idPersona = P.idPersona
	inner join equipos e
	on Ju.idequipo = e.idequipo
where J.idtipojugada = 1
GROUP BY nombreCompleto, nombreequipo

---Anotaciones de local y de visitante de todos los equipos
select e.nombre,
	coalesce((select sum(p.marcadorlocal)
		   from partidos p
		   where p.idequipolocal = e.idequipo),0) as anotacionesLocal,
	coalesce((select sum(p.marcadorvisitante)
		   from partidos p
		   where p.idequipovisitante = e.idequipo),0) as anotacionesVisitante
from equipos e

--Puntos anotados el jugador de un equipo
select Ju.idPersona,
		CONCAT(P.nombre, ' ', P.Apellido) AS nombreCompleto,
		sum(tl.puntos) as anotaciones,
		e.nombre as nombreEquipo
from tiposlanzamientos tl inner join anotaciones A 
	on tl.idtipolanzamiento = a.idtipolanzamiento
	inner join jugadas J
	on J.idjugada = A.idJugada
	inner join Jugadores Ju
	on J.idJugador = Ju.idPersona
	inner join personas p
	on Ju.idPersona = P.idPersona
	inner join equipos e
	on Ju.idequipo = e.idequipo
GROUP BY Ju.idPersona,nombreCompleto, nombreequipo
order by anotaciones desc

--Equipos de una conferencia
SELECT C.nombre AS Conferencia, E.nombre AS Equipo
FROM Equipos E INNER JOIN Divisiones D USING (idDivisión)
	 INNER JOIN Conferencias C USING (idConferencia)
WHERE C.nombre IN ('Este')

--Jugadores no drafteados de la competencia
SELECT (SELECT CONCAT(nombre, ' ', apellido) 
	   FROM Personas
	   WHERE Personas.idPersona = Jugadores.idPersona) AS nombreCompleto
FROM Jugadores
WHERE esDraft = '0'

--Cuál es el entrenador principal de cada equipo
--Entrenadores -> Contratos -> Equipos
SELECT Eq.nombre, (SELECT CONCAT(nombre, ' ', apellido)
	   			   FROM Personas
	               WHERE Personas.idPersona = E.idPersona) AS Entrenador
FROM Entrenadores E INNER JOIN Contratos C USING (idEquipo)
	 INNER JOIN Equipos Eq USING (idEquipo)
WHERE E.esEntrenadorPrincipal = 'TRUE'
GROUP BY Eq.nombre, E.idPersona


--Partidos jugados en total en una temporada de cada equipo
--Participaciones, Partidos, Temporadas, 
SELECT E.idEquipo,
		E.nombre,
		((SELECT COUNT(idPartido)
	   		FROM Partidos
	   		WHERE idEquipoLocal = E.idEquipo 
		 			AND idTemporada = (select idtemporada
						  				from Temporadas
										where idFaseTemporada = 4)) + 
			(SELECT COUNT(idPartido)
	   		FROM Partidos
	        WHERE idEquipoVisitante = E.idEquipo 
					AND idTemporada = (select idtemporada
						  				from Temporadas
										where idFaseTemporada = 4))) AS cantidadPartidosJugados
			
FROM Partidos P INNER JOIN Temporadas T USING(idTemporada)
	  INNER JOIN Participaciones Par USING (idTemporada)
	  INNER JOIN Equipos E USING (idEquipo)
GROUP BY E.idEquipo, E.nombre

--Partidos jugados por cada jugador en una temporada playoff
--Partidos, Equipos, Jugadores, Temporadas
SELECT (SELECT CONCAT(nombre, ' ', apellido)
			FROM Personas
			WHERE Personas.idPersona = J.idPersona) AS Jugador,
		((SELECT COUNT(idPartido)
	   		FROM Partidos
	   		WHERE Partidos.idEquipoLocal = J.idEquipo 
		  			AND idTemporada = (select idtemporada
						  				from Temporadas
										where idFaseTemporada = 4)) + 
		(SELECT COUNT(idPartido)
	   		FROM Partidos
	        WHERE Partidos.idEquipoVisitante = J.idEquipo 
		 			AND idTemporada = (select idtemporada
						  				from Temporadas
										where idFaseTemporada = 4))) AS cantidadPartidosJugados
			
FROM Participaciones Pa INNER JOIN Temporadas T USING (idTemporada)
     INNER JOIN Partidos P USING (idTemporada)
	 INNER JOIN FasesDeTemporada Fa USING (idFaseTemporada)
	 INNER JOIN Equipos E USING (idEquipo)
	 INNER JOIN Jugadores J USING(idEquipo)

GROUP BY J.idPersona	

-- Participaciones en partidos total de cada jugador de un equipo
SELECT COUNT(j.idEquipo) AS ParticipacionEnPartidos,
		e.idEquipo,
		CONCAT (p.nombre, ' ', P.apellido) As nombreCompleto
FROM partidos INNER JOIN equipos e ON idEquipoLocal = idEquipo or
										idEquipoVisitante = idEquipo
			  INNER JOIN jugadores j USING (idEquipo) 
			  INNER JOIN personas p USING (idPersona)
GROUP BY nombreCompleto, e.idEquipo
ORDER BY ParticipacionEnPartidos DESC

--equipo ganador de una temporada
SELECT c.idEquipoGanador,
		e.nombre
FROM campeonatos c INNER JOIN equipos e on idEquipoGanador = idEquipo
WHERE idTemporada in (SELECT idTemporada
					FROM Temporadas
					 WHERE añoTemporada = 2021)

--Promedio de rebotes de los equipos
select E.nombre as nombreEquipo,
		CONCAT(ROUND(CAST(count(R.idJugada) as decimal) / (select count(*) from Rebotes),2)*100,'%') as rebotes
from rebotes R inner join Jugadas Ju USING(idJugada)
		inner join Jugadores J
		on Ju.idJugador = J.idPersona
		inner join Equipos E USING(idEquipo)
GROUP BY nombreEquipo

--Promedio de faltas de los equipos
select E.nombre as nombreEquipo,
		CONCAT(ROUND(CAST(count(F.idJugada) as decimal) / (select count(*) from Faltas),2)*100,'%') as faltas
from faltas F inner join Jugadas Ju USING(idJugada)
		inner join Jugadores J
		on Ju.idJugador = J.idPersona
		inner join Equipos E USING(idEquipo)
GROUP BY nombreEquipo

--Promedio de asistencias de los equipos
select E.nombre as nombreEquipo,
		CONCAT(ROUND(CAST(count(Ju.idJugada) as decimal) / 
					 (select count(*) from Jugadas where idtipojugada = 1),2)*100,'%') as asistencias
from Jugadas Ju inner join Jugadores J
		on Ju.idJugador = J.idPersona
		inner join Equipos E USING(idEquipo)
WHERE idTipoJugada = 1
GROUP BY nombreEquipo

--Promedio de bloqueos de los equipos
select E.nombre as nombreEquipo,
		CONCAT(ROUND(CAST(count(Ju.idJugada) as decimal) / 
					 (select count(*) from Jugadas where idtipojugada = 1),2)*100,'%') as bloqueos
from Jugadas Ju inner join Jugadores J
		on Ju.idJugador = J.idPersona
		inner join Equipos E USING(idEquipo)
WHERE idTipoJugada = 2
GROUP BY nombreEquipo

--Promedio de robos de los equipos
select E.nombre as nombreEquipo,
		CONCAT(ROUND(CAST(count(Ju.idJugada) as decimal) / 
					 (select count(*) from Jugadas where idtipojugada = 3),2)*100,'%') as robos
from Jugadas Ju inner join Jugadores J
		on Ju.idJugador = J.idPersona
		inner join Equipos E USING(idEquipo)
WHERE idTipoJugada = 3
GROUP BY nombreEquipo

--partidos ganados de local en la temporada de los equipos.
select E.idEquipo,
	count(idEquipoLocal)
from partidos inner join equipos E
	on partidos.idequipolocal = E.idEquipo
where marcadorLocal > marcadorVisitante
GROUP BY E.idEquipo

--partidos ganados de visitante en la temporada de los equipos.
select E.idEquipo,
	count(idEquipoVisitante)
from partidos inner join equipos E
	on partidos.idequipoVisitante = E.idEquipo
where marcadorLocal < marcadorVisitante
GROUP BY E.idEquipo