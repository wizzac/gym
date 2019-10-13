package gym

import grails.transaction.Transactional
import security.Usuario

import java.text.SimpleDateFormat

@Transactional
class ClaseService {


    def save(Clase clase, Usuario loggedUser, def params) {
        SimpleDateFormat sdf = new SimpleDateFormat('yyyy-MM-dd')
        clase.creado = new Date()
        clase.usuario = loggedUser
        clase.estado = 1;
        return clase
    }

    def delete(Clase clase, Usuario loggedUser, def params) {
        SimpleDateFormat sdf = new SimpleDateFormat('dd/MM/yyyy')
        clase.modificado = new Date()
        clase.estado = 0;
        clase.usuario = loggedUser
        return clase

    }

    def update(Clase clase, Usuario loggedUser, def params) {
        clase.modificado = new Date()
        clase.usuario = loggedUser
        return clase

    }
}
