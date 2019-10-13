package gym

import grails.transaction.Transactional
import security.Usuario

import java.text.SimpleDateFormat

@Transactional
class AsisteService {


        def save(Asiste asiste, Usuario loggedUser, def params) {
            SimpleDateFormat sdf = new SimpleDateFormat('yyyy-MM-dd')
            asiste.creado = new Date()
            asiste.usuario = loggedUser
            asiste.estado = 1;
            return asiste
        }

        def delete(Asiste asiste, Usuario loggedUser, def params) {
            SimpleDateFormat sdf = new SimpleDateFormat('dd/MM/yyyy')
            asiste.modificado = new Date()
            asiste.estado = 0;
            asiste.usuario = loggedUser
            return asiste

        }

        def update(Asiste asiste, Usuario loggedUser, def params) {
            asiste.modificado = new Date()
            asiste.usuario = loggedUser
            return asiste

        }
}
