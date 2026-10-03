# Matriz de Integridad

| Regla | Implementación | Resultado |
|---|---|---|
| PartidoID obligatorio | `[ Required ]` | No se guarda sin identificador |
| EquipoLocal obligatorio | `[ Required ]` | La carga falla si falta |
| EquipoVisitante obligatorio | `[ Required ]` | La carga falla si falta |
| Fecha obligatoria | `[ Required ]` | La carga falla si falta |
| Sede obligatoria | `[ Required ]` | La carga falla si falta |
| Estado obligatorio | `[ Required ]` | La carga falla si falta |
| Estado restringido | `VALUELIST` | Solo Programado, EnCurso o Finalizado |
| PartidoID único | `PartidoIDIndex [ Unique ]` | Evita duplicados |
| Evento pertenece a Partido | `Relationship parent/children` | Mantiene integridad estructural |
| Índice en lado hijo | `Index PartidoIndex On Partido` | Evita escaneos completos |
| Partido finalizado no acepta eventos | `AgregarEvento()` | Devuelve error |
| Minuto negativo inválido | `AgregarEvento()` | Devuelve error |
| Propiedad requerida omitida | `%Save()` | IRIS rechaza la persistencia |

## Evidencia de validación

Se intentó agregar un evento a un partido cuyo estado era `Finalizado`.

Resultado:

`ERROR #5001: No se pueden agregar eventos a un partido finalizado`

También se intentó guardar un partido sin `Sede`.

Resultado:

`ERROR #5659: Property 'Fixture2030.Partido::Sede' required`

