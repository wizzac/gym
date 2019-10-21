<div class="row">
    <div class="col-md-12">
        <div class="card">
            <div class="card-header card-header-primary">
                <h4 class="card-title"><g:message code="produ.label" default="Item Contable"/></h4>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-md-4">
                        <g:remoteLink action="create" class="btn btn-primary" update="modal_view"><g:message code="default.button.create.label" default="Crear"/></g:remoteLink>
                    </div>
                    <div class="col-md-4"></div>
                    <div class="col-md-4">


                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="col-md-3">
                        <label>Desde:</label>
                        <g:field type="date" id="desde" class="form-control" name="desde" value="${new Date().format("yyyy-MM-dd")}"></g:field>
                    </div>
                    <div class="col-md-3">
                        <label>Hasta:</label>
                        <g:field type="date" id="hasta" class="form-control" name="desde" value="${new Date().format("yyyy-MM-dd")}"></g:field>
                    </div>
%{--                    <g:remoteLink action="filter" class="btn btn-primary" update="list"><g:message code="asd" default="Buscar"/></g:remoteLink>--}%
                    <button  class="btn btn-primary" onclick="showProducto()"><g:message code="asd" default="Buscar"/></button>
                </div>
                <br>
                <div id="list"></div>

            </div>
        </div>
    </div>
</div>

<div id="modal_view"></div>

<script>
    function showProducto(){

        var desde=$("#desde").val();
        var hasta=$("#hasta").val();
        ${remoteFunction(
            controller: "itemContable",
            action: "filter",
            update: "list",
            params: "{desde:desde,hasta:hasta}"
        )}
    }
    changePageTitle("${title}")
</script>