
<div class="row">
    <div class="col-md-6">
        <div class="form-group">
            <label class="bmd-label-floating"><g:message code="nombre" default="Nombre"/></label>
            <g:textField  name="Nombre"  class="form-control" value="${clae?.nombre}"/>
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
            <label class="bmd-label-floating"><g:message code="profesor" default="Nombre"/></label>
            <g:select from="${profesores}"  optionKey="nombre" optionValue="id" name="profesor" class="form-control" value="${clase?.profesor?.id}"/>
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



