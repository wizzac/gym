<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="${resource(dir: "images", file: "logoposta.png")}">
    <link rel="icon" type="image/png" href="${resource(dir: "images", file: "logoposta.png")}">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title><g:message code="application.algo.asdsd" default="Resto"/> <g:message code="login.title" default="Acceso"/></title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
    <!--     Fonts and icons     -->
    <link rel="stylesheet" type="text/css" href="${request.contextPath}/material/assets/css/google-roboto.css" />
    <link rel="stylesheet" href="${request.contextPath}/material/assets/css/font-awesome.min.css">
    <!-- CSS Files -->
    <link href="${request.contextPath}/material/assets/css/material-dashboard-pro.min.css?v=2.0.2" rel="stylesheet" />

    <style type="text/css">
    %{--.backImage {--}%
    %{--background-image: url("<g:resource dir="images" file="loginBackground.jpg"/>");--}%
    %{--background-repeat: no-repeat;--}%
    %{--background-size: cover;--}%
    %{--}--}%




    .card .card-header-rose, .card .card-header-rose, .card .card-header-rose:not(.card-header-icon):not(.card-header-text){
        background: linear-gradient(60deg,#737373,#737373);
        color: #737373;
        background-color:#737373;
        box-shadow: 0 4px 20px 0 rgba(0,0,0,.14), 0 7px 10px -5px rgba(45,45,45,.4);
    }

    .btn.btn-rose.btn-link, .btn.btn-rose.btn-link:active, .btn.btn-rose.btn-link:focus, .btn.btn-rose.btn-link:hover {
        background-color: transparent;
        color: #737373;
    }

    a {
        color: #737373;
    }

    </style>

</head>

<body style="background-color:#fff5ef">
<div class="wrapper wrapper-full-page">
    <div class="page-header" filter-color="#EEEEED" %{--style="background-image: url('<g:resource dir="images" file="loginBackground.jpg"/>'); background-size: cover; background-position: top center;"--}%>
        <div class="container">
            <div class="col-lg-4 col-md-6 col-sm-6 ml-auto mr-auto">
                <img class="img-fluid custom-class" style="" src="<g:resource dir="images" file="logoposta.png"/>">
                <br>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-6 ml-auto mr-auto">
                <div class="card card-login card-hidden">
                    <div class="card-header card-header-rose text-center">
                        <h4 class="card-title">
                            %{--<div class="row"><img src="${assetPath(src: 'qilqaLogo.png')}" style="max-height: 100px; max-width: 100px"></div>--}%
                            %{--<div class="row"><g:message code="login.title" default="Acceso"/></div>--}%
                            <g:message code="login.title" default="Acceso al sistema"/>
                        </h4>
                        %{--<div class="social-line">--}%
                        %{--<a href="#" class="btn btn-just-icon btn-simple" style="color: #3b5998" id="facebookLogin" onclick="facebookLogin()">--}%
                        %{--<i class="fab fa-facebook-square"></i>--}%
                        %{--</a>--}%
                        %{--<a href="#" class="btn btn-just-icon btn-simple" style="color: #d62d20" id="googleLogin">--}%
                        %{--<i class="fab fa-google-plus"></i>--}%
                        %{--</a>--}%
                        %{--</div>--}%
                    </div>
                %{--<p class="category text-center">--}%
                %{--- <g:message code="default.or.label" default="O"/> ---}%
                %{--</p>--}%
                    <g:form id="formLogin" controller="login" action="login">
                        <div class="card-body">
                            <span class="bmd-form-group">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">
                                            <i class="material-icons">face</i>
                                        </span>
                                    </div>
                                    %{--<label class="control-label"><g:message code="usuario.username.label" default="Nombre de usuario"/></label>--}%
                                    <g:textField name="userName" required="" class="form-control" placeholder="${message(code: "usuario.username.label", default: "Nombre de usuario")}" value="${username}"/>
                                </div>
                            </span>
                            <br>
                            <span class="bmd-form-group">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">
                                            <i class="material-icons">lock_outline</i>
                                        </span>
                                    </div>
                                    %{--<label class="control-label"><g:message code="usuario.password.label" default="Contraseña"/></label>--}%
                                    <g:passwordField name="password" required="" placeholder="${message(code: "usuario.password.label", default: "Contraseña")}" class="form-control"/>
                                </div>
                            </span>
                        </div>

                    %{--<div class="row">
                        <div class="col-md-12 text-center">
                            <g:link controller="login" action="signup"><g:message code="signup.new.message" default="O registrese aqui"/></g:link>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 text-center">
                            <g:link controller="login" action="cambiarclave"><g:message code="default.password.change.button.label" default="Olvido su contrase&ntilde;a?"/></g:link>
                        </div>
                    </div>--}%
                        <div class="card-footer justify-content-center">
                            <button type="submit" class="btn btn-rose btn-link btn-lg"><g:message code="login.button" default="Acceder"/></button>
                        </div>
                    </g:form>
                </div>
            </div>
        </div>
        <g:render template="/layouts/footer"/>
    </div>
</div>

<div id="nuevoUsuario"></div>

<!--   Core JS Files   -->
<script src="${request.contextPath}/material/assets/js/core/jquery.min.js" type="text/javascript"></script>
<script src="${request.contextPath}/material/assets/js/core/popper.min.js" type="text/javascript"></script>
<script src="${request.contextPath}/material/assets/js/core/bootstrap-material-design.min.js" type="text/javascript"></script>
<script src="${request.contextPath}/material/assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
<!--  Google Maps Plugin    -->
%{--<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>--}%
<!-- Chartist JS -->
<script src="${request.contextPath}/material/assets/js/plugins/chartist.min.js"></script>
<!--  Notifications Plugin    -->
<script src="${request.contextPath}/material/assets/js/plugins/bootstrap-notify.js"></script>

<script>
    $("#userName").focus();

    <g:if test="${msg}">
    $.notify({
        icon: "info",
        message: "${msg}"
    }, {
        type: "${type}",
        timer: 4000,
        placement: {
            from: "top",
            align: "center"
        }
    });
    </g:if>
</script>
</body>
</html>