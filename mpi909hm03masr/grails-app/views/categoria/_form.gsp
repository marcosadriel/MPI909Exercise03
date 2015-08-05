<%@ page import="com.mpi909hm03masr.Categoria" %>



<div class="fieldcontain ${hasErrors(bean: categoriaInstance, field: 'catDescricao', 'error')} required">
	<label for="catDescricao">
		<g:message code="categoria.catDescricao.label" default="Cat Descricao" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="catDescricao" required="" value="${categoriaInstance?.catDescricao}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: categoriaInstance, field: 'tarefas', 'error')} ">
	<label for="tarefas">
		<g:message code="categoria.tarefas.label" default="Tarefas" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${categoriaInstance?.tarefas?}" var="t">
    <li><g:link controller="tarefas" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="tarefas" action="create" params="['categoria.id': categoriaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'tarefas.label', default: 'Tarefas')])}</g:link>
</li>
</ul>


</div>

