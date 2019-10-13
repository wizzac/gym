
<%@ page import="gym.Paga" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'paga.label', default: 'Paga')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-paga" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-paga" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list paga">
			
				<g:if test="${pagaInstance?.modificado}">
				<li class="fieldcontain">
					<span id="modificado-label" class="property-label"><g:message code="paga.modificado.label" default="Modificado" /></span>
					
						<span class="property-value" aria-labelledby="modificado-label"><g:formatDate date="${pagaInstance?.modificado}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${pagaInstance?.usuario}">
				<li class="fieldcontain">
					<span id="usuario-label" class="property-label"><g:message code="paga.usuario.label" default="Usuario" /></span>
					
						<span class="property-value" aria-labelledby="usuario-label"><g:link controller="usuario" action="show" id="${pagaInstance?.usuario?.id}">${pagaInstance?.usuario?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${pagaInstance?.alumno}">
				<li class="fieldcontain">
					<span id="alumno-label" class="property-label"><g:message code="paga.alumno.label" default="Alumno" /></span>
					
						<span class="property-value" aria-labelledby="alumno-label"><g:link controller="alumno" action="show" id="${pagaInstance?.alumno?.id}">${pagaInstance?.alumno?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${pagaInstance?.clases}">
				<li class="fieldcontain">
					<span id="clases-label" class="property-label"><g:message code="paga.clases.label" default="Clases" /></span>
					
						<span class="property-value" aria-labelledby="clases-label"><g:fieldValue bean="${pagaInstance}" field="clases"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pagaInstance?.creado}">
				<li class="fieldcontain">
					<span id="creado-label" class="property-label"><g:message code="paga.creado.label" default="Creado" /></span>
					
						<span class="property-value" aria-labelledby="creado-label"><g:formatDate date="${pagaInstance?.creado}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${pagaInstance?.desde}">
				<li class="fieldcontain">
					<span id="desde-label" class="property-label"><g:message code="paga.desde.label" default="Desde" /></span>
					
						<span class="property-value" aria-labelledby="desde-label"><g:formatDate date="${pagaInstance?.desde}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${pagaInstance?.estado}">
				<li class="fieldcontain">
					<span id="estado-label" class="property-label"><g:message code="paga.estado.label" default="Estado" /></span>
					
						<span class="property-value" aria-labelledby="estado-label"><g:fieldValue bean="${pagaInstance}" field="estado"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pagaInstance?.hasta}">
				<li class="fieldcontain">
					<span id="hasta-label" class="property-label"><g:message code="paga.hasta.label" default="Hasta" /></span>
					
						<span class="property-value" aria-labelledby="hasta-label"><g:formatDate date="${pagaInstance?.hasta}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:pagaInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${pagaInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
