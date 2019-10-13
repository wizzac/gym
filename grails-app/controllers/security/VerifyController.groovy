package security

class VerifyController {

	def index() {
//		if (session?.loggedUser == null){
//			render (view: "login")
//		} else {
			render (view: "/index")
//		}
	}
		
	def logoff(){
		session.loggedUser = null
		session.permisos = null

		render (view: "login")
	}
	
	def forceLogin(){
		render (view: "forceLogin", model: [msg: msg])
	}

	def home(){
		render(template: "/home")
	}
}
