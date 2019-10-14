<div class="row">
    <div class="col-md-12">
        <div class="card">
            <div class="card-header card-header-primary">
                <h4 class="card-title"><g:message code="produ.label" default="Asistencia"/></h4>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-md-4">
%{--                        <g:remoteLink action="create" class="btn btn-primary" update="modal_view"><g:message code="default.button.create.label" default="Crear"/></g:remoteLink>--}%
                    </div>
                    <div class="col-md-4"></div>
                    <div class="col-md-4">

                        <g:formRemote name="filter" url="[controller: 'Asiste', action: 'filter', params: parametros]" update="list" class="navbar-form">
                            <div class="input-group no-border">
                                <g:textField name="filtroTexto" class="form-control" placeholder="${message(code: "default.search.label", default: "Buscar")}..."/>
                                <button type="submit" class="btn btn-white btn-round btn-just-icon">
                                    <i class="material-icons">search</i>
                                    <div class="ripple-container"></div>
                                </button>
                            </div>
                        </g:formRemote>

                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="col-md-12" id="list">
%{--                        <g:render template="list" model="[Alumnos: alumnos]"/>--}%
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="modal_view"></div>

<script>
    $("#filtroTexto").on("keyup", function (event) {
        var keycode = (event.keyCode ? event.keyCode : event.which);
        if (keycode == '8' || $(this).val().length > 2) {
            $(this).closest('form').submit();
        }
    })

    changePageTitle("${title}")
</script>