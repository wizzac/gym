package gym

import java.text.SimpleDateFormat

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

class PagaController {

    PagaService pagaService

    def index() {
        List pagos = Paga.findAllByEstado(1, [max: 10])
        render(template: "index", model: [pagos : pagos , claseCount: Paga.countByEstado(1), title: message(code: "categorias.list.label", default: "Pagos")])
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
            FROM Paga e 
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
        List pagos = Paga.executeQuery(querySelect + queryWhere + queryOrder, parameters, [max: params.max, offset: params.offset])
        //Consulta a la base con Count en el Select, y parametros
        int pagoCount = Paga.executeQuery("SELECT COUNT(e) FROM Paga as e " + queryWhere, parameters)[0] as int
        render(template: "list", model: [pagos: pagos, pagaCount: pagoCount, parametros: params])
    }

    def list(){

    }

    def create(){
        def clases=Clase.findAllByEstado(1)
        def alumnos=Alumno.findAllByEstado(1)
        render template: "create",model: [Paga: new Paga(),clases:clases,alumnos:alumnos]
    }

    def edit(Paga pagaInstance){
        def clases=Clase.findAllByEstado(1)
        def alumnos=Alumno.findAllByEstado(1)
        render template: "edit",model: [paga:pagaInstance,clases:clases,alumnos:alumnos]
    }

    @javax.transaction.Transactional
    def save(Paga pagaInstance) {
        def fecha=params.desde
        def fechahasta=params.hasta
        String free=params.free
        if(free.equalsIgnoreCase("on")){
            pagaInstance.free=1;
        }else{
            pagaInstance.free=null

        }
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd")
        Date dateDesde=sdf.parse(fecha)
        Date dateHasta=sdf.parse(fechahasta)
        pagaInstance.desde=dateDesde
        pagaInstance.hasta=dateHasta
        pagaInstance= pagaService.save(pagaInstance, session.loggedUser, params)
        pagaInstance.clearErrors()
        pagaInstance.validate()
        if (pagaInstance.hasErrors()) {
            render template:'/errors', model:[failObject: pagaInstance], status:'400'
            return
        }

        ItemContable ic=new ItemContable();
        ic.creado=new Date()
        ic.descripcion="Pago Clase "+pagaInstance.clase.nombre
        ic.valor=pagaInstance?.clase?.precio;
        ic.validate()
        ic.save(flush: true)


        pagaInstance.itemContable=ic

        pagaInstance.save flush:true
        render(template: "list", model: [pagos: Paga.findAllByEstado(1,[max: 10])])
    }

    @javax.transaction.Transactional
    def delete(Paga pagaInstance){
        pagaInstance = pagaService.delete(pagaInstance, session.loggedUser,params)
        pagaInstance.validate()
        pagaInstance.save(flush: true)

        ItemContable ic=ItemContable.get(pagaInstance.itemContable)
        ic.estado=0
        ic.modificado=new Date()
        ic.validate()
        ic.save(flush: true)
        render("")
    }

    @javax.transaction.Transactional
    def update(Paga pagaInstance){

        def fecha=params.desde

        def fechahasta=params.hasta
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd")
        Date dateDesde=sdf.parse(fecha)
        Date dateHasta=sdf.parse(fechahasta)
        String free=params.free
        if(free.equalsIgnoreCase("on")){
            pagaInstance.free=1;
        }else{
            pagaInstance.free=null

        }
        pagaInstance.desde=dateDesde
        pagaInstance.hasta=dateHasta
        pagaInstance.clearErrors()
        pagaInstance.validate()
        pagaInstance= pagaService.update(pagaInstance, session.loggedUser,params)
        if(pagaInstance.hasErrors()){
            render template:'/errors', model:[failObject: pagaInstance], status:'400'
            return
        }
        pagaInstance.save(flush: true)
        redirect(action: "renderTableRow", params: [id: pagaInstance.id])
    }

    def renderTableRow(Paga pagaInstance){
        render(template: "tableRow", model: [paga: pagaInstance])
    }


    def generarAsiste(){

    }



}
