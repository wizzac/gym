package gym

import grails.transaction.Transactional
import security.Usuario

import java.text.SimpleDateFormat

@Transactional
class PagaService {

    def save(Paga paga, Usuario loggedUser, def params) {
        SimpleDateFormat sdf = new SimpleDateFormat('yyyy-MM-dd')
        paga.creado = new Date()
        paga.usuario = loggedUser
        paga.estado = 1;
        return paga
    }

    def delete(Paga paga, Usuario loggedUser, def params) {
        SimpleDateFormat sdf = new SimpleDateFormat('dd/MM/yyyy')
        paga.modificado = new Date()
        paga.estado = 0;
        paga.usuario = loggedUser
        return paga

    }

    def update(Paga paga, Usuario loggedUser, def params) {
        paga.modificado = new Date()
        paga.usuario = loggedUser
        return paga

    }
}
