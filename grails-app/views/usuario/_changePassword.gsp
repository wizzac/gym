<div class="modal fade" id="modal-form-password" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card card-plain">
                            <div class="card-header card-header-primary">
                                <h4 class="card-title"><g:message code="profile.password.change.button" default="Cambiar contraseña"/></h4>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="bmd-label-floating"><g:message code="usuario.password.label" default="Contraseña"/></label>
                                            <g:passwordField name="password" required="" class="form-control" value="${usuario?.password}"/>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="bmd-label-floating"><g:message code="usuario.password.repeat.label" default="Repetir contraseña"/></label>
                                            <g:passwordField name="passwordRepeat" required="" class="form-control"/>
                                        </div>
                                    </div>
                                </div>
                                <button type="button" class="btn btn-primary pull-right" onclick="checkPasswords()"><g:message code="default.button.save.label" default="Guardar"/></button>
                                <button type="button" class="btn btn-danger pull-right" data-dismiss="modal"><g:message code="default.button.close.label" default="Cerrar"/></button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="errorsPass"></div>

<script>
    $('#modal-form-password').modal({
        show: true
    })

    function closeModalPassword() {
        $('#modal-form-password').modal('hide')
    }

    function checkPasswords() {
        var pass = $("#password").val()
        var passRepeat = $("#passwordRepeat").val()

        if(pass.trim().length < 1){
            $.notify({
                icon: "info",
                message: "${message(code: "usuario.password.empty.error", default: "Las contraseña no puede estar vacia")}"
            }, {
                type: "danger",
                timer: 4000,
                placement: {
                    from: "top",
                    align: "right"
                }
            })
        }
        else if(pass.trim() != passRepeat.trim()){
            $.notify({
                icon: "info",
                message: "${message(code: "usuario.password.not.match.error", default: "Las contraseñas ingresadas no coinciden")}"
            }, {
                type: "danger",
                timer: 4000,
                placement: {
                    from: "top",
                    align: "right"
                }
            })
        }
        else {
            ${remoteFunction(
                controller: "usuario",
                action: "savePassword",
                update: "errorsPass",
                params: "{id: ${usuario.id}, password: pass}",
                onSuccess: "closeModalPassword()"
            )}
        }
    }
</script>