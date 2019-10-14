package security

import grails.transaction.Transactional

import javax.servlet.http.HttpSession

@Transactional
class LoginService {

    def grailsApplication

    def initSession(Usuario usuario, def session) {
        println("User: " + usuario);

        //Cargar usuario en sesion, recuperar permisos y redirigir a home
        session.loggedUser = usuario

        ArrayList<String> array = new ArrayList<String>()
        if (usuario != null && usuario.roles != null) {
            usuario.roles.each {
                it.permisos.each { Permiso p ->
                    array.add(p.name)
                }
            }
        }

        session.permisos = array

        Properties propCfg = grailsApplication.config.toProperties();
        Enumeration ps = propCfg.propertyNames();
        while (ps.hasMoreElements()) {
            String key = ps.nextElement();
            if (key.startsWith("gym.default")) {
                session[key] = propCfg.getProperty(key);
                log.info("Agregando " + key + "=" + session[key] + " ...");
            }
        }
    }
}
