<style>
.table tr:hover {
    background-color: #ffff99;
}
</style>

<div class="table-responsive">
    <table id="localidadTable" class="table">
        <thead class="text-primary">
        <tr>
            <util:remoteSortableColumn class="col-md-3" action="filter" update="list" params="${parametros}" property="nombre" title="${message(code: "alumno", default: "Nombre")}"/>
            <util:remoteSortableColumn class="col-md-2" action="filter" update="list" params="${parametros}" property="dni" title="${message(code: "alumno", default: "clase")}"/>
            <util:remoteSortableColumn class="col-md-2" action="filter" update="list" params="${parametros}" property="creado" title="${message(code: "alumno", default: "Fecha")}"/>
            <th class="col-md-1"><g:message code="default.button.edit.label" default="Editar"/></th>
            <th class="col-md-1"><g:message code="default.button.delete.label" default="Eliminar"/></th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${pagos}" var="pago">
            <tr id="tr${pago.id}">
                <g:render template="tableRow" model="[pago: pago]"/>
            </tr>
        </g:each>
        </tbody>
    </table>
</div>
<div class="pagination">
    <util:remotePaginate action="filter" update="list" params="${parametros}" total="${pagaCount ?: 0}" />
</div>
