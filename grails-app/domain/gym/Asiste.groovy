package gym

import nomenclador.EstadoSimple

class Asiste extends EstadoSimple{

    Alumno alumno
    Clase clase
    Date fecha

    static mapping={
        version(false)
    }

    static constraints = {
    }
}
