
<br>
<br>
%{--<div class="row" id="tablaMesas">--}%
%{--</div>--}%

<div class="row">
    <div class="col-md-6">
        <label class="label">DNI</label>
        <g:textField name="dni"  id="dni" value="" />
        <div class="row">
            <div class="col-md-6">
                <button class="btn btn-dark pull-right"  id="search">Buscar</button>
            </div>
        </div>
    </div>
    <div class="col-md-6">
        <div id="target">

        </div>
    </div>
</div>


<div id="errors"></div>


<script>
    $("#search").click(function() {
        var dni= $("#dni").val();
        ${remoteFunction(
           controller: "asiste",
           action: "buscar",
           update:[success: 'target', failure: 'errors'],
           params:"{dni:dni}"
        )}
        }
    );

</script>