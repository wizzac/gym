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
                                <h4 class="card-title"><g:message code="default.show.label" args="[message(code: 'alumno.label', default: 'Alumno')]" default="Ver Producto"/></h4>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="bmd-label-floating"><g:message code="producto.label" default="Nombre"/></label>
                                            <g:textField name="nombre"  class="form-control" value="${alumno?.nombre}" disabled="true"/>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="bmd-label-floating"><g:message code="producto.aglo" default="Dni"/></label>
                                            <g:textField name="dni" class="form-control" disabled="true" value="${alumno?.dni}" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <br>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="bmd-label-floating"><g:message code="producto.algo" default="Fecha de nacimiento"/></label>
                                            <g:textField name="Fecha de nacimiento"  class="form-control" value="${alumno?.fechaDeNacimiento?.format("dd/MM/yyyy")}" disabled="true"/>
                                        </div>
                                    </div>
                                </div>
                                <br>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="bmd-label-floating"><g:message code="producto" default="Puntaje"/></label>
                                            <g:textField name="puntaje" class="form-control" disabled="true" value="${alumno?.puntaje}"/>
                                        </div>
                                    </div>
                                </div>
                                <br>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="bmd-label-floating"><g:message code="producto" default="Telefono"/></label>
                                            <g:textField name="telefono" id="precio" class=" form-control"  disabled="true" value="${alumno?.telefono}"/>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="bmd-label-floating"><g:message code="producto" default="direccion"/></label>
                                            <g:textField name="direccion" id="precio" class=" form-control"  disabled="true" value="${alumno?.direccion}"/>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>

<div id="errors"></div>
<div id="notification"></div>
<script>
    $('#modal-form').modal({
        show: true
    })

    function closeModal() {
        $('#modal-form').modal('hide');
    }

    $('.selectInput').selectpicker({
        style: 'btn-primary',
        noneSelectedText: "-"
    });

    %{--    <g:if test="${producto?.idCategoria!=null}">--}%
    %{--    $('#tipo').val('${producto?.idCategoria?.id}')--}%
    %{--    $('.selectpicker').selectpicker('refresh')--}%
    %{--    </g:if>--}%


</script>