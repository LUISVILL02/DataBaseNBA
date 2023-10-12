-- CIUDADES --
CREATE TABLE Ciudades
(idCiudad SERIAL PRIMARY KEY,
nombre VARCHAR(50) NOT NULL
);

-- ESTADIOS --
CREATE TABLE Estadios
(idEstadio SERIAL PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
capacidad INT NOT NULL,
idCiudad INT NOT NULL,
FOREIGN KEY(idCiudad) REFERENCES Ciudades(idCiudad)
);

-- CONFERENCIAS --
CREATE TABLE Conferencias
(idConferencia SERIAL PRIMARY KEY,
 nombre VARCHAR(50) NOT NULL
);

-- DIVISIONES --
CREATE TABLE Divisiones
(idDivisión SERIAL PRIMARY KEY,
 nombre VARCHAR(50) NOT NULL,
 idConferencia INT NOT NULL,
 FOREIGN KEY(idConferencia) REFERENCES Conferencias(idConferencia)
);

-- EQUIPOS --
CREATE TABLE Equipos
(idEquipo SERIAL PRIMARY KEY,
 nombre VARCHAR(50) NOT NULL,
 abreviaturaNombre VARCHAR(3) NOT NULL,
 fechaCreación DATE NOT NULL,
 idDivisión INT NOT NULL,
 idEstadio INT NOT NULL,
 FOREIGN KEY(idDivisión) REFERENCES Divisiones(idDivisión),
 FOREIGN KEY(idEstadio) REFERENCES Estadios(idEstadio)
);

-- FASE DE TEMPORADA --
CREATE TABLE FasesDeTemporada
(idFaseTemporada SERIAL PRIMARY KEY,
 nombre VARCHAR(50) NOT NULL
);

-- TEMPORADAS --
CREATE TABLE Temporadas
(idTemporada SERIAL PRIMARY KEY,
 añoTemporada INT NOT NULL,
 idFaseTemporada INT NOT NULL,
 FOREIGN KEY(idFaseTemporada) REFERENCES FasesDeTemporada(idFaseTemporada)
);

-- TIPOS DE ESTADO DE TEMPORADA --
CREATE TABLE TiposEstadoTemporada
(idTipoEstado SERIAL PRIMARY KEY,
 nombre VARCHAR(50) NOT NULL
);

-- ESTADOS DE TEMPORADA --
CREATE TABLE EstadosTemporada
(idEstado SERIAL PRIMARY KEY,
 fechaCreación DATE NOT NULL,
 fechaCambio DATE NULL,
 idTemporada INT NOT NULL,
 idTipoEstado INT NOT NULL,
 FOREIGN KEY(idTemporada) REFERENCES Temporadas(idTemporada),
 FOREIGN KEY(idTipoEstado) REFERENCES TiposEstadoTemporada(idTipoEstado)
);

-- PARTICIPACIONES --
CREATE TABLE Participaciones
(idTemporada INT NOT NULL,
 idEquipo INT NOT NULL,
 PRIMARY KEY(idTemporada, idEquipo),
 FOREIGN KEY(idTemporada) REFERENCES Temporadas(idTemporada),
 FOREIGN KEY(idEquipo) REFERENCES Equipos(idEquipo)
);

-- CAMPEONATOS --
CREATE TABLE Campeonatos
(idCampeonato SERIAL PRIMARY KEY,
 idTemporada INT NOT NULL,
 idEquipoGanador INT NOT NULL,
 FOREIGN KEY(idTemporada) REFERENCES Temporadas(idTemporada),
 FOREIGN KEY(idEquipoGanador) REFERENCES Equipos(idEquipo)
);

