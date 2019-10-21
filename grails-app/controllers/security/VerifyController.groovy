package security

class VerifyController {

	def index() {
//		if (session?.loggedUser == null){
			render (view: "/index")
//		} else {

//			render (view: "/index")
//		}
	}

	def login(){
		render view:"login"
	}


	def logoff(){
		session.loggedUser = null
		session.permisos = null
		render (view: "../index")
	}
	
	def forceLogin(){
		render (view: "forceLogin", model: [msg: msg])
	}

	def home(){
		render(template: "/home")
	}
}
