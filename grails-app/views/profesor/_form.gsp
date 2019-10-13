<%@ page import="gym.Profesor" %>



<div class="fieldcontain ${hasErrors(bean: profesorInstance, field: 'modificado', 'error')} ">
	<label for="modificado">
		<g:message code="profesor.modificado.label" default="Modificado" />
		
	</label>
	<g:datePicker name="modificado" precision="day"  value="${profesorInstance?.modificado}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: profesorInstance, field: 'usuario', 'error')} ">
	<label for="usuario">
		<g:message code="profesor.usuario.label" default="Usuario" />
		
	</label>
	<g:select id="usuario" name="usuario.id" from="${security.Usuario.list()}" optionKey="id" value="${profesorInstance?.usuario?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: profesorInstance, field: 'creado', 'error')} required">
	<label for="creado">
		<g:message code="profesor.creado.label" default="Creado" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="creado" precision="day"  value="${profesorInstance?.creado}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: profesorInstance, field: 'direccion', 'error')} required">
	<label for="direccion">
		<g:message code="profesor.direccion.label" default="Direccion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="direccion" required="" value="${profesorInstance?.direccion}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: profesorInstance, field: 'dni', 'error')} required">
	<label for="dni">
		<g:message code="profesor.dni.label" default="Dni" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="dni" required="" value="${profesorInstance?.dni}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: profesorInstance, field: 'estado', 'error')} required">
	<label for="estado">
		<g:message code="profesor.estado.label" default="Estado" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="estado" type="number" value="${profesorInstance.estado}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: profesorInstance, field: 'foto', 'error')} required">
	<label for="foto">
		<g:message code="profesor.foto.label" default="Foto" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="foto" name="foto.id" from="${nomenclador.Imagen.list()}" optionKey="id" required="" value="${profesorInstance?.foto?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: profesorInstance, field: 'mail', 'error')} required">
	<label for="mail">
		<g:message code="profesor.mail.label" default="Mail" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="mail" required="" value="${profesorInstance?.mail}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: profesorInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="profesor.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${profesorInstance?.nombre}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: profesorInstance, field: 'telefono', 'error')} required">
	<label for="telefono">
		<g:message code="profesor.telefono.label" default="Telefono" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="telefono" required="" value="${profesorInstance?.telefono}"/>

</div>

