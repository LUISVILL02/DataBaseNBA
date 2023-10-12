--1. Cuando se inserte un jugador, insertar la persona
CREATE OR REPLACE PROCEDURE insertarJugador(Peso DECIMAL, altura DECIMAL, añoDebut INT, esDraft BOOLEAN,
											idEquipo INT, nombrePersona VARCHAR(100), apellidoPersona VARCHAR(100), 
											fechaNacimiento DATE, idPaísNacimiento INT)
AS
$CODE$
	DECLARE
		persona_id integer;
	BEGIN
		RAISE NOTICE 'Insertando persona %', nombrePersona;
			INSERT INTO Personas(nombre, apellido, fechaNacimiento, idPaísNacimiento)
				VALUES(nombrePersona, apellidoPersona, fechaNacimiento, idPaísNacimiento)
				RETURNING idPersona INTO persona_id;

		RAISE NOTICE 'Persona % insertada', nombrePersona;
		
		RAISE NOTICE 'Insertando jugador';
			INSERT INTO Jugadores
				VALUES(persona_id, peso, altura, añoDebut, esDraft, idEquipo);
		RAISE NOTICE 'Jugador insertado';
	END
$CODE$
LANGUAGE 'plpgsql';

CALL insertarJugador(69,1.75,2004,'1',3,'Javier','Figueroa','10/12/2002',3);

select * from personas

--2. Cuando se inserte un entrenador, insertar la persona
CREATE OR REPLACE PROCEDURE insertarEntrenador(esEntrenadorPrincipal BOOLEAN, idEquipo INT,
							nombrePersona VARCHAR(100), apellidoPersona VARCHAR(100), fechaNacimiento DATE,
							idPaísNacimiento INT)
AS
$CODE$
	DECLARE
		persona_id integer;
	BEGIN
		RAISE NOTICE 'Insertando persona %', nombrePersona;
			INSERT INTO Personas(nombre, apellido, fechaNacimiento, idPaísNacimiento)
				VALUES(nombrePersona, apellidoPersona, fechaNacimiento, idPaísNacimiento)
				RETURNING idPersona INTO persona_id;

		RAISE NOTICE 'Persona % insertada', nombrePersona;
		
		RAISE NOTICE 'Insertando entrenador';
			INSERT INTO Entrenadores
				VALUES(persona_id, esEntrenadorPrincipal, idEquipo);
		RAISE NOTICE 'Entrenador insertado';
	END
$CODE$
LANGUAGE 'plpgsql';

CALL insertarEntrenador('1',11,'Control','Barraespaciadora', '10/07/1967',3);

SELECT * FROM Entrenadores

--3. Cuando se inserte un directivo, insertar la persona correspondiente
CREATE OR REPLACE PROCEDURE insertarDirectivo(idCargo INT, idEquipo INT,
							nombrePersona VARCHAR(100), apellidoPersona VARCHAR(100), fechaNacimiento DATE,
							idPaísNacimiento INT)
AS
$CODE$
	DECLARE
		persona_id integer;
	BEGIN
		RAISE NOTICE 'Insertando persona %', nombrePersona;
			INSERT INTO Personas(nombre, apellido, fechaNacimiento, idPaísNacimiento)
				VALUES(nombrePersona, apellidoPersona, fechaNacimiento, idPaísNacimiento)
				RETURNING idPersona INTO persona_id;

		RAISE NOTICE 'Persona % insertada', nombrePersona;
		
		RAISE NOTICE 'Insertando directivo';
			INSERT INTO Directivos
				VALUES(persona_id, idCargo, idEquipo);
		RAISE NOTICE 'Directivo insertado';
	END
$CODE$
LANGUAGE 'plpgsql';

CALL insertarDirectivo(1,11,'Javier','Messi', '11/09/1999',3);

--4. Cuando se inserte una jugada tipo anotación insertar en jugadas el resto de datos
CREATE PROCEDURE insertarAnotación(tipoLanzamiento INT, partido INT, jugador INT, tiempo TIME, cuarto INT, 
								   descripción VARCHAR(300))
AS
$CODE$
	DECLARE
	j_id integer;
	BEGIN
		RAISE NOTICE 'Insertando jugada';
				INSERT INTO Jugadas(idPartido, idJugador, tiempoJugada, cuartoTiempo, descripción, idTipoJugada)
				VALUES(partido, jugador, tiempo, cuarto, descripción, null)
				RETURNING idJugada INTO j_id;
				
		RAISE NOTICE 'Jugada insertada';
		
			RAISE NOTICE 'Insertando anotación';
			INSERT INTO Anotaciones(idJugada, idTipoLanzamiento)
			VALUES(j_id, tipoLanzamiento);
			
	 RAISE NOTICE 'Anotación insertada'; 
	END
$CODE$
LANGUAGE 'plpgsql';

CALL insertarAnotación(3, 1, 4, '00:08:23', 2, null);
								   
--5. Cuando se inserte una jugada tipo falta insertar en jugadas el resto de datos
CREATE PROCEDURE insertarFalta(nombre VARCHAR(50), tipoFalta INT, partido INT, jugador INT, tiempo TIME, 
									cuarto INT, descripción VARCHAR(300))
