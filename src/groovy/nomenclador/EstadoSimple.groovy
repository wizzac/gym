package nomenclador

import security.Usuario


abstract class EstadoSimple {
	int estado = 1
    Date creado = new Date()
    Date modificado
	Usuario usuario
	static constraints = {
		modificado nullable:true
		usuario nullable:true

	}
}
