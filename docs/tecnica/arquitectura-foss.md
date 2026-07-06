# Arquitectura

Ahorra YA está construido con una arquitectura cliente-servidor basada en tecnologías libres y de código abierto.

## Arquitectura general

El sistema se divide en tres capas principales:

| Capa | Descripción |
|---|---|
| Frontend | Aplicación web desarrollada con React. Presenta la interfaz de usuario, mapa, tiendas, ofertas, favoritos y reseñas. |
| Backend | API REST desarrollada con Spring Boot. Gestiona autenticación, lógica de negocio y comunicación con la base de datos. |
| Base de datos | PostgreSQL con PostGIS para almacenamiento relacional y soporte espacial. |

## Componentes principales

| Componente | Tecnología | Rol |
|---|---|---|
| Interfaz web | React 18 | Construcción de vistas y componentes. |
| Componentes visuales | Ant Design | Formularios, botones, tarjetas y elementos de interfaz. |
| Estilos | TailwindCSS | Personalización visual de la aplicación. |
| Mapas | Leaflet, React Leaflet, OpenStreetMap | Visualización de tiendas y elementos geográficos. |
| Rutas | Leaflet Routing Machine | Trazado de rutas hacia tiendas. |
| Mapa de calor | Leaflet Heat | Visualización de concentración de ofertas. |
| API REST | Spring Boot 3.3.0 | Servicios de backend. |
| Seguridad | Spring Security + JWT | Protección de endpoints y autenticación. |
| Persistencia | Spring Data JPA + Hibernate Spatial | Acceso a datos y soporte espacial. |
| Base de datos | PostgreSQL + PostGIS | Almacenamiento de información y datos geográficos. |
| Documentación | MkDocs + Material for MkDocs | Sitio de documentación del proyecto. |

## Flujo de comunicación

1. El usuario interactúa con la aplicación web.
2. El frontend consume la API REST mediante Axios.
3. Las peticiones protegidas envían un token JWT.
4. El backend valida el token con Spring Security.
5. Los servicios aplican la lógica de negocio.
6. Los repositorios consultan o actualizan PostgreSQL/PostGIS mediante JPA.
7. El backend responde en formato JSON.
8. El frontend actualiza la interfaz con la información recibida.

## Uso de componentes FOSS

El proyecto utiliza tecnologías FOSS en sus capas principales. Esto permite revisar, ejecutar, modificar y mantener la solución sin depender de componentes propietarios para su funcionamiento base.
