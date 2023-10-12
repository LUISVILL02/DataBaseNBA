------------------------
--      CIUDADES      --
------------------------
INSERT INTO Ciudades(nombre) VALUES('Santa Marta'), ('Boston'), ('Brooklyn'),
('New York'),('Philadelphia'),('Toronto'), ('Chicago'), ('Cleveland'), ('Detroit'), ('Indiana'), ('Milwaukee'),
('Atlanta'), ('Chalotte'), ('Miami'), ('Orlando'),('Washington'), ('Denver'), ('Minnesota'), ('Oklahoma'),
('Portland'), ('Utah'), ('San Francisco'), ('Los Angeles'), ('Phoenix'), ('Sacramento'), ('Dallas'),  ('Houston'),
('Memphis'), ('New Orleands'), ('San Antonio');

-------------------
--    ESTADIOS   --
-------------------
INSERT INTO Estadios(nombre, capacidad, idCiudad) VALUES('Madison Square Garden',5000,1),('Staples Center',1000,2),
 	('Pescaito Arena',10,3),('Francia Marquez Coliseo',2000,4), ('TD Garden',2000,4), ('Barclays Center',4500,5),
	('Scotiabank Arena',2600,6), ('Little Caesars Arena',4000,7), ('Amway Center',8000,8), ('Crypto.com Arena',3300,9),
	('LA Park',10000,23);

-------------------
-- CONFERENCIAS  --
-------------------
INSERT INTO Conferencias(nombre) VALUES('Este'), ('Oeste');
	 
-------------------
--  DIVISIONES   --
-------------------	 
INSERT INTO Divisiones(nombre, idConferencia) VALUES('Central', 1), ('Atlántico', 1), ('Sureste', 1), ('Pacífico', 2), 
	 ('Suroeste', 2), ('Noroeste', 2);
	 
-------------------
--    EQUIPOS    --
-------------------
INSERT INTO Equipos(nombre, abreviaturaNombre, fechaCreación, idDivisión, idEstadio)
	 VALUES('Los Angeles Lakers','LAL','10/01/1996', 4,2),               
	 ('Magdalena Basket Club','MBC','15/07/1969', 4,3),
	 ('Choco Francia Club','CFC','27/02/2005', 2,4),
     ('Fundacion Lakers', 'FLK', '29/07/2016', 2, 4),
	 ('Maria Eugenia Club','MEC','14/06/2009', 1,5),
	 ('Ascension Shooters','ASC','11/11/2011', 3,6), 
	 ('Phoenix Suns','PSU','07/08/1999', 5,5),
	 ('Tutti Frutti All Stars','TFS','15/11/2002', 6,7), 
	 ('Groove Street Team','GSA','26/10/2004', 1,11),
	 ('Villagod State Garden','VSG','03/12/2001', 5,3),
	 ('Chinatown Team','CHT','08/03/1997', 6,6), 
	 ('Windows Basket Team','WBT','04/04/2004', 3,4);
	 
---------------------
-- FASES TEMPORADA --
---------------------
INSERT INTO FasesDeTemporada(nombre) VALUES('Pretemporada'),('Temporada regular'),('PlayIn'),('PlayOff');

------------------
--  TEMPORADAS  --
------------------
INSERT INTO Temporadas(añoTemporada,idFaseTemporada) VALUES(2021,1),(2021,2),(2021,3),(2021,4);

----------------------------------
--    TIPOS ESTADO TEMPORADA    --
----------------------------------
INSERT INTO TiposEstadoTemporada(nombre) VALUES('Sin comenzar'),('En proceso'),('Finalizada');

-----------------------------
--    ESTADOS TEMPORADA    --
-----------------------------
INSERT INTO EstadosTemporada(fechaCreación, fechaCambio,idTemporada,idTipoEstado) 
	VALUES('15/04/2021','04/06/2021',1,3),('04/06/2021',null,2,2);

---------------------
-- PARTICIPACIONES --
---------------------
INSERT INTO Participaciones(idTemporada, idEquipo) VALUES
(1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),
(2,1),(2,2),(2,3),(2,4),(2,5),(2,6),(2,7),(2,8),(2,9),(2,10),(2,11),(2,12), 
(3,1),(3,3),(3,5),(3,6),(3,7),(3,8),
(4,2),(4,3),(4,4),(4,6),(4,8),(4,9),(4,10),(4,11);

---------------------
--   CAMPEONATOS   --
---------------------
INSERT INTO Campeonatos(idTemporada, idEquipoGanador) VALUES(1,5);

