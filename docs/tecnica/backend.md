# Backend

El backend está implementado con **Spring Boot 3.3.0** y Java 17. Expone una API REST para autenticación, usuarios, tiendas, ofertas, favoritos, imágenes, reseñas, categorías, departamentos y municipios.

## Estructura por capas

```text
Backend/ahorraya/src/main/java/com/grupo04/ahorraya/
├── controllers/      # Endpoints REST
├── services/         # Interfaces de servicios
├── servicesImpl/     # Lógica de negocio
├── Repository/       # Repositorios JPA
├── models/entities/  # Entidades de base de datos
├── models/dtos/      # DTOs de entrada y salida
├── configs/          # Seguridad y CORS
└── utils/            # JWT y manejo de errores
```

## Seguridad

El backend usa Spring Security con JWT.

- Las rutas `/auth/**` son públicas.
- El resto de endpoints requiere `Authorization: Bearer <token>`.
- Los tokens emitidos se guardan en la tabla `Token`.
- El cierre de sesión desactiva el token en base de datos.
- El backend es stateless: no mantiene sesión HTTP.

## Módulos implementados

| Módulo | Descripción |
|---|---|
| Auth | Registro, login, login con Google y cambio de contraseña. |
| User | Perfil y cierre de sesión. |
| Store | CRUD de tiendas, búsqueda y datos para mapa. |
| Offer | CRUD de ofertas y búsqueda. |
| Favorite | Tiendas favoritas por usuario. |
| Image | Subida, actualización y consulta de imágenes. |
| Review | Reseñas y calificaciones por tienda. |
| Category | Catálogo de categorías. |
| Departament | Catálogo de departamentos. |
| Municipality | Catálogo de municipios. |

## Soporte espacial

La entidad `Store` almacena la ubicación de la tienda de dos formas:

- `latitud` y `longuitud`, útiles para consumo directo desde el frontend.
- `ubicacion`, de tipo `Point`, con SRID 4326, para soporte espacial con PostGIS.

El backend construye el punto espacial usando JTS:

```java
new Coordinate(longitude, latitude)
```

El orden correcto es longitud primero y latitud después porque espacialmente corresponde a `X, Y`.
