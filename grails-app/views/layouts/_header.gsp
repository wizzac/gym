
<nav class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top">
    <div class="container-fluid">
        <div class="navbar-wrapper">
            <div id="pageTitle" class="navbar-brand">
                %{--<g:img class="img-fluid" dir="images" file="logoposta.png" style="width: 50%; height: 500%;" alt="${message(code: "login.welcome", default: "Bienvenido")}"/>--}%
            </div>
        </div>
        <button class="navbar-toggler" type="button" data-toggle="collapse" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
            <span class="sr-only">Toggle navigation</span>
            <span class="navbar-toggler-icon icon-bar"></span>
            <span class="navbar-toggler-icon icon-bar"></span>
            <span class="navbar-toggler-icon icon-bar"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end">
            <form class="navbar-form"></form>
            <ul class="navbar-nav">

                <li class="nav-item dropdown">
                    <a class="nav-link" href="#" id="userMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="material-icons">settings</i>
                        <p class="d-lg-none d-md-block"><g:message code="profile.label" default="Perfil"/></p>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userMenu">
%{--                        <g:remoteLink class="dropdown-item" controller="usuario" action="changePassword" params="[id: session.loggedUser.id]" update="modal_view_password"><g:message code="profile.password.change.button" default="Cambiar contraseña"/></g:remoteLink>--}%
%{--                        <g:link class="dropdown-item" controller="verify" action="logoff"><g:message code="profile.logoff.label" default="Cerrar sesion"/></g:link>--}%
                    </div>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div id="modal_view_password"></div>
<div id="errorsPass"></div>

<script>
    function changePageTitle(title) {
        $("#pageTitle").html(title)
    }
</script>