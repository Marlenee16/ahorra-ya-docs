CREATE EXTENSION IF NOT EXISTS pgcrypto;
CREATE EXTENSION IF NOT EXISTS postgis;

CREATE TABLE IF NOT EXISTS Usuario(
    id_user UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    email VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR NULL,
    state BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE IF NOT EXISTS Token (
    id_token UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    token VARCHAR NOT NULL,
    fecha_creacion TIMESTAMP WITHOUT TIME ZONE NULL DEFAULT CURRENT_TIMESTAMP,
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    id_user UUID REFERENCES Usuario(id_user)
);

CREATE TABLE IF NOT EXISTS Departamento (
    id_departamento UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    nombre VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS Municipio (
    id_municipio UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    nombre VARCHAR(100) UNIQUE NOT NULL,
    id_departamento UUID NOT NULL REFERENCES Departamento(id_departamento)
);

CREATE TABLE IF NOT EXISTS Categoria (
    id_categoria UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    nombre VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS Tienda (
    id_tienda UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    nombre VARCHAR(100) UNIQUE NOT NULL,
    descripcion VARCHAR(255) NOT NULL,
    latitud DOUBLE PRECISION NOT NULL,
    longuitud DOUBLE PRECISION NOT NULL,
    ubicacion GEOGRAPHY(Point, 4326),
    id_departamento UUID NOT NULL REFERENCES Departamento(id_departamento),
    id_municipio UUID NOT NULL REFERENCES Municipio(id_municipio),
    direccion VARCHAR(255) NOT NULL,
    nombre_propietario VARCHAR(100),
    sitio_web VARCHAR(255),
    telefono VARCHAR(20),
    correo_electronico VARCHAR(60)
);

CREATE INDEX IF NOT EXISTS idx_tienda_ubicacion
ON Tienda
USING GIST (ubicacion);

CREATE TABLE IF NOT EXISTS Oferta (
    id_oferta UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    nombre VARCHAR(200) NOT NULL,
    descripcion VARCHAR(255) NOT NULL,
    precio_anterior FLOAT,
    precio_actual FLOAT NOT NULL,
    fecha_inicio VARCHAR NOT NULL,
    fecha_fin VARCHAR NOT NULL,
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    id_tienda UUID NOT NULL REFERENCES Tienda(id_tienda),
    id_categoria UUID NOT NULL REFERENCES Categoria(id_categoria)
);

CREATE TABLE IF NOT EXISTS Favorito (
    id_favorito UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    id_user UUID NOT NULL REFERENCES Usuario(id_user),
    id_tienda UUID NOT NULL REFERENCES Tienda(id_tienda)
);

CREATE TABLE IF NOT EXISTS Imagen (
    id_imagen UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    nombre VARCHAR NOT NULL,
    url VARCHAR NOT NULL,
    id_tienda UUID REFERENCES Tienda(id_tienda),
    id_oferta UUID REFERENCES Oferta(id_oferta)
);

CREATE TABLE IF NOT EXISTS Resena (
    id_resena UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    id_user UUID NOT NULL,
    id_tienda UUID NOT NULL,
    calificacion INTEGER NOT NULL CHECK (calificacion BETWEEN 1 AND 5),
    comentario VARCHAR(500),
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    activo BOOLEAN DEFAULT TRUE,
    CONSTRAINT fk_resena_usuario FOREIGN KEY (id_user) REFERENCES Usuario(id_user),
    CONSTRAINT fk_resena_tienda FOREIGN KEY (id_tienda) REFERENCES Tienda(id_tienda),
    CONSTRAINT unique_resena_usuario_tienda UNIQUE (id_user, id_tienda)
);

-- Poblar ubicación espacial para tiendas existentes:
UPDATE Tienda
SET ubicacion = ST_SetSRID(ST_MakePoint(longuitud, latitud), 4326)::geography
WHERE ubicacion IS NULL
  AND latitud IS NOT NULL
  AND longuitud IS NOT NULL;
