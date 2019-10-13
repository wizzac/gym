
<div class="row">
    <div class="col-md-6">
        <div class="form-group">
            <label class="bmd-label-floating"><g:message code="nombre" default="Nombre"/></label>
            <g:textField  name="nombre"  class="form-control" value="${elemento?.nombre}"/>
        </div>

    </div>
</div>
<div class="row">
    <div class="col-md-6">
        <div class="form-group">
            <label class="bmd-label-floating"><g:message code="precio" default="Cantidad"/></label>
            <g:field type="number" name="cantidad"  class="form-control" value="${elemento?.cantidad}"/>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <div class="form-group">
            <label class="bmd-label-floating"><g:message code="precio" default="Descripcion"/></label>
            <g:textArea name="descripcion"  class="form-control" value="${elemento?.descripcion}"/>
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



