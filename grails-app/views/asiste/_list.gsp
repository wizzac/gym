<style>
.table tr:hover {
    background-color: #ffff99;
}
</style>

<div class="table-responsive">
    <table id="localidadTable" class="table">
        <thead class="text-primary">
        <tr>
            <util:remoteSortableColumn class="col-md-3" action="filter" update="list" params="${parametros}" property="nombre" title="${message(code: "alumno", default: "Alumno")}"/>
            <util:remoteSortableColumn class="col-md-3" action="filter" update="list" params="${parametros}" property="clase" title="${message(code: "alumno", default: "Clase")}"/>
            <util:remoteSortableColumn class="col-md-2" action="filter" update="list" params="${parametros}" property="dni" title="${message(code: "alumno", default: "Fecha")}"/>
            <th class="col-md-1"><g:message code="default.button.delete.label" default="Eliminar"/></th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${asisteList}" var="asiste">
            <tr id="tr${asiste.id}">
                <g:render template="tableRow" model="[asiste: asiste]"/>
            </tr>
        </g:each>
        </tbody>
    </table>
</div>
<div class="pagination">
    <util:remotePaginate action="filter" update="list" params="${parametros}" total="${asisteCount ?: 0}" />
</div>
