package resto

import grails.transaction.Transactional
import security.Usuario

@Transactional
class MesaService {

    def save(Mesa mesa, Usuario loggedUser, def params) {
        mesa.creado = new Date()
        mesa.usuario = loggedUser
        mesa.estado=1;
        return mesa
    }

    def delete(Mesa mesa,Usuario loggedUser,def params){
        mesa.modificado=new Date()
        mesa.estado=0;
        mesa.usuario = loggedUser
        return mesa

    }

    def update(Mesa mesa,Usuario loggedUser,def params){
        mesa.modificado=new Date()
        mesa.usuario = loggedUser
        return mesa

    }
}
