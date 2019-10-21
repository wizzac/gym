
<div class="row">
    <div class="col-md-6">
        <div class="form-group">
            <label class="bmd-label-floating"><g:message code="nombre" default="Nombre"/></label>
            <g:textField  name="nombre"  class="form-control" value="${clase?.nombre}"/>
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
    <div class="col-md-12">
        <div class="form-group">
            <label class="bmd-label-floating"><g:message code="profesor" default="Profesor"/></label>
            <g:select from="${profesores}"  id="profe" optionKey="id" optionValue="nombre" name="profesor" class="form-control selectInput" value="${clase?.profesor?.id}"/>
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

    <g:if test="${clase?.profesor!=null}">
        $('#profe').val('${clase?.profesor?.id}')
        $('.selectpicker').selectpicker('refresh')
    </g:if>


</script>



