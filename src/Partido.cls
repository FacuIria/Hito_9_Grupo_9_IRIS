Class Fixture2030.Partido Extends %Persistent
{

Property PartidoID As %String(MAXLEN = 10) [ Required ];

Property EquipoLocal As %String(MAXLEN = 10) [ Required ];

Property EquipoVisitante As %String(MAXLEN = 10) [ Required ];

Property Fecha As %TimeStamp [ Required ];

Property Sede As %String(MAXLEN = 100) [ Required ];

Property Estado As %String(
    VALUELIST = ",Programado,EnCurso,Finalizado"
) [ Required ];

Relationship Eventos As Fixture2030.Evento
    [ Cardinality = children, Inverse = Partido ];

Index PartidoIDIndex On PartidoID [ Unique ];

Method AgregarEvento(
    tipo As %String,
    minuto As %Integer,
    descripcion As %String
) As %Status
{
    If ..Estado = "Finalizado" {
        Write "ERROR: no se pueden agregar eventos a un partido finalizado",!
        Quit $SYSTEM.Status.Error(5001,"No se pueden agregar eventos a un partido finalizado")
    }

    If minuto < 0 {
        Write "ERROR: minuto invalido",!
        Quit $SYSTEM.Status.Error(5001,"El minuto no puede ser negativo")
    }

    Set evento = ##class(Fixture2030.Evento).%New()

    Set evento.Tipo = tipo
    Set evento.Minuto = minuto
    Set evento.Descripcion = descripcion

    Do ..Eventos.Insert(evento)

    Quit 1
}

}