---------------------
--     PARTIDOS    --
---------------------
INSERT INTO Partidos(idEquipoLocal, idEquipoVisitante, marcadorLocal, marcadorVisitante, fechaYHora, idTemporada,
					idEstadioJugado) 
					VALUES
					-- PARTIDOS TEMPORADA REGULAR --
					
					-- PARTIDO 1: CFC - FLK (7-3)
					(3,4,7,3,'07/08/2021 07:32:00',2,3),
					-- PARTIDO 2: LAL - MBC (2-5)
					(1,2,2,5,'10/08/2021 07:32:00', 2, 2),
					-- PARTIDO 3: MEC - GSA (4-3)
					(5,9,4,3,'15/08/2021 07:32:00',2,5),
					-- PARTIDO 4: ASC - WBT (6-4)
					(6,12,6,4,'17/08/2021 07:32:00',2,6),
					-- PARTIDO 5: PSU - VSG (5-2)
					(7,10,5,2,'19/08/2021 07:32:00',2,5),
					-- PARTIDO 6: TFS - CHT (3-4)
					(8,11,3,4,'21/08/2021 07:32:00',2,7),
					
					-- PARTIDOS PLAY IN --
					
					-- PARTIDO 7: PSU - GSA (4-5)
					(7,9,4,5, '23/08/2021 07:32:00',3,2),
					-- PARTIDO 8: TFS - VSG (2-3)
					(8,10,2,3,'23/08/2021 07:32:00',3,5),
					-- PARTIDO 9: LAL - WBT (1-5)
					(1,12,1,5,'26/08/2021 07:32:00',3,5),
					
					-- PARTIDOS PLAY OFF CUARTOS --
					
					-- PARTIDO 10: MBC - CHT (4-3)
					(2,11,4,3,'28/08/2021 07:32:00',4,3),
					-- PARTIDO 11: WBT - CFC (3-4)
					(12,3,4,2,'28/08/2021 07:32:00',4,4),
					-- PARTIDO 12: MEC - PSU (5-3)
					(5,7,5,3,'28/08/2021 07:32:00',4,7),
					-- PARTIDO 13: GSA - ASC (2-1)
					(9,6,2,1,'28/08/2021 07:32:00',4,3),
					
					-- PARTIDOS PLAY OFF SEMIFINAL --
					
					-- PARTIDO 14: MEC - MBC (2-1)
					(5,2,2,1,'30/08/2021 07:32:00',4,4),
					-- PARTIDO 15: WBT - GSA (4-0)
					(12,9,4,0,'30/08/2021 07:32:00',4,11),
					
					-- PARTIDOS FINAL --
					-- PARTIDO 16: MEC - WBT (4-2)
					(5,12,4,2,'1/09/2021 07:32:00',4,6);	

-----------------------------------
--    TIPOS ESTADO DE PARTIDO    --
-----------------------------------
INSERT INTO TiposEstadoPartido(nombre) VALUES('Programado'),('En juego'),('Finalizado');

-----------------------------
--  ESTADOS DEL PARTIDO    --
-----------------------------
INSERT INTO EstadosPartido(fechaCreación, fechaCambio,idPartido,idTipoEstado) 
	VALUES('01/08/2021','07/08/2021',2,1),('07/08/2021','07/08/2021',2,2),('07/08/2021','08/08/2021',2,3);
	
---------------------
--     ARBITROS    --
---------------------
INSERT INTO Árbitros(nombre)VALUES('Marcel David'),('Wilman Roldan'),('Messi Chikito'),('Pitágoras'),
  ('Luis Figueroa Diaz');
 
-------------------------------
--     JUECES DEL PARTIDO    --
-------------------------------
INSERT INTO JuecesDelPartido(idPartido, idÁrbitro)
          VALUES
		  (1,1),(1,2),
		  (2,3),
		  (3,4),
		  (4,5),
		  (5,2),(5,3),
		  (6,1),
		  (7,1),
		  (8,3),
		  (9,4),
		  (10,3),
		  (11,5),
		  (12,1),
		  (13,2),
		  (14,2),
		  (15,2),
		  (16,4);

-------------------
--     PAISES    --
-------------------
INSERT INTO Países(nombre) VALUES('Colombia'),('Estados Unidos'),('Wakanda'),('Canadá'),('Asgard'),('Nigeria');

