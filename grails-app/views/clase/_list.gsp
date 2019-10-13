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
            <util:remoteSortableColumn class="col-md-2" action="filter" update="list" params="${parametros}" property="precio" title="${message(code: "clase", default: "Precio")}"/>
%{--            <util:remoteSortableColumn class="col-md-2" action="filter" update="list" params="${parametros}" property="puntaje" title="${message(code: "alumno", default: "puntaje")}"/>--}%
%{--            <util:remoteSortableColumn class="col-md-2" action="filter" update="list" params="${parametros}" property="telefono" title="${message(code: "alumno", default: "Telefono")}"/>--}%
            %{--            <util:remoteSortableColumn class="col-md-2" action="filter" update="list" params="${parametros}" property="direccion" title="${message(code: "alumno", default: "Direccion")}"/>--}%
            %{--            <util:remoteSortableColumn class="col-md-2" action="filter" update="list" params="${parametros}" property="mail" title="${message(code: "alumno", default: "mail")}"/>--}%
            <th class="col-md-1"><g:message code="default.button.edit.label" default="Editar"/></th>
            <th class="col-md-1"><g:message code="default.button.delete.label" default="Eliminar"/></th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${clases}" var="clase">
            <tr id="tr${clase.id}">
                <g:render template="tableRow" model="[clase: clase]"/>
            </tr>
        </g:each>
        </tbody>
    </table>
</div>
<div class="pagination">
    <util:remotePaginate action="filter" update="list" params="${parametros}" total="${claseCount ?: 0}" />
</div>
