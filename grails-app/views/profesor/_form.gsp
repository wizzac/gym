
<div class="row">
    <div class="col-md-12">
        <div class="form-group">
            <label class="bmd-label-floating"><g:message code="alumno" default="Nombre"/></label>
            <g:textField name="nombre"  class="form-control" value="${profesor?.nombre}"/>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-6">
        <div class="form-group">
            <label class="bmd-label-floating"><g:message code="producto" default="Telefono"/></label>
            <g:textField name="telefono"  class="form-control" value="${profesor?.telefono}"/>
        </div>
    </div>
    <div class="col-md-6">
        <div class="form-group">
            <label class="bmd-label-floating"><g:message code="producto" default="Dni"/></label>
            <g:field type="number" name="dni"  class="form-control" value="${profesor?.dni}"/>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-6">
        <div class="form-group">
            <label class="bmd-label-floating"><g:message code="producto" default="Direccion"/></label>
            <g:textField  name="direccion"  class="form-control" value="${profesor?.direccion}"/>
        </div>
    </div>
    <div class="col-md-6">
        <div class="form-group">
            <label class="bmd-label-floating"><g:message code="producto" default="Mail"/></label>
            <g:textField name="mail"  class="form-control" value="${profesor?.mail}"/>
        </div>
    </div>
</div>

<br>



<div id="errors"></div>
<div id="modal_viewer"></div>
<div id="notification"></div>

<script>
    $('.selectInput').selectpicker({
        style: 'btn-primary',
        noneSelectedText: "-"
    });

    %{--<g:if test="${producto?.idCategoria!=null}">--}%
    %{--$('#tipo').val('${producto?.idCategoria?.id}')--}%
    %{--$('.selectpicker').selectpicker('refresh')--}%
    %{--</g:if>--}%


</script>



