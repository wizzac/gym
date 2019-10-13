package gym



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ProfesorController {

    ProfesorService profesorService

    def index() {
        List profesores = Profesor.findAllByEstado(1, [max: 10])
        render(template: "index", model: [profesores : profesores , profesorCount: Profesor.countByEstado(1), title: message(code: "categorias.list.label", default: "Profesores")])
    }

    def filter(){
        params.max = params.max ? params.int("max") : 10
        params.offset = params.offset ? params.int("offset") : 0
        ArrayList<String> filtroTexto = params.filtroTexto?.split(" ") //Terminos para filtrar separados por espacio
        int count = 0 //Contador de terminos en filtroTexto
        String queryWhere, querySelect, queryOrder = "" //Query separada en tres partes
        Map parameters = [:] //Mapa de parametros

        //Select de la query de filtro
        querySelect = """
            SELECT e 
            FROM Profesor e 
        """
        //Where de la query
        queryWhere = """
            WHERE e.estado = 1
        """
        if(filtroTexto){
            //Si existen terminos para filtrar
            for (String texto in filtroTexto){
                //Por cada termino busca que una de las columnas a filtrar empieze con ese termino o con el termino
                // mas un espacio al principio (eg. por si ponen nombre y apellido en la misma columna)
                queryWhere += """
                    AND(
                        e.nombre LIKE :term${count}
                        OR e.nombre LIKE :term${count}b
                        OR e.nombre LIKE :term${count}c
                    )
                """
                //Cada termino se agrega al mapa de parametros con y sin espacio
                parameters.put("term" + count, texto + "%")
                parameters.put("term" + count + "b", "% " + texto + "%")
                parameters.put("term" + count + "c", "%" + texto + "%")
                count++
            }
        }
        if(params.sort){
            //Order by de la query si hay que ordenar el paginado
            queryOrder = """
                ORDER BY e.${params.sort} ${params.order ?: "asc"}
            """
        }

        //Consulta a la base con la query, parametros y paginado
        List profesores = Profesor.executeQuery(querySelect + queryWhere + queryOrder, parameters, [max: params.max, offset: params.offset])
        //Consulta a la base con Count en el Select, y parametros
        int profesorCount = Profesor.executeQuery("SELECT COUNT(e) FROM Profesor as e " + queryWhere, parameters)[0] as int
        render(template: "list", model: [profesores: profesores, profesorCount: profesorCount, parametros: params])
    }

    def list(){

    }

    def create(){
        render template: "create",model: [profesor: new Profesor()]
    }

    def edit(Profesor profesorInstance){
        render template: "edit",model: [profesor:profesorInstance]
    }

    @javax.transaction.Transactional
    def save(Profesor profesorInstance) {
        profesorInstance= profesorService.save(profesorInstance, session.loggedUser, params)
        profesorInstance.clearErrors()
        profesorInstance.validate()
        if (profesorInstance.hasErrors()) {
            render template:'/errors', model:[failObject: profesorInstance], status:'400'
            return
        }
        profesorInstance.save flush:true
        render(template: "list", model: [profesores: Profesor.findAllByEstado(1,[max: 10])])
    }

    @javax.transaction.Transactional
    def delete(Profesor profesorInstance){
        profesorInstance = profesorService.delete(profesorInstance, session.loggedUser,params)
        profesorInstance.validate()
        profesorInstance.save(flush: true)
        render("")
    }

    @javax.transaction.Transactional
    def update(Profesor profesorInstance){
        profesorInstance= progesorService.update(profesorInstance, session.loggedUser,params)
        profesorInstance.clearErrors()
        profesorInstance.validate()
        if(profesorInstance.hasErrors()){
            render template:'/errors', model:[failObject: profesorInstance], status:'400'
            return
        }
        profesorInstance.save(flush: true)
        redirect(action: "renderTableRow", params: [id: profesorInstance.id])
    }

    def renderTableRow(Profesor profesorInstance){
        render(template: "tableRow", model: [profesor: profesorInstance])
    }

}
