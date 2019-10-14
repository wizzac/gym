<!doctype html>
<html lang="en">

<head>
    <!--   Core JS Files   -->
    <script src="${request.contextPath}/material/assets/js/core/jquery.min.js" type="text/javascript"></script>
    <script src="${request.contextPath}/material/assets/js/core/popper.min.js" type="text/javascript"></script>
    <script src="${request.contextPath}/material/assets/js/core/bootstrap-material-design.min.js" type="text/javascript"></script>
    <script src="${request.contextPath}/material/assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>


    <meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="${resource(dir: "images", file: "logoposta.png")}">
    <link rel="icon" type="image/png" href="${resource(dir: "images", file: "logoposta.png")}">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="description" content="Mi tiempo " />
    <title><g:message code="application" default="Sistema "/> <g:message code="application" default="gym"/></title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
    <!--     Fonts and icons     -->
    <link rel="stylesheet" type="text/css" href="${request.contextPath}/material/assets/css/google-roboto.css" />
    <link rel="stylesheet" href="${request.contextPath}/material/assets/css/font-awesome.min.css">
    <!-- CSS Files -->
    <link href="${request.contextPath}/material/assets/css/material-dashboard.css?v=2.1.0" rel="stylesheet" />

    <asset:stylesheet src="plugins/bootstrap-select/bootstrap-select.min.css"/>
    <asset:stylesheet src="plugins/jquery-ui-autocomplete/jquery-ui.min.css"/>
    <asset:stylesheet src="spinner.css"/>
    <asset:stylesheet src="qilqa.css"/>
    <g:layoutHead/>
</head>

<body class="sidebar-mini">
<div class="wrapper">

    <g:render template="/layouts/sidebar"/>
    <div class="main-panel">
        <g:render template="/layouts/header"/>
        <div class="content" id="contenido">
            <div class="container-fluid">
                    <g:layoutBody/>
            </div>
        </div>
        <g:render template="/layouts/footer"/>

    </div>
</div>


<!--  Google Maps Plugin    -->
%{--<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>--}%
<!-- Chartist JS -->
<script src="${request.contextPath}/material/assets/js/plugins/chartist.min.js"></script>
<!--  Notifications Plugin    -->
<script src="${request.contextPath}/material/assets/js/plugins/bootstrap-notify.js"></script>

<script src="${request.contextPath}/material/assets/js/material-dashboard.js"></script>

<asset:javascript src="plugins/bootstrap-select/bootstrap-select.min.js"/>

<asset:javascript src="plugins/sweetalert2/sweetalert2.js"/>

<asset:javascript src="plugins/jquery-ui-autocomplete/jquery-ui.min.js"/>

<asset:javascript src="plugins/datejs/date.js"/>

<asset:javascript src="plugins/blockUi/jquery.blockUI.js"/>

<script>
    $("body").ready(function() {
        // show spinner on AJAX start
        enableSpinner()
    });

    var showSpinner = true
    function enableSpinner() {
        $(document).ajaxStart(function(){
            if(showSpinner) {
                // $.("body").block({
                $.blockUI({
                    message: '<div class="lds-roller"><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div></div>',
                    css: {backgroundColor: 'transparent', color: 'transparent', border: 'none', 'z-index': '10001'},
                    overlayCSS: {'z-index': '10000'}
                })
            }
        });

        // hide spinner on AJAX stop
        $(document).ajaxStop(function(){
            if(showSpinner) {
                setTimeout(function () {
                    // $("body").unblock()
                    $.unblockUI()
                }, 100)
            }
        });

        $(document).ajaxError(function(){
            if(showSpinner) {
                setTimeout(function () {
                    // $("body").unblock()
                    $.unblockUI()
                }, 100)
            }
        });
    }
</script>

</body>
</html>