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
                                <h4 class="card-title"><g:message code="default.edit.label" args="[message(code: 'cliente.label', default: 'Pago')]" default="Editar Pago"/></h4>
                            </div>
                            <g:formRemote name="create" update="[success: 'tr' + pago?.id, failure: 'errors']" url="[resource: pago, action: 'update']" method="POST" onSuccess="closeModal()">
                                <div class="card-body">
                                    <g:render template="form"/>
                                    <br>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <button type="submit" class="btn btn-success pull-right"><g:message code="default.button.update.label" default="Actualizar"/></button>
                                            %{--<button type="button" class="btn btn-default pull-right" data-dismiss="modal"><g:message code="default.button.close.label" default="Cerrar"/></button>--}%
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

<div id="modal_view_pass"></div>

<script>
    $('#modal-form').modal({
        show: true
    })

    function closeModal() {
        $('#modal-form').modal('hide');
    }
</script>