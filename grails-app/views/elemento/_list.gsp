<style>
.table tr:hover {
    background-color: #ffff99;
}
</style>

<div class="table-responsive">
    <table id="localidadTable" class="table">
        <thead class="text-primary">
        <tr>
            <util:remoteSortableColumn class="col-md-3" action="filter" update="list" params="${parametros}" property="nombre" title="${message(code: "clase", default: "Nombre")}"/>
            <util:remoteSortableColumn class="col-md-2" action="filter" update="list" params="${parametros}" property="cantidad" title="${message(code: "clase", default: "cantidad")}"/>

            <th class="col-md-1"><g:message code="default.button.edit.label" default="Editar"/></th>
            <th class="col-md-1"><g:message code="default.button.delete.label" default="Eliminar"/></th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${elementos}" var="elemento">
            <tr id="tr${elemento.id}">
                <g:render template="tableRow" model="[elemento: elemento]"/>
            </tr>
        </g:each>
        </tbody>
    </table>
</div>
<div class="pagination">
    <util:remotePaginate action="filter" update="list" params="${parametros}" total="${elementoCount ?: 0}" />
</div>
