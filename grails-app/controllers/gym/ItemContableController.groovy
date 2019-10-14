package gym



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ItemContableController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ItemContable.list(params), model:[itemContableInstanceCount: ItemContable.count()]
    }

    def show(ItemContable itemContableInstance) {
        respond itemContableInstance
    }

    def create() {
        respond new ItemContable(params)
    }

    @Transactional
    def save(ItemContable itemContableInstance) {
        if (itemContableInstance == null) {
            notFound()
            return
        }

        if (itemContableInstance.hasErrors()) {
            respond itemContableInstance.errors, view:'create'
            return
        }

        itemContableInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'itemContable.label', default: 'ItemContable'), itemContableInstance.id])
                redirect itemContableInstance
            }
            '*' { respond itemContableInstance, [status: CREATED] }
        }
    }

    def edit(ItemContable itemContableInstance) {
        respond itemContableInstance
    }

    @Transactional
    def update(ItemContable itemContableInstance) {
        if (itemContableInstance == null) {
            notFound()
            return
        }

        if (itemContableInstance.hasErrors()) {
            respond itemContableInstance.errors, view:'edit'
            return
        }

        itemContableInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ItemContable.label', default: 'ItemContable'), itemContableInstance.id])
                redirect itemContableInstance
            }
            '*'{ respond itemContableInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ItemContable itemContableInstance) {

        if (itemContableInstance == null) {
            notFound()
            return
        }

        itemContableInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ItemContable.label', default: 'ItemContable'), itemContableInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'itemContable.label', default: 'ItemContable'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
