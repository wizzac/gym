package gym



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

class ItemContableController {


    ItemContableService itemContableService

    def index() {
        render(template: "index", model: [ title: message(code: "categorias.list.label", default: "Items")])
    }


    def list(){

    }

    def create(){
        render template: "create",model: [item: new ItemContable()]
    }

    def edit(ItemContable itemInstance){
        render template: "edit",model: [item:itemInstance]
    }

    @javax.transaction.Transactional
    def save(ItemContable itemInstance) {
        itemInstance= itemContableService.save(itemInstance, session.loggedUser, params)
        itemInstance.clearErrors()
        itemInstance.validate()
        if (itemInstance.hasErrors()) {
            render template:'/errors', model:[failObject: itemInstance], status:'400'
            return
        }
        itemInstance.save flush:true
        render(text: "")
    }

    @javax.transaction.Transactional
    def delete(ItemContable itemInstance){
        itemInstance = itemContableService.delete(itemInstance, session.loggedUser,params)
        itemInstance.validate()
        itemInstance.save(flush: true)
        render("")
    }

    @javax.transaction.Transactional
    def update(ItemContable itemInstance){
        itemInstance= itemContableService.update(itemInstance, session.loggedUser,params)
        itemInstance.clearErrors()
        itemInstance.validate()
        if(itemInstance.hasErrors()){
            render template:'/errors', model:[failObject: itemInstance], status:'400'
            return
        }
        itemInstance.save(flush: true)
        redirect(action: "renderTableRow", params: [id: itemInstance.id])
    }

    def renderTableRow(ItemContable itemInstance){
        render(template: "tableRow", model: [item: itemInstance])
    }
}
