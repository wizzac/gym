package gym

import grails.transaction.Transactional
import security.Usuario

import java.text.SimpleDateFormat

@Transactional
class AlumnoService {

    def save(Alumno alumno, Usuario loggedUser, def params) {
        SimpleDateFormat sdf = new SimpleDateFormat('yyyy-MM-dd')
        alumno.creado = new Date()
        alumno.usuario = loggedUser
        alumno.estado = 1;
        return alumno
    }

    def delete(Alumno alumno, Usuario loggedUser, def params) {
        SimpleDateFormat sdf = new SimpleDateFormat('dd/MM/yyyy')
        alumno.modificado = new Date()
        alumno.estado = 0;
        alumno.usuario = loggedUser
        return alumno

    }

    def update(Alumno alumno, Usuario loggedUser, def params) {
        alumno.modificado = new Date()
        alumno.usuario = loggedUser
        return alumno

    }
}