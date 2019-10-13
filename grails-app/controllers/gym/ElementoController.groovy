package gym

class ElementoController {


    ElementoService elementoService

    def index() {
        List elementos = Elemento.findAllByEstado(1, [max: 10])
        render(template: "index", model: [elementos : elementos , elementoCount: Elemento.countByEstado(1), title: message(code: "categorias.list.label", default: "Elementos")])
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
            FROM Elemento e 
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
        List elementos = Elemento.executeQuery(querySelect + queryWhere + queryOrder, parameters, [max: params.max, offset: params.offset])
        //Consulta a la base con Count en el Select, y parametros
        int elementoCount = Elemento.executeQuery("SELECT COUNT(e) FROM Elemento as e " + queryWhere, parameters)[0] as int
        render(template: "list", model: [elementos: elementos, elementoCount: elementoCount, parametros: params])
    }

    def list(){

    }

    def create(){
        render template: "create",model: [elemento: new Elemento()]
    }

    def edit(Elemento elementoInstance){
        render template: "edit",model: [elemento:elementoInstance]
    }

    @javax.transaction.Transactional
    def save(Elemento elementoInstance) {
        elementoInstance= elementoService.save(elementoInstance, session.loggedUser, params)
        elementoInstance.clearErrors()
        elementoInstance.validate()
        if (elementoInstance.hasErrors()) {
            render template:'/errors', model:[failObject: elementoInstance], status:'400'
            return
        }
        elementoInstance.save flush:true
        render(template: "list", model: [elementos: Elemento.findAllByEstado(1,[max: 10])])
    }

    @javax.transaction.Transactional
    def delete(Elemento elementoInstance){
        elementoInstance = elementoService.delete(elementoInstance, session.loggedUser,params)
        elementoInstance.validate()
        elementoInstance.save(flush: true)
        render("")
    }

    @javax.transaction.Transactional
    def update(Elemento elementoInstance){
        elementoInstance= elementoService.update(elementoInstance, session.loggedUser,params)
        elementoInstance.clearErrors()
        elementoInstance.validate()
        if(elementoInstance.hasErrors()){
            render template:'/errors', model:[failObject: elementoInstance], status:'400'
            return
        }
        elementoInstance.save(flush: true)
        redirect(action: "renderTableRow", params: [id: elementoInstance.id])
    }

    def renderTableRow(Elemento elementoInstance){
        render(template: "tableRow", model: [elemento: elementoInstance])
    }
}
