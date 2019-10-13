package nomenclador

abstract class FileDescriptor extends Vigente{

    String descripcion
    String nombre
    String path

    static constraints = {
        descripcion nullable:true
        nombre nullable: true
        path nullable:true
    }
}
