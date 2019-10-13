package gym

import nomenclador.EstadoSimple
import nomenclador.Imagen

class Alumno extends EstadoSimple {

    String nombre
    String dni
    Date fechaDeNacimiento
    Integer puntaje
    String notas
    String telefono
    String direccion
    String mail
    Imagen foto


    static mapping ={
        version(false)

    }


    static constraints = {
        foto nullable: true
        dni nullable: true
        notas nullable: true
        fechaDeNacimiento nullable: true
        telefono nullable: true
        direccion nullable: true
        mail nullable: true
    }
}