-- PARTIDOS --
CREATE TABLE Partidos
(idPartido SERIAL PRIMARY KEY,
 idEquipoLocal INT NOT NULL,
 idEquipoVisitante INT NOT NULL,
 marcadorLocal INT NULL,
 marcadorVisitante INT NULL,
 fechaYHora TIMESTAMP NOT NULL,
 idTemporada INT NOT NULL,
 idEstadioJugado INT NOT NULL,
 FOREIGN KEY(idEquipoLocal) REFERENCES Equipos(idEquipo),
 FOREIGN KEY(idEquipoVisitante) REFERENCES Equipos(idEquipo),
 FOREIGN KEY(idTemporada) REFERENCES Temporadas(idTemporada),
 FOREIGN KEY(idEstadioJugado) REFERENCES Estadios(idEstadio),
 CONSTRAINT equiposValidos CHECK(idEquipoVisitante <> idEquipoLocal)
);

-- TIPOS DE ESTADO DEL PARTIDO --
CREATE TABLE TiposEstadoPartido
(idTipoEstado SERIAL PRIMARY KEY,
 nombre VARCHAR(50) NOT NULL
);

-- ESTADOS DEL PARTIDO --
CREATE TABLE EstadosPartido
(idEstado SERIAL PRIMARY KEY,
 fechaCreación DATE NOT NULL,
 fechaCambio DATE NULL,
 idPartido INT NOT NULL,
 idTipoEstado INT NOT NULL,
 FOREIGN KEY(idPartido) REFERENCES Partidos(idPartido),
 FOREIGN KEY(idTipoEstado) REFERENCES TiposEstadoPartido(idTipoEstado)
);

-- ARBITROS --

CREATE TABLE Árbitros
(idÁrbitro SERIAL PRIMARY KEY,
nombre VARCHAR(50) NOT NULL
);

-- JUECES DEL PARTIDO --
CREATE TABLE JuecesDelPartido
(idÁrbitro INT NOT NULL,
idPartido INT NOT NULL,
PRIMARY KEY (idÁrbitro, idPartido),
FOREIGN KEY(idÁrbitro) REFERENCES Árbitros(idÁrbitro),
FOREIGN KEY(idPartido) REFERENCES Partidos(idPartido)
);

-- PAISES --
CREATE TABLE Países 
(idPaís SERIAL PRIMARY KEY,
nombre VARCHAR(50) NOT NULL
);

-- PERSONAS --
CREATE TABLE Personas
(idPersona SERIAL PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
apellido VARCHAR(50) NOT NULL,
fechaNacimiento DATE NOT NULL,
idPaísNacimiento INT NOT NULL,
FOREIGN KEY (idPaísNacimiento) REFERENCES Países(idPaís)
);

-- TIPOS DE ESTADOS DE PERSONA --
CREATE TABLE TiposEstadoPersona
(idTipoEstado SERIAL PRIMARY KEY,
nombre VARCHAR(50) NOT NULL
);

-- ESTADOS DE PERSONA --
CREATE TABLE EstadosPersona
(idEstado SERIAL PRIMARY KEY,
fechaCreación DATE NOT NULL,
fechaCambio DATE NOT NULL,
idPersona INT NOT NULL,
idTipoEstado INT NOT NULL,
FOREIGN KEY(idPersona) REFERENCES Personas(idPersona),
FOREIGN KEY(idTipoEstado) REFERENCES TiposEstadoPersona(idTipoEstado)
);

-- JUGADORES --
CREATE TABLE Jugadores
(idPersona INT NOT NULL PRIMARY KEY,
peso DECIMAL NOT NULL,
altura DECIMAL NOT NULL,
añoDebut INT NOT NULL,
esDraft BOOLEAN NOT NULL,
idEquipo INT NOT NULL,
FOREIGN KEY(idPersona) REFERENCES Personas(idPersona),
FOREIGN KEY(idEquipo) REFERENCES Equipos(idEquipo)
); 

-- ENTRENADORES --
CREATE TABLE Entrenadores
(idPersona INT NOT NULL PRIMARY KEY,
esEntrenadorPrincipal BOOLEAN NOT NULL,
idEquipo INT NOT NULL,
FOREIGN KEY(idPersona) REFERENCES Personas(idPersona),
FOREIGN KEY(idEquipo) REFERENCES Equipos(idEquipo)
);

