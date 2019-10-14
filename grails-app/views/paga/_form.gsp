
<div class="row">
    <div class="col-md-6">
        <div class="form-group">
            <label class="bmd-label-floating"><g:message code="alumno" default="Alumno"/></label>
            <g:select from="${alumnos}" optionValue="nombre" optionKey="id" name="nombre"  class="form-control" value="${pago?.alumno?.id}"/>
        </div>
    </div>
    <div class="col-md-6">
        <div class="form-group">
            <label class="bmd-label-floating"><g:message code="alumno" default="Clase"/></label>
            <g:select from="${clases}"  optionValue="nombre" optionKey="id" name="nombre"  class="form-control" value="${pago?.clase?.id}"/>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-6">
        <div class="form-group">
            <label class="bmd-label-floating"><g:message code="producto" default="Cantidad de clases"/></label>
            <g:field type="number" name="cantClases"  class="form-control" value="${pago?.cantClases}"/>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-md-6">
        <div class="form-group">
            <label class="bmd-label-floating"><g:message code="producto" default="Desde"/></label>
            <g:field type="date" name="desde"  class="form-control" value="${pago?.desde}"/>
        </div>
    </div>
    <div class="col-md-6">
        <div class="form-group">
            <label class="bmd-label-floating"><g:message code="producto" default="Hasta"/></label>
            <g:field type="date" name="hasta"  class="form-control" value="${pago?.hasta}"/>
        </div>
    </div>
</div>


<div class="row">
    <div class="col-md-6">
        <div class="form-group">
            <label class="bmd-label-floating"><g:message code="producto" default="Free"/></label>
            <g:checkBox  type="number" name="free"  class="form-control" value="${pago?.free}"/>
        </div>
    </div>
</div>

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



