<div class="modal fade" id="modal-form" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card card-plain">
                            <div class="card-header card-header-primary">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                    <i class="material-icons">clear</i>
                                </button>
                                <h4 class="card-title"><g:message code="default.new.label" args="[message(code: 'clase', default: 'Clase')]" default="Nuevo ALumno"/></h4>
                            </div>
                            <g:formRemote name="create" update="[success: 'list', failure: 'errors']" url="[resource: clase, action: 'save']" method="POST" onSuccess="closeModal()">
                                <div class="card-body">
                                    <g:render template="form"/>
                                    <br>
                                    <div class="row">
                                        <div class="col-md-4">

                                        </div>
                                        <div class="col-md-8">
                                            <g:submitButton name="create" class="btn btn-success pull-right" value="${message(code: "default.button.save.label", default: "Guardar")}"/>
                                        </div>
                                    </div>
                                </div>
                            </g:formRemote>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="errors"></div>
<div id="modal_view"></div>
<div id="notification"></div>

<script>
    $('#modal-form').modal({
        show: true
    })

    function closeModal() {
        $('#modal-form').modal('hide');
    }
</script>