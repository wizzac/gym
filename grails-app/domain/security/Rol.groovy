package security


class Rol {
	String description
	String name

	static hasMany = [usuarios: Usuario, permisos: Permiso]
	static belongsTo = Usuario

	static constraints = {
		description blank: false, size: 2..50
		name blank: false, size: 2..50
	}
	static mapping = {
		version false
		usuarios ignoreNotFound: true
		table 'sec_rol'		
	}

	def String toString(){
		return description.toString()
	}
}
