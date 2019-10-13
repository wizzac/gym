
<div class="row">
    <div class="col-md-12">
        <div class="form-group">
            <label class="bmd-label-floating"><g:message code="profesor" default="Nombre"/></label>
            <g:select from="${profesores}"  optionKey="nombre" optionValue="id" name="profesor" class="form-control" value="${clase?.profesor?.id}"/>
        </div>
    </div>

</div>
<div class="row">
    <div class="col-md-6">
        <div class="form-group">
            <label class="bmd-label-floating"><g:message code="precio" default="Precio"/></label>
            <g:field type="number" name="precio"  class="form-control" value="${clase?.precio}"/>
        </div>
    </div>
    <div class="col-md-6">
        <div class="form-group">
            <label class="bmd-label-floating"><g:message code="producto" default="Dni"/></label>
            <g:field type="number" name="dni"  class="form-control" value="${alumno?.dni}"/>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-6">
        <div class="form-group">
            <label class="bmd-label-floating"><g:message code="producto" default="Direccion"/></label>
            <g:textField name="direccion"  class="form-control" value="${alumno?.direccion}"/>
        </div>
    </div>
    <div class="col-md-6">
        <div class="form-group">
            <label class="bmd-label-floating"><g:message code="producto" default="Fecha de nacimiento"/></label>
            <g:datePicker name="fechaDeNacimiento"  class="form-control" value="${alumno?.fechaDeNacimiento}"/>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-md-6">
        <div class="form-group">
            <label class="bmd-label-floating"><g:message code="producto" default="Puntaje"/></label>
            <g:field type="number" name="puntaje" class="form-control" value="${alumno?.puntaje}"/>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-md-12">
        <div class="form-group">
            <label class="bmd-label-floating"><g:message code="clase" default="Notas"/></label>
            <g:textArea name="notas" class="form-control" value="${clase?.notas}"/>
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



