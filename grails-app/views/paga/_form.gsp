<%@ page import="gym.Paga" %>



<div class="fieldcontain ${hasErrors(bean: pagaInstance, field: 'modificado', 'error')} ">
	<label for="modificado">
		<g:message code="paga.modificado.label" default="Modificado" />
		
	</label>
	<g:datePicker name="modificado" precision="day"  value="${pagaInstance?.modificado}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: pagaInstance, field: 'usuario', 'error')} ">
	<label for="usuario">
		<g:message code="paga.usuario.label" default="Usuario" />
		
	</label>
	<g:select id="usuario" name="usuario.id" from="${security.Usuario.list()}" optionKey="id" value="${pagaInstance?.usuario?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: pagaInstance, field: 'alumno', 'error')} required">
	<label for="alumno">
		<g:message code="paga.alumno.label" default="Alumno" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="alumno" name="alumno.id" from="${gym.Alumno.list()}" optionKey="id" required="" value="${pagaInstance?.alumno?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: pagaInstance, field: 'clases', 'error')} required">
	<label for="clases">
		<g:message code="paga.clases.label" default="Clases" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="clases" type="number" value="${pagaInstance.clases}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: pagaInstance, field: 'creado', 'error')} required">
	<label for="creado">
		<g:message code="paga.creado.label" default="Creado" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="creado" precision="day"  value="${pagaInstance?.creado}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: pagaInstance, field: 'desde', 'error')} required">
	<label for="desde">
		<g:message code="paga.desde.label" default="Desde" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="desde" precision="day"  value="${pagaInstance?.desde}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: pagaInstance, field: 'estado', 'error')} required">
	<label for="estado">
		<g:message code="paga.estado.label" default="Estado" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="estado" type="number" value="${pagaInstance.estado}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: pagaInstance, field: 'hasta', 'error')} required">
	<label for="hasta">
		<g:message code="paga.hasta.label" default="Hasta" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="hasta" precision="day"  value="${pagaInstance?.hasta}"  />

</div>

