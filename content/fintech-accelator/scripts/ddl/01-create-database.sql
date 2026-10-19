-- ##################################################
-- #         MUSICDB DATABASE CREATION SCRIPT       #
-- ##################################################

-- 01. Create user
CREATE USER music_admin WITH PASSWORD 'Music_DB2025**';

-- 02. Create database (with ENCODING= 'UTF8', TEMPLATE=Template0, OWNER: music_admin)
CREATE DATABASE musicdb WITH 
    ENCODING='UTF8' 
    LC_COLLATE='es_CO.UTF-8' 
    LC_CTYPE='es_CO.UTF-8' 
    TEMPLATE=template0 
    OWNER = music_admin;

-- 03. Grant privileges
GRANT ALL PRIVILEGES ON DATABASE musicdb TO music_admin;

-- 04. Create Schema
CREATE SCHEMA IF NOT EXISTS vibesia AUTHORIZATION music_admin;

-- 05. Comment on database
COMMENT ON DATABASE musicdb IS 'Base de datos para el sistema de gestión musical personal/profesional';

-- 06. Comment on schema
COMMENT ON SCHEMA vibesia IS 'Esquema principal para el sistema de gestión musical';