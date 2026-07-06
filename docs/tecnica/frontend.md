# Frontend

El frontend es una aplicación web SPA construida con **React 18**, TypeScript/JavaScript, Ant Design, TailwindCSS y Leaflet.

## Rutas principales

| Ruta | Página | Descripción |
|---|---|---|
| `/` | Login | Inicio de sesión. |
| `/signin` | SetPassword | Registro o establecimiento de contraseña. |
| `/map` | Map | Mapa interactivo principal. |
| `/stores` | Stores | Listado y búsqueda de tiendas. |
| `/offers` | Offers | Listado y búsqueda de ofertas. |
| `/favorites` | Favorites | Tiendas favoritas del usuario. |

## Estructura principal

```text
Frontend/src/
├── pages/        # Vistas principales
├── components/   # Componentes reutilizables
├── api/          # Servicios Axios para consumir backend
├── assets/       # Logos, pines y estilos
└── interfaces/   # Interfaces TypeScript
```

## Componentes relevantes

| Componente | Función |
|---|---|
| `Map.jsx` | Mapa principal con tiendas, rutas, geolocalización y heatmap. |
| `Heatmap.tsx` | Capa de mapa de calor. |
| `NearbyFilter.tsx` | Filtro por cercanía con radio en kilómetros. |
| `StoreOffers.jsx` | Panel lateral de detalle de tienda. |
| `StoreReviews.jsx` | Reseñas y calificaciones de tienda. |
| `AddStoreForm.tsx` / `EditStoreForm.tsx` | Formularios de tiendas. |
| `AddOfferForm.tsx` / `EditOfferForm.tsx` | Formularios de ofertas. |
| `StoreCard.jsx` / `OfferCard.jsx` | Tarjetas visuales de tiendas y ofertas. |

## Usabilidad

La interfaz permite navegación simple por menú lateral, tarjetas de tiendas y ofertas, formularios modales, notificaciones con Toastify y componentes visuales de Ant Design. El diseño usa colores asociados a la identidad visual de Ahorra YA.
