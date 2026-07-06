# Integración Backend-Frontend

La integración entre el frontend y el backend se realiza mediante una **API REST**. El frontend consume los servicios del backend usando Axios y recibe las respuestas principalmente en formato JSON.

## Base URL

En los servicios del frontend se utiliza una URL base para apuntar al backend local:

```js
const baseURL = "http://localhost:8080";
```

Para un ambiente productivo, esta URL puede moverse a variables de entorno para evitar modificar el código fuente al cambiar de servidor.

## Autenticación en peticiones

Después del inicio de sesión, el token JWT se guarda en `localStorage`. Las peticiones protegidas envían el token en el encabezado `Authorization`.

```js
headers: {
  Authorization: `Bearer ${token}`
}
```

## Flujo de integración

| Paso | Descripción |
|---|---|
| 1 | El usuario inicia sesión desde el frontend. |
| 2 | El frontend envía las credenciales al backend. |
| 3 | El backend valida al usuario y retorna un token JWT. |
| 4 | El frontend guarda el token y lo adjunta en las siguientes peticiones. |
| 5 | El backend valida el token antes de procesar recursos protegidos. |
| 6 | El backend consulta la base de datos y retorna la información solicitada. |
| 7 | El frontend renderiza tiendas, ofertas, favoritos, reseñas o datos del mapa. |

## Servicios Axios

| Archivo | Recurso consumido |
|---|---|
| `auth.js` | Autenticación y logout. |
| `stores.js` | Gestión y consulta de tiendas. |
| `offer.js` | Gestión y consulta de ofertas. |
| `favorites.js` | Tiendas favoritas por usuario. |
| `reviews.js` | Reseñas y calificaciones. |
| `images.js` | Imágenes de tiendas y ofertas. |
| `heatmap.js` | Datos para el mapa de calor. |
| `categories.js` | Categorías. |
| `departments.js` | Departamentos. |
| `municipalities.js` | Municipios. |

## Gestión de imágenes

Las imágenes se envían como `multipart/form-data`. El backend guarda el archivo físico en `uploadDirectory` y almacena la referencia en la tabla `Imagen`.

Para mostrar imágenes, el frontend solicita el archivo como binario y genera una URL temporal con `URL.createObjectURL`.
