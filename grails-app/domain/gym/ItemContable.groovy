package gym

import nomenclador.EstadoSimple

class ItemContable extends EstadoSimple{

    Double valor
    String descripcion


    static mapping = {
        version(false)
    }

    static constraints = {

    }
}
