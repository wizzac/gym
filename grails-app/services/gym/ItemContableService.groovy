package gym

import com.sun.mail.imap.protocol.Item
import grails.transaction.Transactional
import security.Usuario

import java.text.SimpleDateFormat

@Transactional
class ItemContableService {


    def save(ItemContable item, Usuario loggedUser, def params) {
        SimpleDateFormat sdf = new SimpleDateFormat('yyyy-MM-dd')
        item.creado = new Date()
        item.usuario = loggedUser
        item.estado = 1;
        return item
    }

    def delete(ItemContable item, Usuario loggedUser, def params) {
        SimpleDateFormat sdf = new SimpleDateFormat('dd/MM/yyyy')
        item.modificado = new Date()
        item.estado = 0;
        item.usuario = loggedUser
        return item

    }

    def update(ItemContable item, Usuario loggedUser, def params) {
        item.modificado = new Date()
        item.usuario = loggedUser
        return item

    }
}
