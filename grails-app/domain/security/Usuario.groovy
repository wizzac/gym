package security

class Usuario {
	short id
	String userName
	String firstName
	String lastName
	String password
	Date created = new Date();
	Date modified
	Integer estado = 1

	String facebookId
	String googleId

	static hasMany = [roles: Rol]
	
    static mapping = {
		version false
		roles ignoreNotFound: true
		table 'sec_usuario'
	}
	static constraints = {
		firstName nullable: true
		lastName nullable: true
		estado nullable: true
		modified nullable: true
		facebookId nullable: true
		googleId nullable: true
	}

	String toString(){
		return firstName + " " + lastName
	}
	
	String apellidoNombre(){
		return  lastName + ((lastName.trim().length() > 0) && (firstName.trim().length() > 0) ? " " : "") + firstName
	}

	String getPermisos(){
		ArrayList<String> permisos = []
		for (Rol rol in roles){
			for (Permiso permiso in rol.permisos){
				permisos.add(permiso.name)
			}
		}

		return permisos
	}
}
