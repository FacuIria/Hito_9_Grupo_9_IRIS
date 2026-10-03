# Hito 9 - InterSystems IRIS - Entidades Complejas
## Grupo 9 - Fixture Mundial 2030

Este módulo implementa una parte estructural compleja del Fixture Mundial 2030 utilizando InterSystems IRIS.

Se utiliza el modelo orientado a objetos para representar entidades con herencia, relaciones padre-hijo y reglas de integridad encapsuladas.

---

## Tecnología

- InterSystems IRIS Community
- Docker
- Docker Compose
- ObjectScript
- SQL

Imagen utilizada:

`intersystems/iris-community:latest-cd`

Versión observada durante las pruebas:

`IRIS 2026.2 Build 221U`

Arquitectura observada:

`ARM64 Containers`

---

## Persistencia

Los datos persistentes de IRIS se almacenan en:

`~/docker/data/iris`

Dentro del contenedor:

`/durable`

La variable:

`ISC_DATA_DIRECTORY=/durable/iris`

permite mantener Durable %SYS fuera del contenedor.

---

## Estructura

```text
Grupo_9_Hito_9_IRIS_Entidades_Complejas/
├── docker-compose.yml
├── README.md
├── .gitignore
├── src/
│   ├── Persona.cls
│   ├── Jugador.cls
│   ├── Arbitro.cls
│   ├── Partido.cls
│   └── Evento.cls
├── scripts/
│   ├── CargaObjetos.cls
│   └── PruebasHito9.cls
└── docs/
    ├── modelo_objetos.md
    ├── matriz_integridad.md
    └── evidencia/
