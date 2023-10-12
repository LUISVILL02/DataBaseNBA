--1. Mostrar las estadisticas de un jugador de un equipo
CREATE VIEW estadisticasPorJugador
AS
SELECT 	J.idPersona,
	   (SELECT nombre
	   FROM Personas
	   WHERE Personas.idPersona = J.idPersona),
	   E.nombre,
	   COUNT(A.idJugada) AS Anotaciones,
	   COUNT(CASE WHEN Jug.idTipoJugada = 1 THEN Jug.idJugada END) as asistencias,
	   COUNT(CASE WHEN Jug.idTipoJugada = 2 THEN Jug.idJugada END) as bloqueos,
	   COUNT(CASE WHEN Jug.idTipoJugada = 3 THEN Jug.idJugada END) as robos,
	   COUNT(R.idJugada) AS Rebotes,
	   COUNT(F.idJugada) AS Faltas
FROM Jugadas Jug LEFT JOIN Anotaciones A USING(idJugada)
	 LEFT JOIN Rebotes R USING(idJugada)
	 LEFT JOIN Faltas F USing(idJugada)
	 RIGHT JOIN Jugadores J ON Jug.idJugador = J.idPersona
	 INNER JOIN Equipos E USING (idEquipo)
GROUP BY J.idPersona, E.nombre

--2. Mostrar el equipo, el nombre y el país de los jugadores que su altura sea mayor a 1.95
CREATE VIEW jugadorConAlturaMayorA195
AS
SELECT E.nombre,
		CONCAT(P.nombre,' ',P.apellido) as nombreCompleto,
		J.altura as alturaJugador,
		Pa.nombre as paisDelJugador
FROM Equipos E INNER JOIN Jugadores J USING(idEquipo)
	INNER JOIN Personas P USING(idPersona)
	INNER JOIN Países Pa
	ON P.idPaísNacimiento = Pa.idPaís
WHERE E.idEquipo IN (SELECT idEquipo
				  FROM Jugadores
				  WHERE altura > 1.95)

--3.Mostrar los partidos junto al marcador
CREATE VIEW Part
AS
SELECT idPartido, marcadorLocal, marcadorVisitante
FROM Partidos

--4. Mostrar el salario y el equipo al que pertenece cada jugador.
CREATE VIEW salariosYEquipoPorJugador
AS
SELECT C.idContrato,
		CONCAT(P.nombre,' ',P.apellido) as nombreCompleto,
		C.salario as salarioJugador,
		E.nombre as nombreEquipo
FROM Contratos C INNER JOIN Personas P USING(idPersona)
	INNER JOIN Jugadores Ju USING(idPersona)
	INNER JOIN Equipos E 
	ON E.idEquipo = Ju.idEquipo
GROUP BY C.idContrato, nombreCompleto, E.nombre 
ORDER BY salarioJugador DESC

SELECT *
FROM salariosYEquipoPorJugador

--5. Mostrar el numero de dorsal y posición de los jugadores de un equipo.
CREATE VIEW dorsalYPosiciónPorJugador
AS
SELECT SEJ.nombreCompleto as nombreCompleto,
		CJ.dorsal as numeroDorsal,
		Po.nombre as nombrePosición
FROM salariosYEquipoPorJugador SEJ INNER JOIN ContratosJugador CJ USING(idContrato)
	INNER JOIN Posiciones Po USING(idPosición)
GROUP BY nombreCompleto, numeroDorsal, nombrePosición

select *
from dorsalYPosiciónPorJugador

--6. Mostrar los ganadores de un partido.
SELECT idPartido,
		(SELECT nombre
		 FROM Equipos
		 WHERE idEquipo = equipoGanador(P.idEquipoLocal,P.idEquipoVisitante, P.marcadorLocal, P.marcadorVisitante))
FROM Partidos P

CREATE FUNCTION equipoGanador(idEquipoLocal INT, idEquipoVisitante INT, marcadorLocal INT, marcadorVisitante INT)
RETURNS INT
AS
$BODY$
	DECLARE
	BEGIN
		IF marcadorLocal > marcadorVisitante THEN
			RETURN idEquipoLocal;
		ELSE
			RETURN idEquipoVisitante;
		END IF;
	END;
$BODY$
language 'plpgsql';

-- 7. Mostrar los estados de los partidos.
CREATE VIEW estadosDeLosPartidos
AS
SELECT tip.nombre,
		p.idPartido
FROM estadosPartido estp INNER JOIN partidos p USING(idpartido)
						INNER JOIN tiposEstadoPartido tip USING (idTipoEstado)
						
SELECT *
FROM estadosDeLosPartidos

--8. Mostrar la cantidad de jugadores de un país.
CREATE VIEW cantidadDeJugadoresDeUnPais
AS
SELECT 
		COUNT (*)
FROM jugadores j INNER JOIN personas p  USING(idPersona) 
WHERE P.idPaísNacimiento = (SELECT idPaís
						   FROM países
						   WHERE nombre = 'Estados Unidos')
						   
--9. Mostrar los arbitros de un partido.
CREATE VIEW arbitroDePartidos
AS
SELECT p.idPArtido,
		a.idÁrbitro,
		a.nombre
FROM JuecesDelPartido jue INNER JOIN partidos p  USING(idPartido) 
						INNER JOIN Árbitros a USING (idÁrbitro)