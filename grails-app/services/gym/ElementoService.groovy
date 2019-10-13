package gym

import grails.transaction.Transactional
import security.Usuario

import java.text.SimpleDateFormat

@Transactional
class ElementoService {

    def save(Elemento elemento, Usuario loggedUser, def params) {
        SimpleDateFormat sdf = new SimpleDateFormat('yyyy-MM-dd')
        elemento.creado = new Date()
        elemento.usuario = loggedUser
        elemento.estado = 1;
        return elemento
    }

    def delete(Elemento elemento, Usuario loggedUser, def params) {
        SimpleDateFormat sdf = new SimpleDateFormat('dd/MM/yyyy')
        elemento.modificado = new Date()
        elemento.estado = 0;
        elemento.usuario = loggedUser
        return elemento

    }

    def update(Elemento elemento, Usuario loggedUser, def params) {
        elemento.modificado = new Date()
        elemento.usuario = loggedUser
        return elemento

    }
}
