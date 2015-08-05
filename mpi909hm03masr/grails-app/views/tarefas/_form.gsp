<%@ page import="com.mpi909hm03masr.Tarefas" %>



<div class="fieldcontain ${hasErrors(bean: tarefasInstance, field: 'categoria', 'error')} required">
	<label for="categoria">
		<g:message code="tarefas.categoria.label" default="Categoria" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="categoria" name="categoria.id" from="${com.mpi909hm03masr.Categoria.list()}" optionKey="id" required="" value="${tarefasInstance?.categoria?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: tarefasInstance, field: 'taskDescricao', 'error')} required">
	<label for="taskDescricao">
		<g:message code="tarefas.taskDescricao.label" default="Task Descricao" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="taskDescricao" required="" value="${tarefasInstance?.taskDescricao}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: tarefasInstance, field: 'taskFinal', 'error')} required">
	<label for="taskFinal">
		<g:message code="tarefas.taskFinal.label" default="Task Final" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="taskFinal" precision="day"  value="${tarefasInstance?.taskFinal}"  />

</div>

