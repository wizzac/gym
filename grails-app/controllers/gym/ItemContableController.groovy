package gym

import java.text.SimpleDateFormat

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

class ItemContableController {


    ItemContableService itemContableService

    def index() {
        render(template: "index", model: [ title: message(code: "categorias.list.label", default: "Items")])
    }


    def filter() {
        def d=params.desde
        def h=params.hasta

        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd")

        Date desde = sdf.parse(d)
        Date hasta = sdf.parse(h)
        def ingresos=ItemContable.findAllByEstadoAndValorGreaterThanAndCreadoBetween(1,0,desde,hasta)
        def gastos=ItemContable.findAllByEstadoAndValorLessThanEqualsAndCreadoBetween(1,0,desde,hasta)
        def totalIngresos=0
        def totalGastos=0
        def total
        for(x in ingresos){
            totalIngresos+=x.valor
        }
        for(x in gastos){
            totalGastos+=x.valor
        }

        total=totalIngresos+totalGastos

        render(template: "list", model: [desdeFecha:desde,hastaFecha:hasta,ingresos:ingresos,gastos:gastos,totalIngresos:totalIngresos,totalGastos:totalGastos,total:total, title: message(code: "categorias.list.label", default: "Items")])
    }

    def create(){
        render template: "create",model: [item: new ItemContable()]
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
        itemInstance= ItemContable.get(params.id)

        itemInstance = itemContableService.delete(itemInstance, session.loggedUser,params)
        itemInstance.validate()
        itemInstance.save(flush: true)

        def d=params.desde
        def h=params.hasta
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd")
        Date desde = sdf.parse(d)
        Date hasta = sdf.parse(h)
        def ingresos=ItemContable.findAllByEstadoAndValorGreaterThanAndCreadoBetween(1,0,desde,hasta)
        def gastos=ItemContable.findAllByEstadoAndValorLessThanEqualsAndCreadoBetween(1,0,desde,hasta)
        def totalIngresos=0
        def totalGastos=0
        def total
        for(x in ingresos){
            totalIngresos+=x.valor
        }
        for(x in gastos){
            totalGastos+=x.valor
        }

        total=totalIngresos+totalGastos

        render(template: "list", model: [desdeFecha:desde,hastaFecha:hasta, ingresos:ingresos,gastos:gastos,totalIngresos:totalIngresos,totalGastos:totalGastos,total:total, title: message(code: "categorias.list.label", default: "Items")])
    }




}
