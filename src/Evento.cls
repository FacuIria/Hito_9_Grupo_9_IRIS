Class Fixture2030.Evento Extends %Persistent
{

Property Tipo As %String(MAXLEN = 30) [ Required ];

Property Minuto As %Integer [ Required ];

Property Descripcion As %String(MAXLEN = 200) [ Required ];

Relationship Partido As Fixture2030.Partido
    [ Cardinality = parent, Inverse = Eventos, Required ];

Index PartidoIndex On Partido;

}
