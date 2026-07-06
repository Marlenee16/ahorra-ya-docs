# Referencia de API REST

Base URL local:

```text
http://localhost:8080
```

Excepto `/auth/**`, los endpoints requieren encabezado JWT:

```http
Authorization: Bearer <token>
```

## Autenticación `/auth`

| Método | Endpoint | Descripción |
|---|---|---|
| `GET` | `/auth/{email}` | Consulta usuario por correo. |
| `POST` | `/auth/login` | Inicio de sesión con correo y contraseña. |
| `POST` | `/auth/login-google` | Inicio de sesión con Google. |
| `POST` | `/auth/signup` | Registro de usuario. |
| `POST` | `/auth/change-password` | Cambio o establecimiento de contraseña. |

## Usuario `/user`

| Método | Endpoint | Descripción |
|---|---|---|
| `POST` | `/user/logout` | Cierra sesión y desactiva el token. |
| `GET` | `/user/profile` | Obtiene el perfil del usuario autenticado. |

## Tiendas `/store`

| Método | Endpoint | Descripción |
|---|---|---|
| `POST` | `/store/` | Crea una tienda. |
| `PUT` | `/store/` | Actualiza una tienda. |
| `DELETE` | `/store/{id}` | Elimina una tienda. |
| `GET` | `/store/` | Lista todas las tiendas. |
| `GET` | `/store/{id}` | Obtiene una tienda por ID. |
| `GET` | `/store/name/{name}` | Busca tiendas por nombre. |
| `GET` | `/store/department/{department}` | Busca tiendas por departamento. |
| `GET` | `/store/municipality/{municipality}` | Busca tiendas por municipio. |
| `GET` | `/store/offers/{id}` | Obtiene ofertas de una tienda. |
| `GET` | `/store/offers/active/{id}` | Obtiene ofertas activas de una tienda. |
| `GET` | `/store/map` | Obtiene datos ligeros de tiendas para el mapa. |
| `GET` | `/store/heatmap` | Obtiene puntos del mapa de calor. |

## Ofertas `/offer`

| Método | Endpoint | Descripción |
|---|---|---|
| `POST` | `/offer/` | Crea una oferta. |
| `PUT` | `/offer/` | Actualiza una oferta. |
| `DELETE` | `/offer/{id}` | Elimina una oferta. |
| `GET` | `/offer/` | Lista todas las ofertas. |
| `GET` | `/offer/name/{name}` | Busca ofertas por nombre. |
| `GET` | `/offer/{id}` | Obtiene una oferta por ID. |
| `GET` | `/offer/active/{active}` | Lista ofertas por estado activo/inactivo. |

## Favoritos `/favorite`

| Método | Endpoint | Descripción |
|---|---|---|
| `POST` | `/favorite/` | Agrega una tienda a favoritos. |
| `DELETE` | `/favorite/{storeId}` | Elimina una tienda de favoritos. |
| `GET` | `/favorite/` | Lista favoritos del usuario autenticado. |
| `GET` | `/favorite/{storeId}` | Verifica si una tienda es favorita. |

## Imágenes `/image`

| Método | Endpoint | Descripción |
|---|---|---|
| `POST` | `/image/` | Sube imagen asociada a tienda u oferta. |
| `PUT` | `/image/` | Actualiza imagen. |
| `DELETE` | `/image/{id}` | Elimina imagen por ID. |
| `GET` | `/image/{id}` | Obtiene archivo de imagen por ID. |
| `GET` | `/image/info/id/{id}` | Obtiene metadatos de imagen por ID. |
| `GET` | `/image/info/name/{name}` | Obtiene metadatos por nombre. |
| `GET` | `/image/info/store/{id}` | Obtiene metadatos de imagen de tienda. |
| `GET` | `/image/info/offer/{id}` | Obtiene metadatos de imagen de oferta. |
| `GET` | `/image/name/{name}` | Obtiene archivo de imagen por nombre. |
| `GET` | `/image/store/{id}` | Obtiene imagen de tienda. |
| `GET` | `/image/offer/{id}` | Obtiene imagen de oferta. |
| `DELETE` | `/image/offer/{id}` | Elimina imagen de oferta. |

## Reseñas `/review`

| Método | Endpoint | Descripción |
|---|---|---|
| `POST` | `/review/` | Crea una reseña. |
| `GET` | `/review/store/{storeId}` | Lista reseñas de una tienda. |
| `PUT` | `/review/{reviewId}` | Actualiza una reseña propia. |
| `DELETE` | `/review/{reviewId}` | Elimina una reseña propia. |

## Categorías `/category`

| Método | Endpoint | Descripción |
|---|---|---|
| `POST` | `/category/` | Crea categoría. |
| `POST` | `/category/update` | Actualiza categoría. |
| `DELETE` | `/category/` | Elimina categoría. |
| `GET` | `/category/` | Lista categorías. |
| `GET` | `/category/{id}` | Obtiene categoría por ID. |
| `GET` | `/category/offer/{id}` | Obtiene ofertas por categoría. |
| `GET` | `/category/offer/active/{id}` | Obtiene ofertas activas por categoría. |

## Departamentos `/departament`

| Método | Endpoint | Descripción |
|---|---|---|
| `POST` | `/departament/` | Crea departamento. |
| `DELETE` | `/departament/{name}` | Elimina departamento. |
| `GET` | `/departament/` | Lista departamentos. |
| `GET` | `/departament/{name}` | Obtiene departamento por nombre. |
| `GET` | `/departament/stores/{id}` | Lista tiendas de un departamento. |
| `GET` | `/departament/municipalities/{name}` | Lista municipios de un departamento. |

## Municipios `/municipality`

| Método | Endpoint | Descripción |
|---|---|---|
| `POST` | `/municipality/` | Crea municipio. |
| `DELETE` | `/municipality/{name}` | Elimina municipio. |
| `GET` | `/municipality/` | Lista municipios. |
| `GET` | `/municipality/{name}` | Obtiene municipio por nombre. |
| `GET` | `/municipality/stores/{name}` | Lista tiendas de un municipio. |
