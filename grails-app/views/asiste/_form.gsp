<%@ page import="gym.Asiste" %>



<div class="fieldcontain ${hasErrors(bean: asisteInstance, field: 'modificado', 'error')} ">
	<label for="modificado">
		<g:message code="asiste.modificado.label" default="Modificado" />
		
	</label>
	<g:datePicker name="modificado" precision="day"  value="${asisteInstance?.modificado}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: asisteInstance, field: 'usuario', 'error')} ">
	<label for="usuario">
		<g:message code="asiste.usuario.label" default="Usuario" />
		
	</label>
	<g:select id="usuario" name="usuario.id" from="${security.Usuario.list()}" optionKey="id" value="${asisteInstance?.usuario?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: asisteInstance, field: 'alumno', 'error')} required">
	<label for="alumno">
		<g:message code="asiste.alumno.label" default="Alumno" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="alumno" name="alumno.id" from="${gym.Alumno.list()}" optionKey="id" required="" value="${asisteInstance?.alumno?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: asisteInstance, field: 'clase', 'error')} required">
	<label for="clase">
		<g:message code="asiste.clase.label" default="Clase" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="clase" name="clase.id" from="${gym.Clase.list()}" optionKey="id" required="" value="${asisteInstance?.clase?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: asisteInstance, field: 'creado', 'error')} required">
	<label for="creado">
		<g:message code="asiste.creado.label" default="Creado" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="creado" precision="day"  value="${asisteInstance?.creado}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: asisteInstance, field: 'estado', 'error')} required">
	<label for="estado">
		<g:message code="asiste.estado.label" default="Estado" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="estado" type="number" value="${asisteInstance.estado}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: asisteInstance, field: 'fecha', 'error')} required">
	<label for="fecha">
		<g:message code="asiste.fecha.label" default="Fecha" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fecha" precision="day"  value="${asisteInstance?.fecha}"  />

</div>

