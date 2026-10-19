-- ##################################################
-- #            DDL SCRIPT DOCUMENTATION            #
-- ##################################################
-- This script defines the database structure for a music management system
-- Includes tables for ARTISTAS, ALBUMES, CANCIONES, GENEROS, USUARIOS, PLAYLISTS,
-- DISPOSITIVOS, and tracking tables for relationships and usage data.
-- The system is designed to manage music libraries, playlists, and user listening patterns,
-- supporting comprehensive music organization, playlist management, and listening analytics.
-- All tables include appropriate constraints, relationships, and data types to ensure 
-- data integrity and optimal performance.

-- ##################################################
-- #              TABLE DEFINITIONS                 #
-- ##################################################

-- Independent tables first
-- Table: vibesia.ARTISTAS
-- Brief: Stores information about music artists (soloists, bands, etc.)
CREATE TABLE IF NOT EXISTS vibesia.ARTISTAS (
    artista_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    pais_origen VARCHAR(50) NOT NULL,
    anio_formacion INTEGER,
    biografia TEXT,
    tipo VARCHAR(20) NOT NULL CHECK (tipo IN ('solista', 'banda', 'colectivo', 'dúo', 'otro'))
);

-- Table: vibesia.GENEROS
-- Brief: Catalog of music genres for categorization
CREATE TABLE IF NOT EXISTS vibesia.GENEROS (
    genero_id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    descripcion TEXT
);

-- Table: vibesia.USUARIOS
-- Brief: System users who manage music libraries and playlists
CREATE TABLE IF NOT EXISTS vibesia.USUARIOS (
    usuario_id SERIAL PRIMARY KEY,
    nombre_usuario VARCHAR(50) NOT NULL UNIQUE,
    correo_electronico VARCHAR(100) NOT NULL UNIQUE,
    fecha_registro DATE NOT NULL DEFAULT CURRENT_DATE,
    preferencias TEXT
);

-- Table: vibesia.DISPOSITIVOS
-- Brief: Devices used to play music through the system
CREATE TABLE IF NOT EXISTS vibesia.DISPOSITIVOS (
    dispositivo_id SERIAL PRIMARY KEY,
    tipo VARCHAR(50) NOT NULL,
    sistema_operativo VARCHAR(50) NOT NULL
);

-- Dependent tables
-- Table: vibesia.ALBUMES
-- Brief: Music albums associated with artists
CREATE TABLE IF NOT EXISTS vibesia.ALBUMES (
    album_id SERIAL PRIMARY KEY,
    artista_id INTEGER NOT NULL,
    titulo VARCHAR(150) NOT NULL,
    anio_lanzamiento INTEGER NOT NULL,
    discografica VARCHAR(100),
    tipo_album VARCHAR(20) NOT NULL CHECK (tipo_album IN ('estudio', 'directo', 'recopilatorio', 'remix', 'otro')),
    portada VARCHAR(255)
);

-- Table: vibesia.CANCIONES
-- Brief: Individual songs from albums
CREATE TABLE IF NOT EXISTS vibesia.CANCIONES (
    cancion_id SERIAL PRIMARY KEY,
    album_id INTEGER NOT NULL,
    titulo VARCHAR(150) NOT NULL,
    duracion_segundos INTEGER NOT NULL CHECK (duracion_segundos > 0),
    numero_pista INTEGER NOT NULL,
    compositor VARCHAR(100),
    letra TEXT,
    ruta_archivo VARCHAR(255) NOT NULL
);

-- Table: vibesia.PLAYLISTS
-- Brief: User-created collections of songs
CREATE TABLE IF NOT EXISTS vibesia.PLAYLISTS (
    playlist_id SERIAL PRIMARY KEY,
    usuario_id INTEGER NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    fecha_creacion DATE NOT NULL DEFAULT CURRENT_DATE,
    descripcion TEXT,
    es_publica BOOLEAN NOT NULL DEFAULT FALSE
);

-- Relationship tables
-- Table: vibesia.CANCION_GENERO
-- Brief: Many-to-many relationship between songs and genres
CREATE TABLE IF NOT EXISTS vibesia.CANCION_GENERO (
    cancion_id INTEGER NOT NULL,
    genero_id INTEGER NOT NULL,
    PRIMARY KEY (cancion_id, genero_id)
);

-- Table: vibesia.PLAYLIST_CANCION
-- Brief: Songs included in playlists with ordering information
CREATE TABLE IF NOT EXISTS vibesia.PLAYLIST_CANCION (
    playlist_id INTEGER NOT NULL,
    cancion_id INTEGER NOT NULL,
    orden INTEGER NOT NULL,
    PRIMARY KEY (playlist_id, cancion_id)
);

-- Table: vibesia.USUARIO_DISPOSITIVO
-- Brief: Devices associated with users and their usage history
CREATE TABLE IF NOT EXISTS vibesia.USUARIO_DISPOSITIVO (
    usuario_id INTEGER NOT NULL,
    dispositivo_id INTEGER NOT NULL,
    fecha_registro DATE NOT NULL DEFAULT CURRENT_DATE,
    ultimo_acceso TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (usuario_id, dispositivo_id)
);

