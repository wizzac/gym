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

    boolean equals(o) {
        if (this.is(o)) return true
        if (getClass() != o.class) return false

        Clase clase = (Clase) o

        if (id != clase.id) return false

        return true
    }

    int hashCode() {
        return (id != null ? id.hashCode() : 0)
    }
}
