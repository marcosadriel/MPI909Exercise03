<!--
Autor: Marcos Adriel Sampaio Rost
Data: 20/07/2015
Referência: CAMERON, Dane. A software engineer learns: HTML5, JavaScript e jQuery. Cover Design Studio: 2013.
-->

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>Tarefas</title>
	<link rel="stylesheet" type="text/js" href="<g:createLinkTo dir='css' file='02-tasks.css'/>" media="screen"/>
	<script src= "<g:createLinkTo dir='js' file='jquery-1.11.3.js'/>" type="text/javascript"></script>
	<script src= "<g:createLinkTo dir='js' file='jquery.tmpl.js'/>"></script>
	<script src="<g:createLinkTo dir='js' file='jquery.validate.js'/>"></script>
	<script src= "<g:createLinkTo dir='js' file='jquery-serialization.js'/>"></script>
	<script src= "<g:createLinkTo dir='js' file='tasks-controller.js'/>"></script>
	<script src= "<g:createLinkTo dir='js' file='tasks-webstorage.js'/>"></script>
	<!--<script src= "<g:createLinkTo dir='js' file='tasks-indexeddb.js'/>"></script>-->
	<script src= "<g:createLinkTo dir='js' file='jquery.date.js'/>"></script>
</head>
<body>
	<header>
		<span>Lista de Tarefas</span>
	</header>
	<main id="taskPage">
		<section id="taskCreation" class="not">
			<form id="taskForm">
				<div>
					<label>Tarefa</label>
					<input type="text" required="required" name="task" class="large" placeholder="Estudar e programar" maxlength="200"/>
				</div>
				<div>
					<label>Finalizar até</label> <input type="date" required="required" name="requiredBy" />
				</div>
				<div>
					<label>Categoria</label>
					<select name="category">
						<option value="Pessoal">Pessoal</option>
						<option value="Profissional">Profissional</option>
					</select>
				</div>
				<nav>
					<a href="#" id="saveTask">Salvar tarefa</a> <a href="#" id="clearTask">Limpar tarefa</a>
				</nav>
				<input type="hidden" name="id" />
			</form>
		</section>
		<section>
			<table id="tblTasks">
				<colgroup>
					<col width="40%">
					<col width="15%">
					<col width="15%">
					<col width="30%">
				</colgroup>
				<thead>
					<tr>
						<th>Nome</th>
						<th>Deadline</th>
						<th>Categoria</th>
						<th>Ações</th>
					</tr>
				</thead>
				<tbody>

				</tbody>
			</table>
			<nav>
				<a href="#" id="btnAddTask">Adicionar tarefa</a>
			</nav>
			<a class="large" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
		</section>
	</main>
	<!-- Rodapé padrão:
	<footer>Você tem 3 tarefas</footer> -->
	<footer>Você tem <span id="taskCount"></span> tarefas</footer>
</body>

	<script id="taskRow" type="text/x-jQuery-tmpl">
		<tr>
			<td {{if complete == true}}class="taskCompleted"{{/if}}>${task}</td>
			<td {{if complete == true}}class="taskCompleted"{{/if}}><time datetime="${requiredBy}">${requiredBy}</time></td>
			<td {{if complete == true}}class="taskCompleted"{{/if}}>${category}</td>
			<td>
			<nav>
				{{if complete != true}}
					<a href="#" class="editRow" data-task-id="${id}">Edit</a>
					<a href="#" class="completeRow" data-task-id="${id}">Complete</a>
				{{/if}}
					<a href="#" class="deleteRow" data-task-id="${id}">Delete</a>
			</nav>
			</td>
		</tr>
	</script>
	<script>
		$(document).ready(function() {
			tasksController.init($('#taskPage'));
			tasksController.loadTasks();
		});
	</script>
</html>
