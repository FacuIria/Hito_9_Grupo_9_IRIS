# Modelo de Objetos - Hito 9

## Tecnología

El módulo utiliza InterSystems IRIS como base orientada a objetos y multimodelo.

## Clases principales

### Persona

Clase persistente base.

Propiedades:

- Nombre
- Apellido
- Nacionalidad
- FechaNacimiento

### Jugador

Hereda de `Persona`.

Propiedades adicionales:

- NumeroCamiseta
- Posicion
- CodigoEquipo

### Arbitro

Hereda de `Persona`.

Propiedades adicionales:

- Categoria
- Internacional

### Partido

Clase persistente principal.

Propiedades:

- PartidoID
- EquipoLocal
- EquipoVisitante
- Fecha
- Sede
- Estado

Método:

`AgregarEvento()`

Este método implementa reglas de integridad del dominio.

### Evento

Clase persistente hija.

Propiedades:

- Tipo
- Minuto
- Descripcion

Cada Evento pertenece a un Partido.

---

## Herencia

```text
              Persona
              /     \
         Jugador   Arbitro

