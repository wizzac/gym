package security

import utils.CryptoService
import grails.transaction.Transactional

@Transactional(readOnly = true)
class UsuarioController {

    UsuarioService usuarioService
    CryptoService cryptoService

    def filter(){
        params.max = params.max ? params.int("max") : 10
        params.offset = params.offset ? params.int("offset") : 0

        List usuarios = Usuario.createCriteria().list {
            if(params.sort) {
                order(params.sort, params.order ?: "asc")
            }
            maxResults(params.max)
            firstResult(params.offset)
        }

        int usuarioCount = Usuario.count()

        render(template: "list", model: [usuarios: usuarios, usuarioCount: usuarioCount, parametros: params])
    }

    @Transactional
    def savePassword(Usuario usuarioInstance) {
        usuarioInstance.password = cryptoService.getSHA1SecurePassword(params.password, null)
        usuarioInstance = usuarioService.update(usuarioInstance, true)

        usuarioInstance.validate()
        if (usuarioInstance.hasErrors()) {
            render template:'/errors', model:[failObject: usuarioInstance], status:'400'
            return
        }

        usuarioInstance.save flush:true

        render("")
    }

    def changePassword(Usuario usuario){
        render(template: "changePassword", model: [usuario: usuario])
    }
}
