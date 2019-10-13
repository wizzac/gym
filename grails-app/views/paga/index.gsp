
<%@ page import="gym.Paga" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'paga.label', default: 'Paga')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-paga" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-paga" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="modificado" title="${message(code: 'paga.modificado.label', default: 'Modificado')}" />
					
						<th><g:message code="paga.usuario.label" default="Usuario" /></th>
					
						<th><g:message code="paga.alumno.label" default="Alumno" /></th>
					
						<g:sortableColumn property="clases" title="${message(code: 'paga.clases.label', default: 'Clases')}" />
					
						<g:sortableColumn property="creado" title="${message(code: 'paga.creado.label', default: 'Creado')}" />
					
						<g:sortableColumn property="desde" title="${message(code: 'paga.desde.label', default: 'Desde')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${pagaInstanceList}" status="i" var="pagaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${pagaInstance.id}">${fieldValue(bean: pagaInstance, field: "modificado")}</g:link></td>
					
						<td>${fieldValue(bean: pagaInstance, field: "usuario")}</td>
					
						<td>${fieldValue(bean: pagaInstance, field: "alumno")}</td>
					
						<td>${fieldValue(bean: pagaInstance, field: "clases")}</td>
					
						<td><g:formatDate date="${pagaInstance.creado}" /></td>
					
						<td><g:formatDate date="${pagaInstance.desde}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${pagaInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