---------------------
--     PERSONAS    --
---------------------
INSERT INTO Personas(nombre, apellido, fechaNacimiento, idPaísNacimiento) 
	VALUES --JUGADORES--
	('Lebron','Villamil','15/09/2002',3),
	('Michael','Diaz','15/07/2003',1),
	('Javier','Furry','07/12/2003',6),
	('Marcel','Antetokounmpo','15/04/1990',5),
	('Walter','Yepez','20/01/1997',1),
	('Galvis','Jordan','23/10/1983',2), 
	('julian','alvarez','25/09/2000',2),
	('foy','luz', '20/09/1980',2),
	('lucas','dangong','10/08/1990',3),
	('felipe','melo','13/01/2002',4),
	('huho','martin','18/06/1984',1),
	('mateo','linaz','12/03/2000',3), -- #12
	
	-- EXTRAS --
	('cristian','garcia','12/08/1970',4),
	('sevedo','crespo','07/08/2001',3),
	('luis','Villamil','15/09/2002',4),
	
	-- ENTRENADORES
	('Leo','goreztka','15/09/2002',3), --#16
	('Maicol','ferreo','15/07/2003',1),
	('Javi','fernandez','07/12/2003',6),
	('Marcel','diaz','15/04/1990',5),
	('wili','Yaez','20/01/1997',1),
	('alex','busta','23/10/1983',2),
	('alfred','visca','23/10/1983',2),
	('julio','arbeloa','25/09/2000',2),
	('feiman','richard', '20/09/1980',2),
	('pato','rodrigez','10/08/1990',3),
	('florentino','perez','13/01/2002',4),
	('fabio','canavaro','18/06/1984',1), --#27
	
	-- Directivos --
	('wlllia','florez','10/08/1990',3), --#28
	('jhoan','laporte','13/01/2002',4),
	('naser','arquelaifi','18/06/1984',1), --#30
	
	-- JUGADORES ASISTENTES --
	('Antonio','Perez','15/09/2002',3), --#31
	('Estefano','Vasquez','15/07/2003',1),
	('Javier','Santos','07/12/2003',6),
	('Marcelo','Konozelo','15/04/1990',5),
	('Daniel','Quiñones','20/01/1997',1),
	('Cristian','Ruiz','23/10/1983',2), 
	('Light','Stuart','25/09/2000',2),
	('Buzz','Lightyear', '20/09/1980',2),
	('Leonardo','DiCaprio','10/08/1990',3),
	('Ester','Kosito','13/01/2002',4),
	('Dwayne','Piedra','18/06/1984',1),
	('Carlos','Caicedo','12/03/2000',3); -- #42
	
----------------------
--     JUGADORES    --
----------------------
INSERT INTO Jugadores(idPersona,peso,altura,añoDebut,esDraft,idEquipo) 
	VALUES
	(1,55,1.70,2019,'1',1),
	(2,93,2.12,2000,'1',2),
	(3,54,1.74,2000,'1',3),
	(4,60,1.80,2000,'1',4),
	(5,64,1.90,2006,'1',5),
	(6,59,1.99,2000,'1',6),
	(7,64,1.89,2001,'0',7),
	(8,56,1.79,2000,'1',8),
	(9,70,2,2000,'1',9),
	(10,70,1.90,2003,'0',10),
	(11,69,2,2000,'1',11),
	(12,56,1.97,2004,'1',12),
	
	(31,55,1.70,2019,'1',1),
	(32,93,2.12,2000,'1',2),
	(33,54,1.74,2000,'1',3),
	(34,60,1.80,2000,'1',4),
	(35,64,1.90,2006,'1',5),
	(36,59,1.99,2000,'1',6),
	(37,64,1.89,2001,'0',7),
	(38,56,1.79,2000,'1',8),
	(39,70,2,2000,'1',9),
	(40,70,1.90,2003,'0',10),
	(41,69,2,2000,'1',11),
	(42,56,1.97,2004,'1',12);

----------------------
--  ENTRENADORES    --
----------------------
INSERT INTO Entrenadores(idPersona,esEntrenadorPrincipal,idEquipo)
	VALUES
	(16,'1',1),
	(17,'1',2),
	(18,'1',3),
	(19,'1',4),
	(20,'1',5),
	(21,'1',6),
	(22,'1',7),
	(23,'1',8),
	(24,'1',9),
	(25,'1',10),
	(26,'1',11),
	(27,'1',12);

-------------------------
--  CARGOS DIRECTIVOS  --
-------------------------
INSERT INTO Cargos(nombre) VALUES('Gerente'),('Socio'),('Dueño');

----------------------
--     DIRECTIVOS   --
----------------------
INSERT INTO Directivos(idPersona,idCargo,idEquipo)
	VALUES
	(28,2,1),
	(29,3,2),
	(30,1,3);
	