-- CARGOS --
CREATE TABLE Cargos
(idCargo SERIAL PRIMARY KEY,
nombre VARCHAR(50) NOT NULL
);

-- DIRECTIVOS --
CREATE TABLE Directivos
(idPersona INT NOT NULL PRIMARY KEY,
idCargo INT NOT NULL,
idEquipo INT NOT NULL,
FOREIGN KEY(idPersona) REFERENCES Personas(idPersona),
FOREIGN KEY(idCargo) REFERENCES Cargos(idCargo),
FOREIGN KEY(idEquipo) REFERENCES Equipos(idEquipo)
);

-- CONTRATOS --
CREATE TABLE Contratos
(idContrato SERIAL PRIMARY KEY,
fechaInicial DATE NOT NULL,
fechaFinal DATE NOT NULL,
salario DECIMAL NOT NULL,
idEquipo INT NOT NULL,
idPersona INT NOT NULL,
FOREIGN KEY(idPersona) REFERENCES Personas(idPersona),
FOREIGN KEY(idEquipo) REFERENCES Equipos(idEquipo)
);

-- POSICIONES--
CREATE TABLE Posiciones
(idPosición SERIAL PRIMARY KEY,
nombre VARCHAR(50) NOT NULL
);

-- CONTRATO JUGADOR --
CREATE TABLE ContratosJugador
(idContrato INT PRIMARY KEY,
dorsal INT NOT NULL,
idPosición INT NOT NULL,
FOREIGN KEY(idContrato) REFERENCES Contratos(idContrato),
FOREIGN KEY(idPosición) REFERENCES Posiciones(idPosición)
);

-- TIPOS DE JUGADA --
CREATE TABLE TiposDeJugada
(idTipoJugada SERIAL PRIMARY KEY,
nombre VARCHAR(50) NOT NULL
);

-- JUGADAS --
CREATE TABLE Jugadas
(idJugada SERIAL PRIMARY KEY,
idPartido INT NOT NULL,
idJugador INT NOT NULL,
tiempoJugada TIME NOT NULL,
cuartoTiempo INT NOT NULL,
descripción VARCHAR(300) NULL,
idTipoJugada INT NULL,
FOREIGN KEY(idJugador) REFERENCES Jugadores(idPersona),
FOREIGN KEY(idPartido) REFERENCES Partidos(idPartido),
FOREIGN KEY(idTipoJugada) REFERENCES TiposDeJugada(idTipoJugada)
);

-- TIPOS LANZAMIENTOS --
CREATE TABLE TiposLanzamientos
(idTipoLanzamiento SERIAL PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
puntos INT NOT NULL
);

-- ANOTACIONES --
CREATE TABLE Anotaciones
(idJugada INT PRIMARY KEY,
idTipoLanzamiento INT NOT NULL,
FOREIGN KEY(idJugada) REFERENCES Jugadas(idJugada),
FOREIGN KEY(idTipoLanzamiento) REFERENCES TiposLanzamientos(idTipoLanzamiento)
);

-- TIPOS REBOTES --
CREATE TABLE TiposRebotes
(idTipoRebote SERIAL PRIMARY KEY,
nombre VARCHAR(50) NOT NULL
);

-- REBOTES --
CREATE TABLE Rebotes
(idJugada INT PRIMARY KEY,
idTipoRebote INT NOT NULL,
FOREIGN KEY(idJugada) REFERENCES Jugadas(idJugada),
FOREIGN KEY(idTipoRebote) REFERENCES TiposRebotes(idTipoRebote)
);

-- TIPOS DE FALTA --
CREATE TABLE TiposDeFalta
(idTipoFalta INT PRIMARY KEY,
nombre VARCHAR(50) NOT NULL
);

-- FALTAS --
CREATE TABLE Faltas
(idJugada INT PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
idTipoFalta INT NOT NULL,
FOREIGN KEY(idJugada) REFERENCES Jugadas(idJugada),
FOREIGN KEY(idTipoFalta) REFERENCES TiposDeFalta(idTipoFalta)
);