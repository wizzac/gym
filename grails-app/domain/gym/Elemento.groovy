package gym

import nomenclador.EstadoSimple

class Elemento extends EstadoSimple{

    String nombre
    String descripcion
    Integer cantidad

    static mapping={
        version(false);
    }
    static constraints = {
    }
}
