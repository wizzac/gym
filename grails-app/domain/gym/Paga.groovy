package gym

import gym.Alumno
import nomenclador.EstadoSimple

class Paga extends EstadoSimple{

    Alumno alumno
    Integer  clases
    Date desde
    Date hasta

    static mapping={
        version(false)
    }

    static constraints = {
    }
}
