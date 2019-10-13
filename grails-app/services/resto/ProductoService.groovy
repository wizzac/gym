package resto

import security.Usuario
import grails.transaction.Transactional

import java.text.SimpleDateFormat

@Transactional
class ProductoService {

    def save(Producto producto, Usuario loggedUser, def params) {
        SimpleDateFormat sdf=new SimpleDateFormat('yyyy-MM-dd')
        producto.creado = new Date()
        producto.usuario = loggedUser
        producto.estado=1;
        return producto
    }

    def delete(Producto producto,Usuario loggedUser,def params){
        SimpleDateFormat sdf=new SimpleDateFormat('dd/MM/yyyy')
        producto.modificado=new Date()
        producto.estado=0;
        producto.usuario = loggedUser
        return producto

    }

    def update(Producto producto,Usuario loggedUser,def params){
        producto.modificado=new Date()
        producto.usuario = loggedUser
        return producto

    }
}
