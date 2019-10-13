package gym


import javax.transaction.Transactional

class AlumnoController {


    AlumnoService alumnoService

    def index() {
        List alumnos = Alumno.findAllByEstado(1, [max: 10])
        render(template: "index", model: [alumnos : alumnos , alumnoCount: Alumno.countByEstado(1), title: message(code: "categorias.list.label", default: "Alumnos")])
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
            FROM Alumno e 
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
        List alumnos = Alumno.executeQuery(querySelect + queryWhere + queryOrder, parameters, [max: params.max, offset: params.offset])
        //Consulta a la base con Count en el Select, y parametros
        int alumnoCount = Alumno.executeQuery("SELECT COUNT(e) FROM Alumno as e " + queryWhere, parameters)[0] as int
        render(template: "list", model: [alumnos: alumnos, alumnoCount: alumnoCount, parametros: params])
    }

    def list(){

    }

    def create(){
        render template: "create",model: [alumno: new Alumno()]
    }

    def edit(Alumno alumnoInstance){
        render template: "edit",model: [alumno:alumnoInstance]
    }

    @Transactional
    def save(Alumno alumnoInstance) {
        alumnoInstance= alumnoService.save(alumnoInstance, session.loggedUser, params)
        alumnoInstance.clearErrors()
        alumnoInstance.validate()
        if (alumnoInstance.hasErrors()) {
            render template:'/errors', model:[failObject: alumnoInstance], status:'400'
            return
        }
        alumnoInstance.save flush:true
        render(template: "list", model: [alumnos: Alumno.findAllByEstado(1,[max: 10])])
    }

    @Transactional
    def delete(Alumno alumnoInstance){
        alumnoInstance = alumnoService.delete(alumnoInstance, session.loggedUser,params)
        alumnoInstance.validate()
        alumnoInstance.save(flush: true)
        render("")
    }

    @Transactional
    def update(Alumno alumnoInstance){
        alumnoInstance= alumnoService.update(alumnoInstance, session.loggedUser,params)
        alumnoInstance.clearErrors()
        alumnoInstance.validate()
        if(alumnoInstance.hasErrors()){
            render template:'/errors', model:[failObject: alumnoInstance], status:'400'
            return
        }
        alumnoInstance.save(flush: true)
        redirect(action: "renderTableRow", params: [id: alumnoInstance.id])
}

    def renderTableRow(Alumno alumnoInstance){
        render(template: "tableRow", model: [alumno: alumnoInstance])
    }



}