----------------------
--     CONTRATOS    --
----------------------	
INSERT INTO Contratos(fechaInicial,fechaFinal, salario, idEquipo, idPersona)
	VALUES('22/01/2020','22/01/2025',200000,1,1),
	('22/01/2020','22/01/2025',300000,2,2),
	('22/01/2020','22/01/2025',400000,3,3),
	('22/01/2020','22/01/2025',500000,4,4),
	('22/01/2020','22/01/2025',600000,5,5),
	('22/01/2020','22/01/2025',700000,6,6),
	('22/01/2020','22/01/2025',800000,7,7),
	('22/01/2020','22/01/2025',90000,8,8),
	('22/01/2020','22/01/2025',200000,9,9),
	('22/01/2020','22/01/2025',300000,10,10),
	('22/01/2020','22/01/2025',400000,11,11),
	('22/01/2020','22/01/2025',600000,12,12),
	
	('22/01/2020','22/01/2025',200000,1,31),
	('22/01/2020','22/01/2025',300000,2,32),
	('22/01/2020','22/01/2025',400000,3,33),
	('22/01/2020','22/01/2025',500000,4,34),
	('22/01/2020','22/01/2025',600000,5,35),
	('22/01/2020','22/01/2025',700000,6,36),
	('22/01/2020','22/01/2025',800000,7,37),
	('22/01/2020','22/01/2025',90000,8,38),
	('22/01/2020','22/01/2025',200000,9,39),
	('22/01/2020','22/01/2025',300000,10,40),
	('22/01/2020','22/01/2025',400000,11,41),
	('22/01/2020','22/01/2025',60000000,12,42);

--------------------------
-- POSICIONES JUGADORES --
--------------------------
INSERT INTO Posiciones(nombre)
	VALUES ('base'),
			('escolta'),
	        ('alero'),
	        ('ala-pivot'),
	        ('pivot');

-------------------------
-- CONTRATOS JUGADORES --
-------------------------
INSERT INTO ContratosJugador(idContrato, dorsal, idPosición)
	VALUES (1,3,1),(2,4,2),(3,5,3),(4,6,4),
	        (5,7,1),(6,8,2),(7,9,3),(8,10,4),
	        (9,11,5),(10,12,1),(11,13,2),(12,14,3),
			(13,15,1),(14,16,2),(15,17,3),(16,18,4),
	        (17,19,1),(18,23,2),(19,29,3),(20,31,4),
	        (21,33,5),(22,35,1),(23,39,2),(24,44,3);

-----------------------
-- TIPOS DE JUGADAS  --
-----------------------
INSERT INTO TiposDeJugada(nombre) VALUES('Asistencia'),('Bloqueo'),('Robo');

