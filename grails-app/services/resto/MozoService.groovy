package resto

import grails.transaction.Transactional
import security.Usuario

@Transactional
class MozoService {

    def save(Mozo mozo, Usuario loggedUser, def params) {
        mozo.creado = new Date()
        mozo.usuario = loggedUser
        mozo.estado=1;
        return mozo
    }

    def delete(Mozo mozo,Usuario loggedUser,def params){
        mozo.modificado=new Date()
        mozo.estado=0;
        mozo.usuario = loggedUser
        return mozo

    }

    def update(Mozo mozo,Usuario loggedUser,def params){
        mozo.modificado=new Date()
        mozo.usuario = loggedUser
        return mozo

    }


}
