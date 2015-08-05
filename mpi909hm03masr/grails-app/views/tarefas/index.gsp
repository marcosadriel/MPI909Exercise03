
<%@ page import="com.mpi909hm03masr.Tarefas" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tarefas.label', default: 'Tarefas')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-tarefas" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-tarefas" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="tarefas.categoria.label" default="Categoria" /></th>
					
						<g:sortableColumn property="taskDescricao" title="${message(code: 'tarefas.taskDescricao.label', default: 'Task Descricao')}" />
					
						<g:sortableColumn property="taskFinal" title="${message(code: 'tarefas.taskFinal.label', default: 'Task Final')}" />
					
						<th></th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${tarefasInstanceList}" status="i" var="tarefasInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${tarefasInstance.id}">${fieldValue(bean: tarefasInstance, field: "categoria")}</g:link></td>
					
						<td>${fieldValue(bean: tarefasInstance, field: "taskDescricao")}</td>
					
						<td><g:formatDate date="${tarefasInstance.taskFinal}" /></td>
					
						<td>
							<g:form url="[resource:tarefasInstance, action:'delete']" method="DELETE">
								<fieldset class="buttons">
									<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
								</fieldset>
							</g:form>
						</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${tarefasInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