AS
$CODE$
	DECLARE
	f_id integer;
	BEGIN
		RAISE NOTICE 'Insertando jugada';
				INSERT INTO Jugadas(idPartido, idJugador, tiempoJugada, cuartoTiempo, descripción, idTipoJugada)
				VALUES(partido, jugador, tiempo, cuarto, descripción, null)
				RETURNING idJugada INTO f_id;
				
		RAISE NOTICE 'Jugada insertada';
		
			RAISE NOTICE 'Insertando falta';
			INSERT INTO Faltas(idJugada, nombre, idTipoFalta)
			VALUES(f_id, nombre, tipoFalta);
			
	 RAISE NOTICE 'Falta insertada'; 
	END
$CODE$
LANGUAGE 'plpgsql';

CALL insertarFalta('Obstrucción',3, 1, 4, '00:08:23', 2, null);

select * from faltas where idjugada in (select idjugada
									   from jugadas
									   where idpartido = 1)

--6. Cuando se inserte una jugada tipo rebote insertar en jugadas el resto de datos
CREATE PROCEDURE insertarRebote(tipoRebote INT, partido INT, jugador INT, tiempo TIME, cuarto INT, 
								   descripción VARCHAR(300))
AS
$CODE$
	DECLARE
	r_id integer;
	BEGIN
		RAISE NOTICE 'Insertando jugada';
				INSERT INTO Jugadas(idPartido, idJugador, tiempoJugada, cuartoTiempo, descripción, idTipoJugada)
				VALUES(partido, jugador, tiempo, cuarto, descripción, null)
				RETURNING idJugada INTO r_id;
				
		RAISE NOTICE 'Jugada insertada';
		
			RAISE NOTICE 'Insertando anotación';
			INSERT INTO Rebotes(idJugada, idTipoRebote)
			VALUES(r_id, tipoRebote);
			
	 RAISE NOTICE 'Anotación insertada'; 
	END
$CODE$
LANGUAGE 'plpgsql';

CALL insertarRebote(1, 1, 4, '00:08:23', 2, null);

select * from rebotes where idjugada in (select idjugada
									   from jugadas
									   where idpartido = 1)

-- 7. Cuando se inserte un equipo, insertar el estadio.
CREATE PROCEDURE insertarEquipo(nombre VARCHAR(50), abreviaturaNombre VARCHAR(3), fechaCreación DATE, idDivisión INT, idEstadio INT, 
nombreES varchar(50), capacidad INT, ciudad INT)
AS
$CODE$
	BEGIN
		RAISE NOTICE 'Insertando estadio %', nombreEs;
				INSERT INTO Estadios(nombre, capacidad, idCiudad)
				VALUES(nombreES, capacidad, ciudad);
				
		RAISE NOTICE 'estadio % insertado', nombreES;
		
			RAISE NOTICE 'Insertando equipo %', nombre;
			INSERT INTO Equipos(nombre, abreviaturaNombre, fechaCreación, idDivisión, idEstadio)
			VALUES(nombre, abreviaturaNombre, fechaCreación, idDivisión, idEstadio);
			
	 RAISE NOTICE 'equipo % insertado', nombre; 
	END
$CODE$
LANGUAGE 'plpgsql';

CALL insertarEquipo('Luchito Bc', 'LBC', '12/09/1990', 2, 12, 'Galaxy City', 2000, 3);

--8. Cuando se inserte una persona nueva con un país, se ingrese el país.
CREATE PROCEDURE insertarPersona(nombrePersona varchar(50), apellidoPersona VARCHAR(50), fechaNacimiento DATE, 
								 idPaísNacimiento INT, nombrePaís VARCHAR(50) )
AS
$CODE$
	DECLARE
	país_id integer;
	BEGIN
		RAISE NOTICE 'Insertando país %', nombrePaís;
				INSERT INTO Países(nombre)
				VALUES(nombrePaís)
				RETURNING idPaís INTO país_id;
				
		RAISE NOTICE 'Paíss % insertado', nombrePaís;
		
			RAISE NOTICE 'Insertando Persona %', nombrePersona;
			INSERT INTO Personas(nombre, apellido, fechaNacimiento, idPaísNacimiento)
			VALUES(nombrePersona, apellidoPersona, fechaNacimiento, país_id);
			
	 RAISE NOTICE 'Persona % insertada', nombrePersona; 
	END
$CODE$
LANGUAGE 'plpgsql';

CALL insertarPersona('luis', 'villl', '15/09/2002', 7, 'España');

--9. Cuando se inserte un estadio, insertar la ciudad a la que pertenece
CREATE PROCEDURE insertarEstadio(nombreEstadio VARCHAR(50), capacidad INT, idCiudadC INT, 
								 nombreCiudad VARCHAR(50))
AS
$CODE$
	DECLARE
	ciudad_id integer;
	BEGIN
		RAISE NOTICE 'Insertando ciudad %', nombreCiudad;
				INSERT INTO ciudades(nombre)
				VALUES(nombreciudad)
				RETURNING idCiudad INTO ciudad_id;
				
		RAISE NOTICE 'ciudad % insertada', nombreCiudad;
		
			RAISE NOTICE 'Insertando estadio %', nombreEstadio;
			INSERT INTO Estadios(nombre, capacidad, idCiudad)
			VALUES(nombreEstadio, capacidad, ciudad_id);
			
	 RAISE NOTICE 'estadio % insertado', nombreEstadio; 
	END
$CODE$
LANGUAGE 'plpgsql';

CALL insertarEstadio('ponchar estadium', 5000, 31, 'valencia')