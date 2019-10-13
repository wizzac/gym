package resto

import security.Usuario
import grails.transaction.Transactional

@Transactional
class VentaService {

    def save(Venta venta, Usuario loggedUser, def params) {
        venta.creado = new Date()
        venta.usuario = loggedUser
        venta.estado=1;
        return venta
    }

    def delete(Venta venta,Usuario loggedUser,def params){
        venta.modificado=new Date()
        venta.estado=0;
        venta.usuario = loggedUser
        return venta
    }

    def update(Venta venta,Usuario loggedUser,def params){
        venta.modificado=new Date()
        venta.usuario = loggedUser
        return venta
    }

}