-- Table: vibesia.REPRODUCCIONES
-- Brief: Track of song playbacks by users on specific devices
CREATE TABLE IF NOT EXISTS vibesia.REPRODUCCIONES (
    reproduccion_id SERIAL PRIMARY KEY,
    usuario_id INTEGER NOT NULL,
    cancion_id INTEGER NOT NULL,
    dispositivo_id INTEGER NOT NULL,
    fecha_hora TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    completada BOOLEAN NOT NULL DEFAULT TRUE,
    calificacion INTEGER CHECK (calificacion BETWEEN 1 AND 5)
);

-- ##################################################
-- #            RELATIONSHIP DEFINITIONS            #
-- ##################################################

-- Relationships for ALBUMES
ALTER TABLE vibesia.ALBUMES ADD CONSTRAINT fk_albumes_artistas 
    FOREIGN KEY (artista_id) REFERENCES vibesia.ARTISTAS (artista_id)
    ON UPDATE CASCADE ON DELETE RESTRICT;

-- Relationships for CANCIONES
ALTER TABLE vibesia.CANCIONES ADD CONSTRAINT fk_canciones_albumes 
    FOREIGN KEY (album_id) REFERENCES vibesia.ALBUMES (album_id)
    ON UPDATE CASCADE ON DELETE RESTRICT;

-- Relationships for PLAYLISTS
ALTER TABLE vibesia.PLAYLISTS ADD CONSTRAINT fk_playlists_usuarios 
    FOREIGN KEY (usuario_id) REFERENCES vibesia.USUARIOS (usuario_id)
    ON UPDATE CASCADE ON DELETE CASCADE;

-- Relationships for CANCION_GENERO
ALTER TABLE vibesia.CANCION_GENERO ADD CONSTRAINT fk_cancion_genero_canciones 
    FOREIGN KEY (cancion_id) REFERENCES vibesia.CANCIONES (cancion_id)
    ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE vibesia.CANCION_GENERO ADD CONSTRAINT fk_cancion_genero_generos 
    FOREIGN KEY (genero_id) REFERENCES vibesia.GENEROS (genero_id)
    ON UPDATE CASCADE ON DELETE RESTRICT;

-- Relationships for PLAYLIST_CANCION
ALTER TABLE vibesia.PLAYLIST_CANCION ADD CONSTRAINT fk_playlist_cancion_playlists 
    FOREIGN KEY (playlist_id) REFERENCES vibesia.PLAYLISTS (playlist_id)
    ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE vibesia.PLAYLIST_CANCION ADD CONSTRAINT fk_playlist_cancion_canciones 
    FOREIGN KEY (cancion_id) REFERENCES vibesia.CANCIONES (cancion_id)
    ON UPDATE CASCADE ON DELETE CASCADE;

-- Relationships for USUARIO_DISPOSITIVO
ALTER TABLE vibesia.USUARIO_DISPOSITIVO ADD CONSTRAINT fk_usuario_dispositivo_usuarios 
    FOREIGN KEY (usuario_id) REFERENCES vibesia.USUARIOS (usuario_id)
    ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE vibesia.USUARIO_DISPOSITIVO ADD CONSTRAINT fk_usuario_dispositivo_dispositivos 
    FOREIGN KEY (dispositivo_id) REFERENCES vibesia.DISPOSITIVOS (dispositivo_id)
    ON UPDATE CASCADE ON DELETE CASCADE;

-- Relationships for REPRODUCCIONES
ALTER TABLE vibesia.REPRODUCCIONES ADD CONSTRAINT fk_reproducciones_usuarios 
    FOREIGN KEY (usuario_id) REFERENCES vibesia.USUARIOS (usuario_id)
    ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE vibesia.REPRODUCCIONES ADD CONSTRAINT fk_reproducciones_canciones 
    FOREIGN KEY (cancion_id) REFERENCES vibesia.CANCIONES (cancion_id)
    ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE vibesia.REPRODUCCIONES ADD CONSTRAINT fk_reproducciones_dispositivos 
    FOREIGN KEY (dispositivo_id) REFERENCES vibesia.DISPOSITIVOS (dispositivo_id)
    ON UPDATE CASCADE ON DELETE RESTRICT;

-- ##################################################
-- #             INDEX DEFINITIONS                  #
-- ##################################################

-- Indexes for optimizing frequently queried fields
CREATE INDEX idx_canciones_titulo ON vibesia.CANCIONES (titulo);
CREATE INDEX idx_artistas_nombre ON vibesia.ARTISTAS (nombre);
CREATE INDEX idx_albumes_titulo ON vibesia.ALBUMES (titulo);
CREATE INDEX idx_playlists_nombre ON vibesia.PLAYLISTS (nombre);
CREATE INDEX idx_reproducciones_fecha ON vibesia.REPRODUCCIONES (fecha_hora);
CREATE INDEX idx_reproducciones_usuario_cancion ON vibesia.REPRODUCCIONES (usuario_id, cancion_id);
CREATE INDEX idx_generos_nombre ON vibesia.GENEROS (nombre);

-- ##################################################
-- #               END DOCUMENTATION                #
-- ##################################################