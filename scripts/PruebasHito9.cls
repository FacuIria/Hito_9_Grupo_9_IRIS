Class Fixture2030.PruebasHito9 Extends %RegisteredObject
{

ClassMethod Ejecutar()
{
    Write "========================================",!
    Write "HITO 9 - PRUEBAS DE OBJETOS",!
    Write "========================================",!

    Write !,"1) CONSULTA SQL - PARTIDO",!
    Set stmt=##class(%SQL.Statement).%New()
    Set sc=stmt.%Prepare("SELECT ID, PartidoID, EquipoLocal, EquipoVisitante, Sede, Estado FROM Fixture2030.Partido")
    Set rs=stmt.%Execute()

    While rs.%Next() {
        Write rs.%Get("ID")," | ",
              rs.%Get("PartidoID")," | ",
              rs.%Get("EquipoLocal")," | ",
              rs.%Get("EquipoVisitante")," | ",
              rs.%Get("Sede")," | ",
              rs.%Get("Estado"),!
    }

    Write !,"2) CONSULTA SQL - EVENTOS",!
    Set stmt=##class(%SQL.Statement).%New()
    Set sc=stmt.%Prepare("SELECT ID, Tipo, Minuto, Descripcion, Partido FROM Fixture2030.Evento")
    Set rs=stmt.%Execute()

    While rs.%Next() {
        Write rs.%Get("ID")," | ",
              rs.%Get("Tipo")," | minuto ",
              rs.%Get("Minuto")," | ",
              rs.%Get("Descripcion")," | Partido=",
              rs.%Get("Partido"),!
    }

    Write !,"3) NAVEGACION POR OBJETOS",!
    Set partido=##class(Fixture2030.Partido).%OpenId(1)

    If $IsObject(partido) {
        Write "Partido: ",partido.PartidoID,!
        Write "Eventos: ",partido.Eventos.Count(),!

        Set i=""
        For  {
            Set i=partido.Eventos.Next(i)
            Quit:i=""
            Set evento=partido.Eventos.GetAt(i)
            Write evento.Tipo," - minuto ",evento.Minuto,!
        }
    }

    Write !,"4) VALIDACION DE ESTADO",!
    Set partido.Estado="Finalizado"
    Set sc=partido.AgregarEvento("Gol",90,"Evento invalido")

    If $SYSTEM.Status.IsError(sc) {
        Do $SYSTEM.Status.DisplayError(sc)
    }

    Write !,"5) PROPIEDAD REQUIRED",!
    Set p=##class(Fixture2030.Partido).%New()
    Set p.PartidoID="P999"
    Set p.EquipoLocal="AAA"
    Set p.EquipoVisitante="BBB"
    Set p.Fecha="2030-07-01 18:00:00"
    Set p.Estado="Programado"

    Set sc=p.%Save()

    If $SYSTEM.Status.IsError(sc) {
        Write "Carga rechazada correctamente:",!
        Do $SYSTEM.Status.DisplayError(sc)
    } Else {
        Write "ERROR: se esperaba rechazo por propiedad requerida",!
    }

    Write !,"========================================",!
    Write "FIN PRUEBAS HITO 9",!
    Write "========================================",!
}

}
