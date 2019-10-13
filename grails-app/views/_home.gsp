
<br>
<br>
%{--<div class="row" id="tablaMesas">--}%
%{--</div>--}%

<div class="row">
    <div class="col-md-6">
        <label class="label">DNI</label>
        <g:textField name="dni"  value="" />
    </div>
    <div class="col-md-6">
        <div id="target">

        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-3">
        <button class="btn btn-dark pull-right" >Buscar</button>
    </div>
</div>
<script>
    %{--$("#tabla").ready(function() {--}%
    %{--    ${remoteFunction(--}%
    %{--       controller: "mesa",--}%
    %{--       action: "listarMesas",--}%
    %{--       update: "tablaMesas"--}%
    %{--    )}--}%
    %{--    }--}%
    %{--);--}%

</script>