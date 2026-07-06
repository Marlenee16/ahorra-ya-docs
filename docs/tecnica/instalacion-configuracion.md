# Instalación y configuración

Esta guía permite reproducir el proyecto localmente.

## Requisitos

| Herramienta | Versión recomendada |
|---|---|
| Java JDK | 17 |
| Gradle | Wrapper incluido en el backend |
| Node.js | 18 o superior |
| npm | 9 o superior |
| PostgreSQL | 13 o superior |
| PostGIS | Compatible con la versión de PostgreSQL instalada |
| Git | 2.x |

## Base de datos

Crear la base:

```sql
CREATE DATABASE ahorra_ya;
```

Activar extensiones dentro de la base:

```sql
CREATE EXTENSION IF NOT EXISTS pgcrypto;
CREATE EXTENSION IF NOT EXISTS postgis;
```

Ejecutar el script actualizado:

```text
docs/database/schema-postgis.sql
```

## Configuración del backend

Archivo:

```text
Backend/ahorraya/src/main/resources/application.properties
```

Configuración local de ejemplo:

```properties
spring.datasource.url=jdbc:postgresql://localhost:5432/ahorra_ya
spring.datasource.username=admin
spring.datasource.password=admin123
spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.PostgreSQLDialect
spring.servlet.multipart.max-file-size=10MB
spring.servlet.multipart.max-request-size=10MB
app.upload.directory=uploadDirectory
jwt.secret=CAMBIAR_ESTE_SECRETO
jwt.exptime=1296000000
```

!!! warning "Seguridad"
    Las credenciales y el secreto JWT no deben publicarse en un entorno real. Para producción deben moverse a variables de entorno.

## Levantar backend

```bash
cd Backend/ahorraya
./gradlew bootRun
```

En Windows:

```powershell
cd Backend/ahorraya
.\gradlew.bat bootRun
```

El backend levanta en:

```text
http://localhost:8080
```

## Levantar frontend

```bash
cd Frontend
npm install
npm start
```

Comando usado por el equipo durante desarrollo:

```bash
npm run start dev
```

La aplicación web levanta en:

```text
http://localhost:3000
```



