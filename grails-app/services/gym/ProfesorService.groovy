package gym

import grails.transaction.Transactional
import security.Usuario

import java.text.SimpleDateFormat

@Transactional
class ProfesorService {

    def save(Profesor profesor, Usuario loggedUser, def params) {
        SimpleDateFormat sdf = new SimpleDateFormat('yyyy-MM-dd')
        profesor.creado = new Date()
        profesor.usuario = loggedUser
        profesor.estado = 1;
        return profesor
    }

    def delete(Profesor profesor, Usuario loggedUser, def params) {
        SimpleDateFormat sdf = new SimpleDateFormat('dd/MM/yyyy')
        profesor.modificado = new Date()
        profesor.estado = 0;
        profesor.usuario = loggedUser
        return profesor

    }

    def update(Profesor profesor, Usuario loggedUser, def params) {
        profesor.modificado = new Date()
        profesor.usuario = loggedUser
        return profesor

    }
}
