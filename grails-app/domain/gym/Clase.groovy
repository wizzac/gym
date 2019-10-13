package gym

import nomenclador.EstadoSimple

class Clase extends EstadoSimple{

    Profesor profesor
    String nombre
    Double precio

    static hasMany = [ alumnos:Alumno] 

    static mapping={
        version(false)
    }

    static constraints = {
    }
}
