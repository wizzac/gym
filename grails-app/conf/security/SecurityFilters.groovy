package security

class SecurityFilters {

    def filters = {
//        all(controller:'*', action:'*', controllerExclude: "login|verify|assets|reflection|device|image|syncro|print") {
//            before = {
//                if(!session.loggedUser) {
//                    def msg = "La sesion ha expirado por falta de actividad, por favor vuelva a ingresar"
//                    render(view:'/verify/forceLogin',model:[msg:msg])
//                    return false
//                }
//            }
//        }
    }
}
