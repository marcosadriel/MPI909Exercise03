
<%@ page import="com.mpi909hm03masr.Tarefas" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tarefas.label', default: 'Tarefas')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-tarefas" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-tarefas" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list tarefas">
			
				<g:if test="${tarefasInstance?.categoria}">
				<li class="fieldcontain">
					<span id="categoria-label" class="property-label"><g:message code="tarefas.categoria.label" default="Categoria" /></span>
					
						<span class="property-value" aria-labelledby="categoria-label"><g:link controller="categoria" action="show" id="${tarefasInstance?.categoria?.id}">${tarefasInstance?.categoria?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${tarefasInstance?.taskDescricao}">
				<li class="fieldcontain">
					<span id="taskDescricao-label" class="property-label"><g:message code="tarefas.taskDescricao.label" default="Task Descricao" /></span>
					
						<span class="property-value" aria-labelledby="taskDescricao-label"><g:fieldValue bean="${tarefasInstance}" field="taskDescricao"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tarefasInstance?.taskFinal}">
				<li class="fieldcontain">
					<span id="taskFinal-label" class="property-label"><g:message code="tarefas.taskFinal.label" default="Task Final" /></span>
					
						<span class="property-value" aria-labelledby="taskFinal-label"><g:formatDate date="${tarefasInstance?.taskFinal}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:tarefasInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${tarefasInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
