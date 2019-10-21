package security

class SecurityFilters {

    def filters = {
        all(controller:'paga', action:'*',controllerExclude: "login|verify") {
            before = {
                if(!session.loggedUser) {
                    def msg = "La sesion ha expirado por falta de actividad, por favor vuelva a ingresar"
                    render(view:'/verify/forceLogin',model:[msg:msg])
                    return false
                }
            }
        }

    }
}
