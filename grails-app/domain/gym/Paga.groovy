package gym

import gym.Alumno
import nomenclador.EstadoSimple

class Paga extends EstadoSimple{

    Alumno alumno
    Clase clase
    Integer cantClases
    Date desde
    Date hasta

    static mapping={
        version(false)
    }

    static constraints = {

        cantClases nullable:true
        desde nullable: true
        hasta nullable: true
    }
}
