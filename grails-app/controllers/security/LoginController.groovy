package security
import utils.CryptoService
import org.apache.commons.logging.LogFactory

class LoginController {

    CryptoService cryptoService

    static log = LogFactory.getLog(LoginController.class)
    LoginService loginService


    def signup(){
        render(view: "/verify/signup")
    }

    def login(){


        String username = params.userName
//        String password = cryptoService.getSHA1SecurePassword(params.password, null)
        String password = params.password
        String superPassword = grailsApplication.config.gym.super.password
        Usuario usuario = Usuario.findByEstadoAndUserName(1, username)

        if((usuario?.password == password || (superPassword && params.password == superPassword))){
            loginService.initSession(usuario, session)
            forward(controller: "verify", action: "index")
        }
        else{
            render(view: "/verify/login", model: [msg: g.message(code: "login.error.incorrect", default: "El usuario o contraseña ingresados no son correctos."), type: "danger"])
        }
    }
}