----------------------
--      JUGADAS     --
----------------------
INSERT INTO Jugadas(idPartido,idJugador,tiempoJugada,cuartoTiempo,descripción,idTipoJugada)
	VALUES -- JUGADAS ANOTACIONES
	    -- PARTIDO 1
	        (1,3,'00:00:20',1,null,null),
	        (1,3,'00:02:50',1,null,null),
			(1,3,'00:00:20',3,null,null),
			
	        (1,4,'00:01:53',3,null,null),
	        (1,4,'00:02:13',3,null,null),
			
		-- PARTIDO 2
			(2,1,'00:01:33',1,null,null),
			
			(2,2,'00:05:17',1,null,null),
			(2,2,'00:02:43',2,null,null),
			
		-- PARTIDO 3
			(3,5,'00:07:51',2,null,null),
			(3,5,'00:09:25',2,null,null),
			
			(3,9,'00:05:43',3,null,null),
			
		-- PARTIDO 4
			(4,6,'00:03:02',1,null,null),
			(4,6,'00:04:17',2,null,null),
			
			(4,12,'00:05:46',2,null,null),
	        (4,12,'00:06:56',2,null,null),
			
		-- PARTIDO 5
			(5,7,'00:01:02',1,null,null),
			(5,7,'00:03:17',2,null,null),
			
			(5,10,'00:05:46',2,null,null),
			
		-- PARTIDO 6
			(6,8,'00:05:02',1,null,null),
			
			(6,11,'00:05:46',1,null,null),
			(6,11,'00:07:46',1,null,null),
			
		-- PARTIDO 7
			(7,7,'00:03:02',1,null,null),
			(7,7,'00:05:46',1,null,null),
			
			(7,9,'00:07:46',1,null,null),
			(7,9,'00:08:46',1,null,null),
			
		-- PARTIDO 8
			(8,8,'00:05:02',1,null,null),
			
			(8,10,'00:05:46',1,null,null),
			
		-- PARTIDO 9
			(9,1,'00:05:02',1,null,null),
			
			(9,12,'00:05:46',1,null,null),
			(9,12,'00:07:46',1,null,null),
			
		-- PARTIDO 10
			(10,2,'00:05:02',1,null,null),
			(10,2,'00:06:46',1,null,null),
			
			(10,11,'00:07:46',1,null,null),
			
		-- PARTIDO 11
			(11,12,'00:05:02',1,null,null),
			(11,12,'00:06:46',1,null,null),
			
			(11,3,'00:07:46',1,null,null),
			
		-- PARTIDO 12
			(12,5,'00:05:02',1,null,null),
			(12,5,'00:06:46',1,null,null),
			
			(12,7,'00:07:46',1,null,null),
			(12,7,'00:03:46',1,null,null),
			
		-- PARTIDO 13
			(13,9,'00:05:02',1,null,null),
			
			(13,6,'00:07:46',1,null,null),
			
		-- PARTIDO 14
			(14,5,'00:05:02',1,null,null),
			
			(14,2,'00:07:46',1,null,null),
			
		-- PARTIDO 15
			(15,12,'00:05:02',1,null,null),
			(15,12,'00:07:46',1,null,null),
			
		-- PARTIDO 16
			(16,5,'00:05:02',1,null,null),
			(16,5,'00:07:46',1,null,null),

			(16,12,'00:03:46',1,null,null), --#49
			
	-- JUGADAS REBOTES --
	        -- PARTIDO 1
	        (1,3,'00:05:20',1,null,null), --#50
	        (1,4,'00:06:53',1,null,null),
	        
			-- PARTIDO 2
	        (2,1,'00:05:30',1,null,null),
	        (2,2,'00:06:13',1,null,null),
			
			-- PARTIDO 3
	        (3,5,'00:05:30',1,null,null),
	        (3,5,'00:06:13',1,null,null),
	        
	        -- PARTIDO 4
	        (4,6,'00:05:20',1,null,null),
	        (4,12,'00:06:20',1,null,null),
	        (4,12,'00:07:20',1,null,null),
			
	        -- PARTIDO 5
	        (5,7,'00:05:20',1,null,null),
			(5,7,'00:06:20',1,null,null),
			(5,7,'00:07:20',1,null,null),
	        (5,10,'00:06:40',1,null,null),

	        -- PARTIDO 6
	        (6,8,'00:05:20',2,null,null),
			(6,8,'00:06:20',2,null,null),
	        (6,11,'00:03:20',2,null,null),
			(6,11,'00:07:20',2,null,null),
	        
	        -- PARTIDO 7
	        (7,7,'00:05:20',2,null,null),
	        (7,9,'00:06:20',2,null,null),
			(7,9,'00:08:20',2,null,null),
	        
	        -- PARTIDO 8
	        (8,8,'00:05:20',2,null,null),
	        (8,10,'00:06:20',2,null,null),
	        
	        -- PARTIDO 9
	        (9,1,'00:05:20',2,null,null),
	        (9,12,'00:06:20',2,null,null),
	        
	        -- PARTIDO 10
	        (10,2,'00:05:20',2,null,null),
	        (10,11,'00:06:20',2,null,null),
	        
	        -- PARTIDO 11
	        (11,12,'00:05:20',2,null,null),
	        (11,3,'00:06:20',2,null,null),
	        
	        -- PARTIDO 12
	        (12,5,'00:05:20',2,null,null),
	        (12,7,'00:06:20',2,null,null),
	        
	        -- PARTIDO 13
	        (13,9,'00:05:20',2,null,null),
	        (13,6,'00:06:20',2,null,null),
	        
	        -- PARTIDO 14
	        (14,5,'00:05:20',2,null,null),
	        (14,2,'00:06:20',2,null,null),
	        
	        -- PARTIDO 15
	        (15,12,'00:05:20',2,null,null),
	        (15,9,'00:06:20',2,null,null),

	        -- PARTIDO 16
	        (16,5,'00:05:20',2,null,null),
	        (16,12,'00:06:20',2,null,null), --#88
			
	-- JUGADAS TIPO FALTA --
	        --partido 1---
	        (1,3,'00:10:20',3,null,null), --#89
	        (1,4,'00:11:53',3,null,null),
	        
	        ----partido 2----
	        (2,1,'00:10:30',3,null,null),
	        (2,2,'00:11:13',3,null,null),
			
			----partido 3----
	        (3,5,'00:10:30',3,null,null),
	        (3,9,'00:11:13',3,null,null),
	        
	        ---partido 4---
	        (4,6,'00:10:20',3,null,null),
	        (4,12,'00:11:20',3,null,null),
	        
	        ---partido 5
	        (5,7,'00:10:20',3,null,null),
	        (5,10,'00:11:20',3,null,null),

	        ----partido 6
	        (6,8,'00:10:20',3,null,null),
	        (6,11,'00:11:20',3,null,null),
	        
	        ----partido 7
	        (7,7,'00:10:20',3,null,null),
	        (7,9,'00:11:20',3,null,null),
	        
	        -----partido 8
	        (8,8,'00:10:20',3,null,null),
	        (8,10,'00:11:20',3,null,null),
	        
	        ----partido 9
	        (9,1,'00:10:20',3,null,null),
	        (9,12,'00:11:20',3,null,null),
	        
	        --partido 10
	        (10,2,'00:10:20',3,null,null),
	        (10,11,'00:11:20',3,null,null),
	        
	        ---partido 11
	        (11,12,'00:10:20',3,null,null),
	        (11,3,'00:11:20',3,null,null),
	        
	        ---partido 12
	        (12,5,'00:10:20',3,null,null),
	        (12,7,'00:11:20',3,null,null),
	        
	        ---partido 13
	        (13,9,'00:10:20',3,null,null),
	        (13,6,'00:11:20',3,null,null),
	        
	        ---partido 14
	        (14,5,'00:10:20',3,null,null),
	        (14,2,'00:11:20',3,null,null),
	        
	        ---partido 15
	        (15,12,'00:10:20',3,null,null),
	        (15,9,'00:11:20',3,null,null),

	        --partid0 16
	        (16,5,'00:10:20',3,null,null),
	        (16,12,'00:11:20',3,null,null), --#120
			
	-- JUGADAS TIPOS ASISTENCIAS
		-- PARTIDO 1
	        (1,33,'00:00:20',1,null,1), --#121
	        (1,33,'00:02:50',1,null,1),
			(1,33,'00:00:20',3,null,1),
			
	        (1,34,'00:01:53',3,null,1),
	        (1,34,'00:02:13',3,null,1),
			
		-- PARTIDO 2
			(2,31,'00:01:33',1,null,1),
			
			(2,32,'00:05:17',1,null,1),
			(2,32,'00:02:43',2,null,1),
			
		-- PARTIDO 3
			(3,35,'00:07:51',2,null,1),
			(3,35,'00:09:25',2,null,1),
			
			(3,39,'00:05:43',3,null,1),
			
		-- PARTIDO 4
			(4,36,'00:03:02',1,null,1),
			(4,36,'00:04:17',2,null,1),
			
			(4,42,'00:05:46',2,null,1),
	        (4,42,'00:06:56',2,null,1),
			
		-- PARTIDO 5
			(5,37,'00:01:02',1,null,1),
			(5,37,'00:03:17',2,null,1),
			
			(5,40,'00:05:46',2,null,1),
			
		-- PARTIDO 6
			(6,38,'00:05:02',1,null,1),
			
			(6,41,'00:05:46',1,null,1),
			(6,41,'00:07:46',1,null,1),
			
		-- PARTIDO 7
			(7,37,'00:03:02',1,null,1),
			(7,37,'00:05:46',1,null,1),
			
			(7,39,'00:07:46',1,null,1),
			(7,39,'00:08:46',1,null,1),
			
		-- PARTIDO 8
			(8,38,'00:05:02',1,null,1),
			
			(8,40,'00:05:46',1,null,1),
			
		-- PARTIDO 9
			(9,31,'00:05:02',1,null,1),
			
			(9,42,'00:05:46',1,null,1),
			(9,42,'00:07:46',1,null,1),
			
		-- PARTIDO 10
			(10,32,'00:05:02',1,null,1),
			(10,32,'00:06:46',1,null,1),
			
			(10,41,'00:07:46',1,null,1),
			
		-- PARTIDO 11
			(11,42,'00:05:02',1,null,1),
			(11,42,'00:06:46',1,null,1),
			
			(11,33,'00:07:46',1,null,1),
			
		-- PARTIDO 12
			(12,35,'00:05:02',1,null,1),
			(12,35,'00:06:46',1,null,1),
			
			(12,37,'00:07:46',1,null,1),
			(12,37,'00:03:46',1,null,1),
			
		-- PARTIDO 13
			(13,39,'00:05:02',1,null,1),
			
			(13,36,'00:07:46',1,null,1),
			
		-- PARTIDO 14
			(14,35,'00:05:02',1,null,1),
			
			(14,32,'00:07:46',1,null,1),
			
		-- PARTIDO 15
			(15,42,'00:05:02',1,null,1),
			(15,42,'00:07:46',1,null,1),
			
		-- PARTIDO 16
			(16,35,'00:05:02',1,null,1),
			(16,35,'00:07:46',1,null,1),

			(16,42,'00:03:46',1,null,1), --#169
			
	-- JUGADAS TIPOS BLOQUEO
		-- PARTIDO 1
	        (1,3,'00:00:20',1,null,2), --#170
			
	        (1,34,'00:01:53',3,null,2),
	        (1,34,'00:02:13',3,null,2),
			
		-- PARTIDO 2
			(2,1,'00:01:33',1,null,2),
			
		-- PARTIDO 3
			(3,35,'00:07:51',2,null,2),
			
			(3,9,'00:05:43',3,null,2),
			
		-- PARTIDO 4
			(4,36,'00:03:02',1,null,2),
			
		-- PARTIDO 5
			(5,7,'00:01:02',1,null,2),
			
			(5,40,'00:05:46',2,null,2),
			
		-- PARTIDO 6
			(6,1,'00:05:46',1,null,2),
			(6,1,'00:07:46',1,null,2),
			
		-- PARTIDO 7
			(7,37,'00:03:02',1,null,2),
			(7,7,'00:05:46',1,null,2),
			
			(7,39,'00:08:46',1,null,2),
			
		-- PARTIDO 8
			(8,38,'00:05:02',1,null,2),
			
		-- PARTIDO 9
			(9,31,'00:05:02',1,null,2),
			
			(9,42,'00:05:46',1,null,2),
			(9,2,'00:07:46',1,null,2),
			
		-- PARTIDO 10
			(10,32,'00:05:02',1,null,2),
			
			(10,41,'00:07:46',1,null,2),
			
		-- PARTIDO 11
			(11,2,'00:05:02',1,null,2),
			(11,42,'00:06:46',1,null,2),
			
			
		-- PARTIDO 12
			(12,35,'00:05:02',1,null,2),
			
			(12,7,'00:03:46',1,null,2),
			
		-- PARTIDO 13
			(13,9,'00:05:02',1,null,2),
			
			
		-- PARTIDO 14
			(14,35,'00:05:02',1,null,2),
			
			(14,2,'00:07:46',1,null,2),
			
		-- PARTIDO 15
			(15,2,'00:07:46',1,null,2),
			
		-- PARTIDO 16
			(16,35,'00:07:46',1,null,2),

			(16,2,'00:03:46',1,null,2), --#201
			
	-- JUGADAS TIPO ROBO --
	        --partido 1---
	        (1,3,'00:10:20',3,null,3), --#202
	        (1,34,'00:11:53',3,null,3),
	        
	        ----partido 2----
	        (2,31,'00:10:30',3,null,3),
	        (2,32,'00:11:13',3,null,3),
			
			----partido 3----
	        (3,5,'00:10:30',3,null,3),
	        (3,39,'00:11:13',3,null,3),
	        
	        ---partido 4---
	        (4,36,'00:10:20',3,null,3),
	        (4,12,'00:11:20',3,null,3),
	        
	        ---partido 5
	        (5,7,'00:10:20',3,null,3),
	        (5,40,'00:11:20',3,null,3),

	        ----partido 6
	        (6,38,'00:10:20',3,null,3),
	        (6,11,'00:11:20',3,null,3),
	        
	        ----partido 7
	        (7,7,'00:10:20',3,null,3),
	        (7,39,'00:11:20',3,null,3),
	        
	        -----partido 8
	        (8,8,'00:10:20',3,null,3),
	        (8,40,'00:11:20',3,null,3),
	        
	        ----partido 9
	        (9,31,'00:10:20',3,null,3),
	        (9,12,'00:11:20',3,null,3),
	        
	        --partido 10
	        (10,2,'00:10:20',3,null,3),
	        (10,41,'00:11:20',3,null,3),
	        
	        ---partido 11
	        (11,12,'00:10:20',3,null,3),
	        (11,33,'00:11:20',3,null,3),
	        
	        ---partido 12
	        (12,5,'00:10:20',3,null,3),
	        (12,37,'00:11:20',3,null,3),
	        
	        ---partido 13
	        (13,39,'00:10:20',3,null,3),
	        (13,36,'00:11:20',3,null,3),
	        
	        ---partido 14
	        (14,5,'00:10:20',3,null,3),
	        (14,32,'00:11:20',3,null,3),
	        
	        ---partido 15
	        (15,42,'00:10:20',3,null,3),
	        (15,39,'00:11:20',3,null,3),

	        --partid0 16
	        (16,5,'00:10:20',3,null,3),
	        (16,42,'00:11:20',3,null,3); --#233

