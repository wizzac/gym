package gym

class ClaseController {

    ClaseService claseService

    def index() {
        List clases = Clase.findAllByEstado(1, [max: 10])
        render(template: "index", model: [clases : clases , claseCount: Clase.countByEstado(1), title: message(code: "categorias.list.label", default: "Clases")])
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
            FROM Clase e 
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
        List clases = Clase.executeQuery(querySelect + queryWhere + queryOrder, parameters, [max: params.max, offset: params.offset])
        //Consulta a la base con Count en el Select, y parametros
        int claseCount = Clase.executeQuery("SELECT COUNT(e) FROM Clase as e " + queryWhere, parameters)[0] as int
        render(template: "list", model: [clases: clases, claseCount: claseCount, parametros: params])
    }

    def list(){

    }

    def create(){
        def profesores=Profesor.findAllByEstado(1);
        render template: "create",model: [clase: new Clase(),profesores:profesores]
    }

    def edit(Clase claseInstance){
        def profesores=Profesor.findAllByEstado(1);
        render template: "edit",model: [clase:claseInstance,profesores:profesores]
    }

    @javax.transaction.Transactional
    def save(Clase claseInstance) {
        claseInstance= claseService.save(claseInstance, session.loggedUser, params)
        claseInstance.clearErrors()
        claseInstance.validate()
        if (claseInstance.hasErrors()) {
            render template:'/errors', model:[failObject: claseInstance], status:'400'
            return
        }
        claseInstance.save flush:true
        render(template: "list", model: [clases: Clase.findAllByEstado(1,[max: 10])])
    }

    @javax.transaction.Transactional
    def delete(Clase claseInstance){
        claseInstance = claseService.delete(claseInstance, session.loggedUser,params)
        claseInstance.validate()
        claseInstance.save(flush: true)
        render("")
    }

    @javax.transaction.Transactional
    def update(Clase claseInstance){
        claseInstance= claseService.update(claseInstance, session.loggedUser,params)
        claseInstance.clearErrors()
        claseInstance.validate()
        if(claseInstance.hasErrors()){
            render template:'/errors', model:[failObject: claseInstance], status:'400'
            return
        }
        claseInstance.save(flush: true)
        redirect(action: "renderTableRow", params: [id: claseInstance.id])
    }

    def renderTableRow(Clase claseInstance){
        render(template: "tableRow", model: [clase: claseInstance])
    }

}
