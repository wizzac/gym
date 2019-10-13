package resto

import security.Usuario
import grails.transaction.Transactional

import java.text.SimpleDateFormat

@Transactional
class CategoriaService {

    def save(Categoria categoria, Usuario loggedUser, def params) {
        SimpleDateFormat sdf=new SimpleDateFormat('yyyy-MM-dd')
        categoria.creado = new Date()
        categoria.usuario = loggedUser
        categoria.estado=1;
        return categoria
    }

    def delete(Categoria categoria,Usuario loggedUser,def params){
        SimpleDateFormat sdf=new SimpleDateFormat('dd/MM/yyyy')
        categoria.modificado=new Date()
        categoria.estado=0;
        categoria.usuario = loggedUser
        return categoria

    }

    def update(Categoria categoria,Usuario loggedUser,def params){
        categoria.modificado=new Date()
        categoria.usuario = loggedUser
        return categoria

    }
}