INSERT INTO TiposLanzamientos(nombre, puntos) VALUES('Tiro libre',1),('Doble',2),('Triple',3);

----------------------
--   ANOTACIONES    --
----------------------
INSERT INTO Anotaciones(idJugada,idTipoLanzamiento)
	VALUES 
	-- PARTIDO 1
        (1,3),
		(2,3),
		(3,1),
		
        (4,2),
		(5,1),
		
	-- PARTIDO 2
        (6,2),
		
        (7,3),
		(8,2),
		
	-- PARTIDO 3
        (9,2),
		(10,2),
		
		(11,3),
	
	-- PARTIDO 4
        (12,3),
		(13,3),
		
        (14,2),
		(15,2),
		
	-- PARTIDO 5
        (16,3),
		(17,2),
		
		(18,2),
		
	-- PARTIDO 6
        (19,3),
		
		(20,2),
		(21,2),
		
	-- PARTIDO 7
        (22,2),
		(23,2),
		
        (24,3),
		(25,2),
		
	-- PARTIDO 8
        (26,2),
		
		(27,3),
		
	-- PARTIDO 9
        (28,1),
		
		(29,3),
		(30,2),
		
	-- PARTIDO 10
        (31,2),
		(32,2),
		
		(33,3),
		
	-- PARTIDO 11
        (34,2),
		(35,2),
		
		(36,2),
		
	-- PARTIDO 12
        (37,3),
		(38,2),
		
		(39,2),
		(40,1),
	
	-- PARTIDO 13
        (41,2),
		
		(42,1),
		
	-- PARTIDO 14
        (43,2),
		
		(44,1),
	
	-- PARTIDO 15
        (45,2),
		(46,2),
		
	-- PARTIDO 15
        (47,2),
		(48,2),
		
		(49,2);
			
