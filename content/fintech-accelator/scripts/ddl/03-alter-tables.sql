-- ##################################################
-- #         MUSICDB ALTER TABLE SCRIPT             #
-- ##################################################
-- This script contains 5 alterations to enhance the MusicDB database structure,
-- including adding new columns, modifying constraints, and implementing additional
-- validation rules to better support the system requirements.

-- ##################################################
-- #                ALTERATIONS                     #
-- ##################################################

-- STEP 1: Add a 'popularidad' column to the ARTISTAS table to track artist popularity rating
-- This helps with recommendations and popular artist listings
ALTER TABLE vibesia.ARTISTAS 
ADD COLUMN popularidad INTEGER DEFAULT 0 CHECK (popularidad BETWEEN 0 AND 100);

COMMENT ON COLUMN vibesia.ARTISTAS.popularidad IS 'Índice de popularidad del artista (0-100)';

-- STEP 2: Add a 'explicit' flag to CANCIONES table to mark songs with explicit content
-- This allows for content filtering, especially for younger users
ALTER TABLE vibesia.CANCIONES 
ADD COLUMN contenido_explicito BOOLEAN DEFAULT FALSE;

COMMENT ON COLUMN vibesia.CANCIONES.contenido_explicito IS 'Indica si la canción contiene lenguaje o temática para adultos';

-- STEP 3: Create a unique constraint on PLAYLISTS to ensure no duplicate playlist names per user
-- This prevents confusion with identical playlist names for the same user
ALTER TABLE vibesia.PLAYLISTS 
ADD CONSTRAINT uq_playlist_nombre_por_usuario UNIQUE (usuario_id, nombre);

COMMENT ON CONSTRAINT uq_playlist_nombre_por_usuario ON vibesia.PLAYLISTS IS 'Garantiza que un usuario no pueda tener dos playlists con el mismo nombre';

-- STEP 4: Add fecha_ultima_reproduccion to USUARIO_DISPOSITIVO to track when a user last played music on each device
-- This allows tracking of recently used devices and inactive device cleanup
ALTER TABLE vibesia.USUARIO_DISPOSITIVO 
ADD COLUMN fecha_ultima_reproduccion TIMESTAMP;

COMMENT ON COLUMN vibesia.USUARIO_DISPOSITIVO.fecha_ultima_reproduccion IS 'Fecha y hora en que el usuario reprodujo música por última vez en este dispositivo';

-- STEP 5: Add a CHECK constraint to ALBUMES to ensure release year is valid
-- This ensures data integrity by preventing future release dates and very old dates
ALTER TABLE vibesia.ALBUMES 
ADD CONSTRAINT chk_anio_lanzamiento_valido CHECK (anio_lanzamiento BETWEEN 1900 AND EXTRACT(YEAR FROM CURRENT_DATE));

COMMENT ON CONSTRAINT chk_anio_lanzamiento_valido ON vibesia.ALBUMES IS 'Verifica que el año de lanzamiento sea válido (entre 1900 y el año actual)';

-- ##################################################
-- #               END ALTERATIONS                  #
-- ##################################################