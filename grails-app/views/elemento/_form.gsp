<%@ page import="gym.Elemento" %>



<div class="fieldcontain ${hasErrors(bean: elementoInstance, field: 'modificado', 'error')} ">
	<label for="modificado">
		<g:message code="elemento.modificado.label" default="Modificado" />
		
	</label>
	<g:datePicker name="modificado" precision="day"  value="${elementoInstance?.modificado}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: elementoInstance, field: 'usuario', 'error')} ">
	<label for="usuario">
		<g:message code="elemento.usuario.label" default="Usuario" />
		
	</label>
	<g:select id="usuario" name="usuario.id" from="${security.Usuario.list()}" optionKey="id" value="${elementoInstance?.usuario?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: elementoInstance, field: 'cantidad', 'error')} required">
	<label for="cantidad">
		<g:message code="elemento.cantidad.label" default="Cantidad" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="cantidad" type="number" value="${elementoInstance.cantidad}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: elementoInstance, field: 'creado', 'error')} required">
	<label for="creado">
		<g:message code="elemento.creado.label" default="Creado" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="creado" precision="day"  value="${elementoInstance?.creado}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: elementoInstance, field: 'descripcion', 'error')} required">
	<label for="descripcion">
		<g:message code="elemento.descripcion.label" default="Descripcion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descripcion" required="" value="${elementoInstance?.descripcion}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: elementoInstance, field: 'estado', 'error')} required">
	<label for="estado">
		<g:message code="elemento.estado.label" default="Estado" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="estado" type="number" value="${elementoInstance.estado}" required=""/>

</div>

