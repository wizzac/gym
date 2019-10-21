<g:hiddenField id="desdeFecha" name="desdeFecha" value="${desdeFecha?.format('yyyy-MM-dd')}"></g:hiddenField>
<g:hiddenField id="hastaFecha" name="hastaFecha" value="${hastaFecha?.format('yyyy-MM-dd')}"></g:hiddenField>

<div class="row">
    <div class="col-md-6">
        <label>Ingresos</label>
        <div class="table-responsive">
            <table id="localidadTable" class="table">
                <thead class="text-primary">
                <tr>
                    <th>Descripcion</th>
                    <th>Valor</th>
                </tr>
                </thead>
                <tbody>
                <g:each in="${ingresos}" var="ingreso">
                    <tr id="tr${ingreso?.id}">
                        <td >${ingreso?.descripcion}</td>
                        <td >${ingreso?.valor}</td>
                        <td><button onclick="updatelista(${ingreso.id})" id="${ingreso.id}" update="list" class="btn btn-danger btn-link btn-sm" before="if (!confirm('${message(code: "default.button.delete.confirm.message", default: "Esta seguro que desea continuar?")}')) {return false;}"><i class="material-icons">close</i></button></td>
                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>
        <tr id="trtotal">
            <td >Total:</td>
            <td >${totalIngresos}</td>
        </tr>
    </div>
    <div class="col-md-6">
        <label>Gastos</label>
        <div class="table-responsive">
            <table id="localidadTasdable" class="table">
                <thead class="text-primary">
                <tr>
                    <th>Descripcion</th>
                    <th>Valor</th>
                </tr>
                </thead>
                <tbody>
                <g:each in="${gastos}" var="gasto">
                    <tr id="tr${gasto?.id}" style="color:red">
                        <td >${gasto?.descripcion}</td>
                        <td >${gasto?.valor}</td>
                        <td><button onclick="updatelista(${gasto.id})" id="${gasto.id}" update="list" class="btn btn-danger btn-link btn-sm" before="if (!confirm('${message(code: "default.button.delete.confirm.message", default: "Esta seguro que desea continuar?")}')) {return false;}"><i class="material-icons">close</i></button></td>
                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>
        <tr id="trto12tal2">
            <td >Total:</td>
            <td >${totalGastos}</td>
        </tr>
    </div>
</div>
<br>
<div class="row">
    <div class="col-md-12">
        <tr id="2fsd" style="" >
            <td style=""> <h1>Total:</h1></td>
            <td style=""> <h1>${total}</h1></td>
        </tr>
    </div>
</div>


<script>
    function updatelista(id){
        var id=id;
        var desde=$("#desdeFecha").val();
        var hasta=$("#hastaFecha").val();

        ${remoteFunction(
            controller: "itemContable",
            action: "delete",
            update: "list",
            params: "{desde:desde,hasta:hasta,id:id}"
        )}
    }
</script>