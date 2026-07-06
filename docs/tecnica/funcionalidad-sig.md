# Funcionalidad SIG

La funcionalidad SIG es el núcleo geográfico de Ahorra YA. El sistema usa coordenadas, mapas, geolocalización, rutas, filtros por distancia, mapa de calor y soporte espacial en base de datos.

## Datos geográficos

Cada tienda almacena:

| Campo | Descripción |
|---|---|
| `latitud` | Coordenada de latitud. |
| `longuitud` | Coordenada de longitud. |
| `ubicacion` | Punto espacial `GEOGRAPHY(Point, 4326)` en PostGIS. |

El SRID 4326 corresponde a WGS84, usado comúnmente por GPS y mapas web.

## Mapa interactivo

El mapa se implementa con Leaflet y OpenStreetMap. Permite visualizar tiendas como marcadores, abrir el detalle de una tienda y alternar capas.

## Geolocalización

El sistema puede obtener la ubicación actual del usuario mediante la API de geolocalización del navegador. Esta ubicación se usa para rutas y filtro por cercanía.

## Ruteo

El ruteo hacia una tienda se implementa con `leaflet-routing-machine`. El usuario puede seleccionar una tienda y visualizar la ruta desde su posición actual hacia el comercio.

## Filtro por cercanía

El filtro de cercanía permite seleccionar un punto y un radio de búsqueda. El sistema calcula la distancia entre ese punto y las tiendas/ofertas disponibles. Si la distancia es menor o igual al radio seleccionado, el resultado se muestra al usuario.

El cálculo usa una fórmula geográfica basada en la distancia entre dos coordenadas.

## Mapa de calor

El mapa de calor muestra zonas con mayor concentración de ofertas activas.

Flujo:

1. El backend consulta tiendas con ofertas activas.
2. Agrupa por tienda y cuenta la cantidad de ofertas.
3. Devuelve `latitude`, `longitude` y `offerCount`.
4. El frontend usa `leaflet.heat` para representar la intensidad.

Endpoint relacionado:

```http
GET /store/heatmap
```

Respuesta esperada:

```json
[
  {
    "latitude": 13.70,
    "longitude": -89.21,
    "offerCount": 4
  }
]
```

## Valor geográfico del proyecto

La funcionalidad geográfica permite que Ahorra YA no se limite a mostrar registros alfanuméricos, sino que relacione tiendas y ofertas con su ubicación real. Esto facilita la búsqueda de comercios cercanos, el análisis visual de zonas con mayor concentración de ofertas y la navegación hacia una tienda específica.