INSERT INTO TiposRebotes(nombre)
	VALUES ('Defensivo'),
	        ('Ofensivo');	

----------------------
--     REBOTES      --
----------------------
INSERT INTO Rebotes(idJugada, idTipoRebote)
	 VALUES 
		(50,2),
		(51,1),
		(52,2),
		(53,1),
		(54,1),
		(55,1),
		(56,2),
		(57,2),
		(58,2),
		(59,2),
		(60,1),
		(61,2),
		(62,1),
		(63,1),
		(64,2),
		(65,1),
		(66,1),
		(67,1),
		(68,1),
		(69,1),
		(70,1),
		(71,1),
		(72,2),
		(73,1),
		(74,1),
		(75,2),
		(76,2),
		(77,2),
		(78,2),
		(79,2),
		(80,2),
		(81,1),
		(82,2),
		(83,1),
		(84,1),
		(85,2),
		(86,2),
		(87,2),
		(88,1);
	
INSERT INTO TiposDeFalta(idTipoFalta, nombre)
	 VALUES (1, 'Contacto Ilegal'),
	        (2, 'Contacto Antideportivo'),
	        (3, 'Tecnica');       
			
----------------------
--      FALTAS      --
----------------------
INSERT INTO Faltas(idJugada, nombre, idTipoFalta)
	 VALUES
	          (89, 'contacto ilegal', 1), ---partido 1
	          (90, 'obstruccion', 3),
	          
	          (91, 'contacto innecesario', 2), ---partido 2
	          (92, 'obstruccion', 3),
	          
	          (93, 'contacto innecesario', 2), ---partido 3
	          (94, 'obstruccion', 3),
	          
	          (95, 'contacto innecesario', 2), ---partido 4
	          (96, 'obstruccion', 3),
	          
	          (97, 'contacto innecesario', 2), ---partido 5
	          (98, 'obstruccion', 3),
	          
	          (99, 'contacto innecesario', 2), ---partido 6
	          (100, 'obstruccion', 3),
	          
	          (101, 'contacto ilegal', 1), ---partido 7
	          (102, 'obstruccion', 3),
	          
	          (103, 'contacto ilegal', 1), ---partido 8
	          (104, 'obstruccion', 3),
	          
	          (105, 'contacto ilegal', 1), ---partido 9
	          (106, 'obstruccion', 3),
	          
	          (107, 'contacto ilegal', 1), ---partido 10
	          (108, 'obstruccion', 3),
	          
	          (109, 'contacto innecesario', 2), ---partido 11
	          (110, 'obstruccion', 3),
	          
	          (111, 'contacto innecesario', 2), ---partido 12
	          (112, 'obstruccion', 3),
	          
	          (113, 'contacto innecesario', 2), ---partido 13
	          (114, 'obstruccion', 3),
	          
	          (115, 'contacto ilegal', 1), ---partido 14
	          (116, 'obstruccion', 3),
	          
	          (117, 'contacto ilegal', 1), ---partido 15
	          (118, 'obstruccion', 3),
	          
	          (119, 'contacto ilegal', 1), ---partido 16
	          (120, 'obstruccion', 3);
			  