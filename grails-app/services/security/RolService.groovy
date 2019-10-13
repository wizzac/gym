package security

import grails.transaction.Transactional

@Transactional
class RolService {

    def getAllRoles() {
        ArrayList<Rol> roles = Rol.findAll()

        return roles
    }
}
