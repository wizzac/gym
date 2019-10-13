package gym

import nomenclador.EstadoSimple
import nomenclador.Imagen

class Profesor extends EstadoSimple{

    String nombre
    String dni
    String telefono
    String direccion
    String mail
    Imagen foto

    static mapping={
        version(false)
    }
    static constraints = {
    }
}
