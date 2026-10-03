Class Fixture2030.CargaObjetos Extends %RegisteredObject
{

ClassMethod Ejecutar() As %Status
{
    Write "========================================",!
    Write "HITO 9 - CARGA DE OBJETOS",!
    Write "========================================",!

    Set stmt=##class(%SQL.Statement).%New()
    Set sc=stmt.%Prepare("SELECT ID FROM Fixture2030.Partido WHERE PartidoID = ?")

    If $SYSTEM.Status.IsError(sc) {
        Do $SYSTEM.Status.DisplayError(sc)
        Quit sc
    }

    Set rs=stmt.%Execute("P001")

    If rs.%Next() {
        Set partido=##class(Fixture2030.Partido).%OpenId(rs.%Get("ID"))

        Write "Partido P001 ya existente.",!
        Write "No se crea un duplicado.",!
        Write "ID interno Partido: ",partido.%Id(),!
        Write "Cantidad de eventos: ",partido.Eventos.Count(),!

        Quit 1
    }

    Set partido=##class(Fixture2030.Partido).%New()

    Set partido.PartidoID="P001"
    Set partido.EquipoLocal="AAA"
    Set partido.EquipoVisitante="AAB"
    Set partido.Fecha="2030-06-10 18:00:00"
    Set partido.Sede="Estadio Buenos Aires"
    Set partido.Estado="EnCurso"

    Write "Partido creado en memoria",!

    Set sc=partido.AgregarEvento(
        "Gol",
        23,
        "Gol del equipo local"
    )

    If $SYSTEM.Status.IsError(sc) {
        Do $SYSTEM.Status.DisplayError(sc)
        Quit sc
    }

    Set sc=partido.AgregarEvento(
        "TarjetaAmarilla",
        41,
        "Tarjeta amarilla al visitante"
    )

    If $SYSTEM.Status.IsError(sc) {
        Do $SYSTEM.Status.DisplayError(sc)
        Quit sc
    }

    Write "Eventos hijos agregados en memoria",!

    Set sc=partido.%Save()

    If $SYSTEM.Status.IsError(sc) {
        Write "ERROR guardando partido",!
        Do $SYSTEM.Status.DisplayError(sc)
        Quit sc
    }

    Write "Guardado atomico completado",!
    Write "ID interno Partido: ",partido.%Id(),!
    Write "Cantidad de eventos: ",partido.Eventos.Count(),!

    Quit 1
}

}
