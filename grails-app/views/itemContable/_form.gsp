
<div class="row">
    <div class="col-md-12">
        <div class="form-group">
            <label class="bmd-label-floating"><g:message code="alumno" default="Descripcion"/></label>
            <g:textField name="descripcion" class="form-control" value="${item?.descripcion}"/>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-md-12">
        <div class="form-group">
            <label class="bmd-label-floating"><g:message code="alumno" default="valor"/></label>
            <g:field type="number" name="valor" class="form-control" value="${item?.valor}"/>
        </div>
    </div>
</div>