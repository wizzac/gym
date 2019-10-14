package gym



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class AsisteController {


    AsisteService asisteService

    def index() {
//        List alumnos = .findAllByEstado(1, [max: 10])
//        render(template: "index", model: [alumnos : alumnos , alumnoCount: Alumno.countByEstado(1), title: message(code: "categorias.list.label", default: "Alumnos")])
        render(template: "index", model: [ title: message(code: "categorias.list.label", default: "Asistencia")])
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
            FROM Asiste e 
            join Alumno a on e.alumno_id = a.id
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
                        a.nombre LIKE :term${count}
                        OR a.nombre LIKE :term${count}b
                        OR a.nombre LIKE :term${count}c
                        OR a.dni LIKE :term${count}b
                        OR a.dni LIKE :term${count}c
                        OR a.dni LIKE :term${count}a
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
        List asisteList = Asiste.executeQuery(querySelect + queryWhere + queryOrder, parameters, [max: params.max, offset: params.offset])
        int asisteCount = Asiste.executeQuery("SELECT COUNT(e) FROM Asiste as e join Alumno a on e.alumno_id = a.id" + queryWhere, parameters)[0] as int
        render(template: "list", model: [asisteList: asisteList, asisteCount: asisteCount, parametros: params])
    }

    def list(){

    }

//    def create(){
//        render template: "create",model: [alumno: new Alumno()]
//    }
//
//    def edit(Alumno alumnoInstance){
//        render template: "edit",model: [alumno:alumnoInstance]
//    }

    @javax.transaction.Transactional
    def save(Asiste asisteIntance) {
        asisteIntance= asisteService.save(asisteIntance, session.loggedUser, params)
        asisteIntance.clearErrors()
        asisteIntance.validate()
        if (asisteIntance.hasErrors()) {
            render template:'/errors', model:[failObject: asisteIntance], status:'400'
            return
        }
        asisteIntance.save flush:true
//        render(template: "list", model: [alumnos: Alumno.findAllByEstado(1,[max: 10])])
        render(template: "list", model: [])
    }

    @javax.transaction.Transactional
    def delete(Asiste asisteIntance){
        asisteIntance = asisteService.delete(asisteIntance, session.loggedUser,params)
        asisteIntance.validate()
        asisteIntance.save(flush: true)
        render("")
    }

//    @javax.transaction.Transactional
//    def update(Alumno alumnoInstance){
//        alumnoInstance= alumnoService.update(alumnoInstance, session.loggedUser,params)
//        alumnoInstance.clearErrors()
//        alumnoInstance.validate()
//        if(alumnoInstance.hasErrors()){
//            render template:'/errors', model:[failObject: alumnoInstance], status:'400'
//            return
//        }
//        alumnoInstance.save(flush: true)
//        redirect(action: "renderTableRow", params: [id: alumnoInstance.id])
//    }

    def renderTableRow(Asiste asisteIntance){
        render(template: "tableRow", model: [asiste: asisteIntance])
    }



}
