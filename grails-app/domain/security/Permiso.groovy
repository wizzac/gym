package security

class Permiso {
	String description
	String name

	static hasMany = [roles: Rol]
	static belongsTo = Rol

	static constraints = {
		name blank: false, size: 2..100
		description blank: false, size: 2..250
	}
	static mapping = {
		version false
		table 'sec_permiso'
	}    
	def String toString(){
		return description.toString()
	}
}
