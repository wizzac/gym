<td onclick="showProducto('${profesor.id}')">${profesor.nombre}</td>
<td onclick="showProducto('${profesor.id}')">${profesor?.dni}</td>
<td onclick="showProducto('${profesor.id}')">${profesor?.telefono}</td>
<td onclick="showProducto('${profesor.id}')">${profesor?.direccion}</td>

<td><g:remoteLink action="edit" id="${profesor.id}" update="modal_view" class="btn btn-primary btn-link btn-sm"><i class="material-icons">edit</i></g:remoteLink></td>
<td><g:remoteLink action="delete" id="${profesor.id}" update="tr${profesor.id}" class="btn btn-danger btn-link btn-sm" before="if (!confirm('${message(code: "default.button.delete.confirm.message", default: "Esta seguro que desea continuar?")}')) {return false;}"><i class="material-icons">close</i></g:remoteLink></td>


<script>
    %{--function showProducto(id){--}%
    %{--    var id=id;--}%

    %{--    ${remoteFunction(--}%
    %{--        controller: "alumno",--}%
    %{--        action: "modalShow",--}%
    %{--        update: "modal_view",--}%
    %{--        params: "{id:id}"--}%
    %{--    )}--}%
    %{--}--}%
</script>
