package security

import utils.CryptoService
import grails.transaction.Transactional

@Transactional
class UsuarioService {

    CryptoService cryptoService

    def getAllUsers() {
        ArrayList<Usuario> usuarios = Usuario.findAll()

        return usuarios
    }

    def save(Usuario usuario, def activo){
        usuario.password = cryptoService.getSHA1SecurePassword(usuario.password, null)
        if(!activo){
            usuario.estado = 0
        }

        usuario.created = new Date()

        return usuario
    }

    def update(Usuario usuario, def activo){
        if(activo){
            usuario.estado = 1
        }
        else {
            usuario.estado = 0
        }

        usuario.modified = new Date()

        return usuario
    }

    def delete(Usuario usuario){
        usuario.estado = 0
        usuario.modified = new Date()

        return usuario
    }
}
